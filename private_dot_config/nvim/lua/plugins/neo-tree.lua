return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    '3rd/image.nvim', -- image support in preview window
    {
      's1n7ax/nvim-window-picker',
      version = '2.*',
      config = function()
        require('window-picker').setup {
          hint = 'floating-big-letter',
          show_prompt = true,
          filter_rules = {
            include_current_win = false,
            autoselect_one = true,
            -- filter using buffer options
            bo = {
              -- if the file type is one of following, the window will be ignored
              filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },
              -- if the buffer type is one of following, the window will be ignored
              buftype = { 'terminal', 'quickfix' },
            },
          },
        }
      end,
    },
  },
  cmd = 'Neotree',
  keys = {
    { '<leader>nf', '<cmd>Neotree filesystem reveal right<CR>', desc = '[N]eoTree reveal [F]ilesystem' },
    { '<leader>nb', '<cmd>Neotree buffers reveal right<CR>', desc = '[N]eoTree reveal [B]uffers' },
    { '<leader>ng', '<cmd>Neotree git_status reveal right<CR>', desc = '[N]eoTree reveal [G]it Status' },
    { '<leader>ns', '<cmd>Neotree document_symbols reveal right<CR>', desc = '[N]eoTree reveal Document [S]ymbols' },
  },
  opts = {
    close_if_last_window = true,
    enable_normal_mode_for_inputs = true,
    enable_cursor_hijack = true, -- If enabled neotree will keep the cursor on the first letter of the filename when moving in the tree.
    default_component_configs = {
      diagnostics = {
        symbols = {
          hint = '󰌵',
          info = ' ',
          warn = ' ',
          error = ' ',
        },
        highlights = {
          hint = 'DiagnosticSignHint',
          info = 'DiagnosticSignInfo',
          warn = 'DiagnosticSignWarn',
          error = 'DiagnosticSignError',
        },
      },
    },
    window = {
      position = 'right',
      mappings = {
        ['P'] = { 'toggle_preview', config = { use_float = true, use_image_nvim = true } },
      },
    },
    filesystem = {
      follow_current_file = {
        enabled = false, -- This will find and focus the file in the active buffer every time the current file is changed while the tree is open.
      },
      hijack_netrw_behavior = 'open_current', -- netrw disabled, opening a directory opens within the window like netrw would, regardless of window.position
      use_libuv_file_watcher = true, -- This will use the OS level file watchers to detect changes instead of relying on nvim autocmd events.
    },
    sources = {
      'filesystem',
      'buffers',
      'git_status',
      'document_symbols',
    },
    source_selector = {
      winbar = true,
      sources = {
        { source = 'filesystem' },
        { source = 'buffers' },
        { source = 'git_status' },
        { source = 'document_symbols' },
      },
    },
  },
}
