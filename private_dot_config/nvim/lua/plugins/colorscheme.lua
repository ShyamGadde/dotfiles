return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      custom_highlights = function(colors)
        return {
          GitSignsChange = { fg = colors.blue }, -- Can't tell the difference between yellow and green, me colorblind. Hence, me override.
        }
      end,
      integrations = {
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
            ok = { "italic" },
          },
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
          inlay_hints = {
            background = true,
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
    },
  },

  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "catppuccin" },
  },
}
