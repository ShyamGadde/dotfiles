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
    opts = {
      auto_insert_mode = false,
      show_help = true,
      window = {
        width = 0.3,
      },
    },
  },

  -- Edgy integration
  {
    "folke/edgy.nvim",
    opts = function(_, opts)
      opts.right = opts.right or {}
      table.insert(opts.right, {
        ft = "copilot-chat",
        title = "Copilot Chat",
        size = { width = 50 },
      })
    end,
  },
}
