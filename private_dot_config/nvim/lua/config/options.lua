-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.lazyvim_picker = "telescope"
vim.g.root_spec = { { ".git", "lua" }, "lsp", "cwd" }

vim.g.lazyvim_python_lsp = "basedpyright"
vim.g.lazyvim_python_ruff = "ruff_lsp"
vim.g.lazyvim_php_lsp = "intelephense"

local opt = vim.opt

opt.clipboard = ""
opt.inccommand = "split"
opt.breakindent = true

-- Configure tabs and spaces
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4

-- Appearance
vim.diagnostic.config({
  float = { border = "rounded" }, -- Add border to diagnostic popups
})
opt.pumblend = 0 -- Popup blend
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- FIX: These options don't seem to be set for some reason
-- opt.formatoptions = "jcrqlnt"

opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }

vim.opt.diffopt:append("linematch:50")
