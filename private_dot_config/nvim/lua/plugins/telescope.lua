return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- find
      { "<leader>ff", LazyVim.pick("find_files", { root = false }), desc = "Find Files (cwd)" },
      { "<leader>fF", LazyVim.pick("find_files"), desc = "Find Files (Root Dir)" },
      { "<leader>fr", LazyVim.pick("oldfiles", { cwd = vim.uv.cwd() }), desc = "Recent (cwd)" },
      { "<leader>fR", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
      {
        "<leader>f.",
        function()
          require("telescope.builtin").find_files({ cwd = vim.fn.expand("%:p:h") })
        end,
        desc = "Find Sibling Files of Current File",
      },
      {
        "<leader>fP",
        function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
      -- git
      { "<leader>gB", "<cmd>Telescope git_branches<cr>", desc = "Branches" },
      { "<leader>gf", "<cmd>Telescope git_bcommits<cr>", desc = "Telescope Current File History" },
      -- search
      { "<leader>s<space>", "<cmd>Telescope builtin<cr>", desc = "Builtin" },
      { "<leader>s:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      { "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Commands" },
      { "<leader>sC", false },
      { "<leader>sg", LazyVim.pick("live_grep", { root = false }), desc = "Grep (cwd)" },
      { "<leader>sG", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
      { "<leader>sw", LazyVim.pick("grep_string", { root = false, word_match = "-w" }), desc = "Word (cwd)" },
      { "<leader>sW", LazyVim.pick("grep_string", { word_match = "-w" }), desc = "Word (Root Dir)" },
      { "<leader>sw", LazyVim.pick("grep_string", { root = false }), mode = "v", desc = "Selection (cwd)" },
      { "<leader>sW", LazyVim.pick("grep_string"), mode = "v", desc = "Selection (Root Dir)" },
    },
    opts = function(_, opts)
      local telescope_config = require("telescope.config")

      -- Clone the default Telescope configuration
      local vimgrep_arguments = { unpack(telescope_config.values.vimgrep_arguments) }

      -- Search in hidden/dot files.
      table.insert(vimgrep_arguments, "--hidden")
      -- Don't search in the `.git` directory.
      table.insert(vimgrep_arguments, "--glob")
      table.insert(vimgrep_arguments, "!**/.git/*")

      local find_files_with_hidden = function()
        local action_state = require("telescope.actions.state")
        local line = action_state.get_current_line()
        LazyVim.pick("find_files", {
          -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
          find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
          default_text = line,
          root = false,
        })()
      end

      local action_layout = require("telescope.actions.layout")

      opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
        prompt_prefix = " ",
        selection_caret = " ",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            preview_width = 0.55,
          },
          prompt_position = "top",
        },
        sorting_strategy = "ascending",
        -- path_display = { "smart" },
        dynamic_preview_title = true,
        winblend = 0,
        -- `hidden = true` is not supported in text grep commands.
        vimgrep_arguments = vimgrep_arguments,
        mappings = {
          n = {
            ["<M-p>"] = action_layout.toggle_preview,
          },
          i = {
            ["<M-p>"] = action_layout.toggle_preview,
            ["<a-h>"] = find_files_with_hidden,
          },
        },
      })

      opts.pickers = vim.tbl_deep_extend("force", opts.pickers or {}, {
        current_buffer_fuzzy_find = {
          previewer = false,
        },
      })
    end,
  },

  {
    "debugloop/telescope-undo.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    keys = {
      {
        "<leader>U",
        "<cmd>Telescope undo<cr>",
        desc = "Undo History",
      },
    },
    opts = {
      extensions = {
        undo = {
          -- side_by_side = true,
          -- layout_strategy = "vertical",
          -- layout_config = {
          --   preview_height = 0.5,
          -- },
        },
      },
    },
    config = function(_, opts)
      -- Calling telescope's setup from multiple specs does not hurt, it will happily merge the
      -- configs for us.
      require("telescope").setup(opts)
      require("telescope").load_extension("undo")
    end,
  },

  {
    "nvim-telescope/telescope-symbols.nvim",
    keys = {
      {
        "<leader>s.",
        function()
          require("telescope.builtin").symbols(require("telescope.themes").get_dropdown({ previewer = false }))
        end,
        desc = "Symbols",
      },
    },
  },

  {
    "2kabhishek/nerdy.nvim",
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-telescope/telescope.nvim",
    },
    cmd = "Nerdy",
    keys = {
      { "<leader>si", "<Cmd>Nerdy<CR>", desc = "Nerd Icons/Glyphs" },
    },
  },
}
