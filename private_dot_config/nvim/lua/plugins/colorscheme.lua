return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      custom_highlights = function(colors)
        return {
          GitSignsChange = { fg = colors.blue }, -- Can't tell the difference between yellow and green, me colorblind.
        }
      end,
    },
  },
}
