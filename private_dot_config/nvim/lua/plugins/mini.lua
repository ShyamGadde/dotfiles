return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    event = 'VeryLazy',
    config = function()
      require('mini.ai').setup { n_lines = 500 }

      require('mini.align').setup()

      require('mini.animate').setup()

      require('mini.basics').setup {
        mappings = {
          -- Prefix for mappings that toggle common options ('wrap', 'spell', ...).
          -- option_toggle_prefix = '<leader>t',
          -- Window navigation with <C-hjkl>, resize with <C-arrow>
          windows = true,
          -- Move cursor in Insert, Command, and Terminal mode with <M-hjkl>
          move_with_alt = true,
        },
      }

      local hipatterns = require 'mini.hipatterns'
      hipatterns.setup {
        highlighters = {
          -- Highlight hex color strings (`#rrggbb`) using that color
          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
      }

      require('mini.move').setup()
    end,
  },
}
