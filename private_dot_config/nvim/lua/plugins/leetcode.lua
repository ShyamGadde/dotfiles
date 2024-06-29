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
    "rcarriga/nvim-notify",
    "nvim-tree/nvim-web-devicons",
    -- '3rd/image.nvim',
  },
  lazy = leet_arg ~= vim.fn.argv()[1],
  config = function()
    require("leetcode").setup({
      arg = leet_arg,
      lang = "python3",
      storage = {
        home = "~/Workspace/leetcode",
      },
      injector = {
        ["python3"] = {
          before = true,
        },
      },
      -- image_support = true,
    })

    require("which-key").register({
      ["<leader>l"] = {
        name = "+leetcode",
        d = { "<Cmd> Leet desc toggle <CR>", "Toggle Description" },
        m = { "<Cmd> Leet menu <CR>", "Open Menu" },
        i = { "<Cmd> Leet info <CR>", "Show Question Information" },
        r = { "<Cmd> Leet run <CR>", "Run Solution" },
        s = { "<Cmd> Leet submit <CR>", "Submit Solution" },
        R = { "<Cmd> Leet last_submit <CR>", "Retrieve Last Submitted Code" },
        b = { "<Cmd> Leet open <CR>", "Open in browser" },
        q = { "<Cmd> Leet exit <CR>", "Quit" },
      },
    })

    local function update_repo()
      local script = vim.fn.getcwd() .. "/update_repo.sh"

      if vim.fn.filereadable(script) == 1 then
        vim.notify("Updating repository...", vim.log.levels.INFO, {
          title = "Update Repo",
        })

        local messages = {}

        vim.fn.jobstart(script, {
          stdout_buffered = true,
          on_stdout = function(_, data)
            if data then
              for _, line in ipairs(data) do
                local info = line:match("^INFO: (.*)")

                if info then
                  table.insert(messages, "- " .. info)
                end
              end
            end
          end,

          on_exit = function(_, exit_code)
            local message = table.concat(messages, "\n")

            if exit_code == 0 then
              vim.notify(message, vim.log.levels.INFO, {
                title = "Update Repo",
                icon = "",
              })
            else
              vim.notify("Repository update failed", vim.log.levels.ERROR, {
                title = "Update Repo",
              })
            end
          end,
        })
      else
        vim.notify("'update_repo.sh' not found in the current directory.", vim.log.levels.ERROR, {
          title = "Update Repo",
        })
      end
    end

    vim.keymap.set("n", "<leader>lu", update_repo, { desc = "Update Repository (Commit and Push)" })
  end,
}
