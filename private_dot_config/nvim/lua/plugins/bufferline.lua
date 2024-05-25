return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('bufferline').setup {
      options = {
        separator_style = 'thick',
        right_mouse_command = 'vertical sbuffer %d',
        middle_mouse_command = 'bdelete! %d',
        diagnostics = 'nvim_lsp',
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          if context.buffer:current() then
            return ''
          end

          return ''
        end,
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'Explorer',
            text_align = 'center',
            separator = true,
          },
        },
      },
      highlights = require('catppuccin.groups.integrations.bufferline').get(),
    }

    require('which-key').register {
      ['<leader>b'] = { name = '[B]uffer', _ = 'which_key_ignore' },
    }

    local keymap = vim.keymap

    keymap.set('n', '<leader>bo', '<cmd> BufferLinePick <CR>', { desc = 'Buffer: [O]pen in current window' })
    keymap.set('n', '<leader>bc', '<cmd> BufferLinePickClose <CR>', { desc = 'Buffer: [C]lose' })
    keymap.set('n', '<leader>bp', '<cmd> BufferLineTogglePin <CR>', { desc = 'Buffer: [P]in current' })
  end,
}
