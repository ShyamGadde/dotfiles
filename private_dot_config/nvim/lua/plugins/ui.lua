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
  {
    'petertriho/nvim-scrollbar',
    dependencies = {
      'lewis6991/gitsigns.nvim',
      'kevinhwang91/nvim-hlslens',
    },
    config = function()
      require('scrollbar').setup {
        excluded_filetypes = {
          'cmp_docs',
          'cmp_menu',
          'noice',
          'prompt',
          'TelescopePrompt',
          'neo-tree',
        },
      }
    end,
  },
  {
    'kevinhwang91/nvim-hlslens',
    config = function()
      -- require('hlslens').setup() is not required

      require('scrollbar.handlers.search').setup {
        -- hlslens config overrides
      }

      local kopts = { noremap = true, silent = true }

      vim.api.nvim_set_keymap('n', 'n', [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap('n', 'N', [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)
    end,
  },
}
