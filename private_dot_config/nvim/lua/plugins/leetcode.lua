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
  config = function()
    require('leetcode').setup {
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
    }

    require('which-key').register {
      ['<leader>l'] = { name = '[L]eetCode', _ = 'which_key_ignore' },
    }

    vim.keymap.set('n', '<leader>ld', '<cmd> Leet desc toggle <CR>', { desc = 'LeetCode toggle [d]escription' })
    vim.keymap.set('n', '<leader>lm', '<cmd> Leet menu <CR>', { desc = 'LeetCode open [m]enu dashboard' })
    vim.keymap.set('n', '<leader>li', '<cmd> Leet info <CR>', { desc = 'LeetCode [i]nformation about current questions' })
    vim.keymap.set('n', '<leader>lr', '<cmd> Leet run <CR>', { desc = 'LeetCode [r]un solution' })
    vim.keymap.set('n', '<leader>ls', '<cmd> Leet submit <CR>', { desc = 'LeetCode [s]ubmit solution' })
    vim.keymap.set('n', '<leader>lS', '<cmd> Leet last_submit <CR>', { desc = 'LeetCode retrieve last [S]ubmitted code for the current question' })
    vim.keymap.set('n', '<leader>lo', '<cmd> Leet open <CR>', { desc = 'LeetCode [o]pen current question in browser' })
    vim.keymap.set('n', '<leader>lq', '<cmd> Leet exit <CR>', { desc = 'LeetCode [e]xit' })
  end,
}
