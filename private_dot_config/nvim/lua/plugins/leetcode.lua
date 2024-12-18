-- local leet_arg = 'leetcode.nvim'
local leet_arg = "lc"

return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-treesitter/nvim-treesitter",
    -- '3rd/image.nvim',
  },
  lazy = leet_arg ~= vim.fn.argv()[1],
  opts = {
    arg = leet_arg,
    lang = "python3",
    storage = {
      home = os.getenv("HOME") .. "/Workspace/leetcode",
    },
    injector = {
      ["python3"] = {
        before = {
          "from typing import List, Optional",
        },
      },
    },
    -- image_support = true,
  },
  config = function(_, opts)
    require("leetcode").setup(opts)

    local update_repo = function()
      local repo_path = opts.storage.home
      local noti_title = "leetcode.nvim"

      -- NOTE: This script sometimes may not work as expected with more than one change.
      -- If there are multiple changes, e.g., if a file is already staged and there is also a new file,
      -- then they both will end up in the same commit since there is not additional logic to prioritize the staged file.
      local script = string.format(
        [=[
          cd %s
          if ! git rev-parse --is-inside-work-tree &> /dev/null; then
            echo "Not a Git repository: $(pwd)" >&2
            exit 1
          fi

          commit_change() {
            local status="$1"
            local file="$2"
            local message=""

            if [[ "$status" == "??" || "$status" == "A" ]]; then
                git add "$file"
                message="Add $file"
            elif [[ "$status" == "M" ]]; then
                git add "$file"
                message="Update $file"
            elif [[ "$status" == "MM" ]]; then
                message="Update $file"
            else
                echo "MSG: Unhandled status for $file: $status"
                return
            fi

            echo "MSG: $message"
            git commit -m "$message"
          }

          git status --porcelain | while read -r status file; do
              commit_change "$status" "$file"
          done

          git push
        ]=],
        repo_path
      )

      vim.notify("Updating Repository...", 2, { title = noti_title })

      local stdout = {}
      local stderr = {}

      vim.fn.jobstart({ "bash", "-c", script }, {
        stdout_buffered = true,
        on_stdout = function(_, data)
          if data then
            for _, line in ipairs(data) do
              local msg = line:match("^MSG: (.*)")

              if msg then
                table.insert(stdout, "- " .. msg)
              end
            end
          end
        end,

        stderr_buffered = true,
        on_stderr = function(_, data)
          if data then
            for _, line in ipairs(data) do
              table.insert(stderr, line)
            end
          end
        end,

        on_exit = function(_, exit_code)
          if exit_code == 0 then
            vim.notify(table.concat(stdout, "\n"), 2, {
              title = noti_title,
              icon = "",
            })
          else
            vim.notify(table.concat(stderr, "\n"), 4, {
              title = noti_title,
            })
          end
        end,
      })
    end

    require("which-key").add({
      { "<leader>l", group = "+leetcode", icon = "󱁊" },
      { "<leader>lR", "<Cmd> Leet reset <CR>", desc = "Reset Solution", icon = "" },
      { "<leader>ld", "<Cmd> Leet desc toggle <CR>", desc = "Toggle Description" },
      { "<leader>li", "<Cmd> Leet info <CR>", desc = "Show Question Information" },
      { "<leader>ll", "<Cmd> Leet last_submit <CR>", desc = "Retrieve Last Submitted Code" },
      { "<leader>lm", "<Cmd> Leet menu <CR>", desc = "Open Menu", icon = "󰍜" },
      { "<leader>lo", "<Cmd> Leet open <CR>", desc = "Open in browser", icon = "󰖟" },
      { "<leader>lq", "<Cmd> Leet exit <CR>", desc = "Quit" },
      { "<leader>lr", "<Cmd> Leet run <CR>", desc = "Run Solution", icon = "" },
      { "<leader>ls", "<Cmd> Leet submit <CR>", desc = "Submit Solution", icon = "󰅧" },
      { "<leader>lu", update_repo, desc = "Update Repository (Commit and Push)", icon = "" },
    })
  end,
}
