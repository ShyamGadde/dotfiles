vim.filetype.add {
  pattern = {
    ['.*%.hl'] = 'hyprlang',
    ['hypr.*%.conf'] = 'hyprlang',
    ['.*/hypr/.*%.conf'] = 'hyprlang',
  },
}
