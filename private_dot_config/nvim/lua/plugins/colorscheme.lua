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
        cmp = true,
        dap = true,
        dap_ui = true,
        dashboard = true,
        flash = true,
        gitsigns = true,
        grug_far = true,
        indent_blankline = {
          enabled = true,
          colored_indent_levels = true,
        },
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
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
        neotree = true,
        noice = true,
        notify = true,
        nvim_surround = true,
        rainbow_delimiters = true,
        render_markdown = true,
        semantic_tokens = true,
        snacks = true,
        telescope = {
          enabled = true,
          -- style = "nvchad",
        },
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "catppuccin" },
  },
}
