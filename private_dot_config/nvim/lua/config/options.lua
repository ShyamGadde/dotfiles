-- Options are automatically loaded before `lazy.nvim` startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.root_spec = { { ".git", "lua" }, "lsp", "cwd" }
vim.g.lazyvim_picker = "telescope"
vim.g.lazyvim_python_lsp = "basedpyright"
vim.g.lazyvim_python_ruff = "ruff"
vim.g.lazyvim_php_lsp = "intelephense"
vim.g.lazyvim_cmp = "blink.cmp"
vim.g.ai_cmp = true

local set = vim.opt

set.clipboard = ""
set.inccommand = "split"
set.breakindent = true

-- Configure tabs and spaces
set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4

-- Appearance
vim.diagnostic.config({
  float = { border = "rounded" }, -- Add border to diagnostic popups
})
set.listchars = { tab = "󰁔 ", trail = "·", nbsp = "␣" }

set.sessionoptions = {
  "buffers",
  "curdir",
  "folds",
  "globals",
  "help",
  "skiprtp",
  "tabpages",
  "winsize",
  "winpos",
  "terminal",
  "localoptions",
}

set.diffopt:append("linematch:50")
