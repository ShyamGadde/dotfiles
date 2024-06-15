-- local leet_arg = 'leetcode.nvim'
local leet_arg = 'lc'

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
        home = '~/Workspace/leetcode',
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

    vim.keymap.set('n', '<leader>ld', '<cmd> Leet desc toggle <CR>', { desc = 'Toggle [D]escription' })
    vim.keymap.set('n', '<leader>lm', '<cmd> Leet menu <CR>', { desc = 'Open Leetcode [M]enu Dashboard' })
    vim.keymap.set('n', '<leader>li', '<cmd> Leet info <CR>', { desc = 'Show [I]nformation about current question' })
    vim.keymap.set('n', '<leader>lr', '<cmd> Leet run <CR>', { desc = '[R]un Solution' })
    vim.keymap.set('n', '<leader>ls', '<cmd> Leet submit <CR>', { desc = '[S]ubmit Solution' })
    vim.keymap.set('n', '<leader>lS', '<cmd> Leet last_submit <CR>', { desc = 'Retrieve last [S]ubmitted code for the current question' })
    vim.keymap.set('n', '<leader>lo', '<cmd> Leet open <CR>', { desc = '[O]pen current question in browser' })
    vim.keymap.set('n', '<leader>lq', '<cmd> Leet exit <CR>', { desc = '[Q]uit Leetcode' })
  end,
}
