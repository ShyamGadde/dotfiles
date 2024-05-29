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
    },
  },

  {
    'karb94/neoscroll.nvim',
    event = 'BufEnter',
    opts = {
      easing = 'sine',
    },
  },
}
