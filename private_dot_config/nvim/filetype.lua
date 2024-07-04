vim.filetype.add({
  extension = {},
  filename = {},
  pattern = {
    [".*%.hl"] = "hyprlang",
    ["hypr.*%.conf"] = "hyprlang",
    [".*/hypr/.*%.conf"] = "hyprlang",
  },
})
