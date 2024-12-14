local my_augroup = vim.api.nvim_create_augroup("myAugroup", { clear = true })

-- Set terminal buffer options
vim.api.nvim_create_autocmd("TermOpen", {
  group = my_augroup,
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = "no"
    vim.cmd("startinsert")
  end,
})

-- Force setting formatoptions when entering any buffer
vim.api.nvim_create_autocmd("FileType", {
  group = my_augroup,
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions = "jcrqlnt"
  end,
})

-- Add some space between the NVIM statusline and the TMUX statusline when in TMUX
vim.api.nvim_create_autocmd("BufEnter", {
  group = my_augroup,
  callback = function()
    if vim.env.TMUX then
      vim.opt.cmdheight = 1
    end
  end,
  once = true, -- This ensures it only runs once
})
