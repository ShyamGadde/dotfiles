return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      theme = 'catppuccin',
      component_separators = { left = '|', right = '|' },
      -- section_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diff', 'diagnostics' },
      lualine_c = {
        {
          'filename',
          file_status = true,
          path = 1,
        },
      },
      lualine_x = {
        {
          'searchcount',
          maxcount = 999,
          timeout = 500,
        },
        'encoding',
        'fileformat',
        'filetype',
      },
      lualine_y = {
        {
          require('lazy.status').updates,
          cond = require('lazy.status').has_updates,
          color = { fg = '#ff9e64' },
        },
        'progress',
      },
      lualine_z = { 'location' },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { 'filename' },
      lualine_x = { 'location' },
      lualine_y = {},
      lualine_z = {},
    },
    extensions = {
      'lazy',
      'man',
      'mason',
      'neo-tree',
      'nvim-dap-ui',
      'quickfix',
    },
  },
}
