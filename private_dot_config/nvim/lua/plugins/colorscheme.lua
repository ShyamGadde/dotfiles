return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      custom_highlights = function(colors)
        return {
          GitSignsChange = { fg = colors.blue }, -- Can't tell the difference between yellow and green, me colorblind. Hence, me override.
          WinSeparator = { fg = colors.blue },
          NeoTreeWinSeparator = { fg = colors.blue },
        }
      end,
      dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15, -- Percentage of the shade to apply to the inactive window
      },
      flavor = "mocha",
      integrations = {
        native_lsp = {
          enabled = true,
          inlay_hints = {
            background = true,
          },
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
            ok = { "italic" },
          },
        },
        nvim_surround = true,
        rainbow_delimiters = true,
        render_markdown = true,
        telescope = {
          enabled = true,
          -- style = "nvchad",
        },
      },
      styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" },
        conditionals = { "italic" },
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
        -- miscs = {},  -- Uncomment to turn off hardcoded styles.
      },
      transparent_background = false,
    },
  },

  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "catppuccin" },
  },
}
