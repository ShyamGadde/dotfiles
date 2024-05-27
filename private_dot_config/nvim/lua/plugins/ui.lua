return {
  {
    'rcarriga/nvim-notify',
    config = function()
      vim.notify = require 'notify'
    end,
  },

  {
    'stevearc/dressing.nvim',
    event = 'VeryLazy',
    opts = {
      input = {
        insert_only = false,
      },
      select = {
        enabled = false,
      },
    },
  },

  {
    'karb94/neoscroll.nvim',
    event = 'VeryLazy',
    opts = {
      easing = 'sine',
    },
  },
}
