return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('lualine').setup {
      options = {
        theme = 'catppuccin',
        globalstatus = true,
        -- component_separators = { left = '|', right = '|' },
        section_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = { 'dashboard', 'alpha' },
          winbar = {},
        },
      },
      sections = {
        lualine_a = { { 'mode', icon = '' } },
        lualine_b = {
          { require('auto-session.lib').current_session_name },
          { 'branch', icon = '' },
          'diff',
          'diagnostics',
        },
        lualine_c = {
          {
            'filetype',
            icon_only = true,
            separator = '',
            padding = { left = 1, right = 0 },
          },
          {
            'filename',
            file_status = true,
            path = 1,
            padding = { left = 0 },
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
          -- 'filetype',
        },
        lualine_y = {
          {
            require('lazy.status').updates,
            cond = require('lazy.status').has_updates,
            color = { fg = '#ff9e64' },
          },
        },
        lualine_z = {
          -- 'progress',
          'location',
        },
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
    }
  end,
}
