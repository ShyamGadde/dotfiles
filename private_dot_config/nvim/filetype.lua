vim.filetype.add({
  extension = {},
  filename = {
    ["dot_zshrc"] = "zsh",
  },
  pattern = {
    [".*%.hl"] = "hyprlang",
    ["hypr.*%.conf"] = "hyprlang",
    [".*/hypr/.*%.conf"] = "hyprlang",
  },
})
