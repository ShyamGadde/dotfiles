return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
    },
    opts = function(_, opts)
      local action_layout = require("telescope.actions.layout")

      opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            preview_width = 0.5,
          },
          prompt_position = "top",
        },
        dynamic_preview_title = true,
        sorting_strategy = "ascending",
        winblend = 0,
        -- path_display = { "smart" },
        mappings = {
          n = {
            ["<M-p>"] = action_layout.toggle_preview,
          },
          i = {
            ["<M-p>"] = action_layout.toggle_preview,
          },
        },
      })
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
