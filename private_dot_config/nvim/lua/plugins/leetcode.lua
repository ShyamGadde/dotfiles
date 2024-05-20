local leet_arg = 'leetcode.nvim'

return {
  'kawre/leetcode.nvim',
  build = ':TSUpdate html',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'nvim-treesitter/nvim-treesitter',
    'rcarriga/nvim-notify',
    'nvim-tree/nvim-web-devicons',
    -- '3rd/image.nvim',
  },
  lazy = leet_arg ~= vim.fn.argv()[1],
  opts = {
    arg = leet_arg,
    lang = 'python3',
    storage = {
      home = '~/workspace/leetcode',
    },
    injector = {
      ['python3'] = {
        before = true,
      },
    },
    -- image_support = true,
  },
}
