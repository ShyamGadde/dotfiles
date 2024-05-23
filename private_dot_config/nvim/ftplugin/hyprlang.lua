vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  callback = function()
    vim.lsp.start {
      name = 'hyprlang',
      cmd = { 'hyprls' },
      root_dir = vim.fn.getcwd(),
    }
  end,
})
