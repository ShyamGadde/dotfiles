-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

vim.g.lazyvim_picker = "telescope"

opt.clipboard = ""
opt.inccommand = "split"

-- Configure tabs and spaces
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4

vim.diagnostic.config({
  float = { border = "rounded" }, -- Add border to diagnostic popups
})
opt.pumblend = 0 -- Popup blend

opt.formatoptions = "jcrqlnt"

opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
opt.breakindent = true

vim.opt.diffopt:append("linematch:50")
