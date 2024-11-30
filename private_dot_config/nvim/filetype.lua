vim.filetype.add({
  extension = {},
  filename = {
    [".gitconfig.work"] = "gitconfig",
  },
  pattern = {
    [".*%.hl"] = "hyprlang",
    ["hypr.*%.conf"] = "hyprlang",
    [".*/hypr/.*%.conf"] = "hyprlang",
  },
})
