return {
  {
    "nvim-telescope/telescope.nvim",
    optional = true,
    keys = {
      -- find
      { "<leader>ff", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
      { "<leader>fF", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
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
        LazyVim.pick("files", { cwd = require("lazy.core.config").options.root }),
        desc = "Find Plugin File",
      },
      -- git
      { "<leader>gB", "<cmd>Telescope git_branches<cr>", desc = "Branches" },
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

      local action_layout = require("telescope.actions.layout")

      local defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
        prompt_prefix = " ",
        selection_caret = " ",
        layout_config = {
          horizontal = {
            preview_width = 0.55,
          },
          height = 0.65,
          prompt_position = "top",
        },
        sorting_strategy = "ascending",
        path_display = { "smart" },
        dynamic_preview_title = true,
        winblend = 0,
        -- `hidden = true` is not supported in text grep commands.
        vimgrep_arguments = vimgrep_arguments,
        mappings = {
          n = {
            ["<A-p>"] = action_layout.toggle_preview,
          },
          i = {
            ["<A-p>"] = action_layout.toggle_preview,
          },
        },
      })

      opts.defaults = require("telescope.themes").get_ivy(defaults)

      opts.pickers = vim.tbl_deep_extend("force", opts.pickers or {}, {
        current_buffer_fuzzy_find = {
          previewer = false,
        },
        find_files = {
          mappings = {
            n = {
              ["cd"] = function(prompt_bufnr)
                local selection = require("telescope.actions.state").get_selected_entry()
                local dir = vim.fn.fnamemodify(selection.path, ":p:h")
                require("telescope.actions").close(prompt_bufnr)
                -- Depending on what you want put `cd`, `lcd`, `tcd`
                vim.cmd(string.format("silent lcd %s", dir))
              end,
            },
          },
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
        desc = "Undo Tree",
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
    dependencies = { "nvim-telescope/telescope.nvim" },
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
    dependencies = { "nvim-telescope/telescope.nvim" },
    cmd = "Nerdy",
    keys = {
      { "<leader>si", "<Cmd>Nerdy<CR>", desc = "Nerd Icons/Glyphs" },
    },
  },
}
