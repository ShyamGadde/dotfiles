return {
  'catppuccin/nvim',
  name = 'catppuccin',
  lazy = false,
  priority = 1000,
  opts = {
    flavor = 'mocha',
    -- transparent_background = true,
    dim_inactive = {
      enabled = true, -- dims the background color of inactive window
      shade = 'dark',
      percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
      comments = { 'italic' }, -- Change the style of comments
      conditionals = { 'italic' },
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},
      -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    default_integrations = false,
    integrations = {
      fidget = true,
      gitsigns = true,
      indent_blankline = {
        enabled = true,
        scope_color = 'rosewater', -- catppuccin color (eg. `lavender`) Default: text
        colored_indent_levels = true,
      },
      mason = true,
      mini = {
        enabled = true,
        indentscope_color = 'rosewater', -- catppuccin color (eg. `lavender`) Default: text
      },
      neotree = true,
      cmp = true, -- nvim-cmp
      dap = true, -- nvim-dap
      dap_ui = true, -- nvim-dap-ui
      native_lsp = { -- nvim-lspconfig
        enabled = true,
        virtual_text = {
          errors = { 'italic' },
          hints = { 'italic' },
          warnings = { 'italic' },
          information = { 'italic' },
        },
        underlines = {
          errors = { 'underline' },
          hints = { 'underline' },
          warnings = { 'underline' },
          information = { 'underline' },
        },
        inlay_hints = {
          background = true,
        },
      },
      notify = true, -- nvim-notify
      treesitter = true, -- nvim-treesitter
      window_picker = true, -- nvim-window-picker
      rainbow_delimiters = true,
      telescope = {
        enabled = true,
        -- style = "nvchad"
      },
      which_key = true,
    },
  },
  init = function()
    vim.cmd.colorscheme 'catppuccin'
  end,
}
