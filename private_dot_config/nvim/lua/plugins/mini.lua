return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      require('mini.ai').setup { n_lines = 500 }

      require('mini.align').setup()

      require('mini.animate').setup()

      require('mini.basics').setup {
        mappings = {
          -- Prefix for mappings that toggle common options ('wrap', 'spell', ...).
          option_toggle_prefix = '<leader>t',
          -- Window navigation with <C-hjkl>, resize with <C-arrow>
          windows = true,
          -- Move cursor in Insert, Command, and Terminal mode with <M-hjkl>
          move_with_alt = true,
        },
      }

      require('mini.surround').setup()
    end,
  },
}
