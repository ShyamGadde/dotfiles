return {
  {
    "nvim-telescope/telescope.nvim",
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
        sorting_strategy = "ascending",
        winblend = 0,
        path_display = { "smart" },
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
    "2kabhishek/nerdy.nvim",
    cmd = "Nerdy",
    keys = {
      { "<leader>si", "<cmd>Nerdy<cr>", desc = "Icons" },
    },
  },
}
