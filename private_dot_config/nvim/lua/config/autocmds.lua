local my_augroup = vim.api.nvim_create_augroup("myAugroup", { clear = true })

vim.api.nvim_create_autocmd("TermOpen", {
  group = my_augroup,
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.cmd("startinsert")
  end,
})
