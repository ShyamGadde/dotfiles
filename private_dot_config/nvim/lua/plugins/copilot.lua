return {
  -- {
  --   "zbirenbaum/copilot.lua",
  --   opts = {
  --     filetypes = {
  --       ["*"] = true,
  --     },
  --   },
  -- },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    optional = true,
    opts = {
      auto_insert_mode = true,
      auto_follow_cursor = false,
      show_help = true,
      window = {
        width = 0.3,
      },
    },
  },

  -- Edgy integration
  {
    "folke/edgy.nvim",
    optional = true,
    opts = function(_, opts)
      opts.right = opts.right or {}
      table.insert(opts.right, {
        ft = "copilot-chat",
        title = "Copilot Chat",
        size = { width = 70 },
      })
    end,
  },
}
