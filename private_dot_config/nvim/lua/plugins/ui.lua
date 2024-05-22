return {
  { -- Notifications for LSP and Neovim
    'j-hui/fidget.nvim',
    dependencies = {
      'rcarriga/nvim-notify',
    },
    opts = {
      notification = {
        override_vim_notify = true,
        window = {
          winblend = 0,
        },
      },
    },
  },
}
