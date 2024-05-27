-- See `:help opt`
-- For more options, you can see `:help option-list`
local opt = vim.opt

-- Session Management
opt.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'

-- Make line numbers default
opt.number = true
opt.relativenumber = true

-- Configure tabs and spaces
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
vim.bo.softtabstop = 2

-- Line wrapping
opt.wrap = false

-- Appearance
opt.termguicolors = true
opt.background = 'dark'
vim.diagnostic.config {
  float = { border = 'rounded' }, -- add border to diagnostic popups
}

-- Backspace
opt.backspace = 'indent,eol,start'

-- Folding
-- opt.foldlevel = 20
-- opt.foldmethod = 'expr'
-- opt.foldexpr = 'nvim_treesitter#foldexpr()' -- Utilize Treesitter folds

-- Enable mouse mode, can be useful for resizing splits for example!
opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
opt.showmode = false

-- Enable break indent
opt.breakindent = true

-- Save undo history
opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.ignorecase = true
opt.smartcase = true

-- Keep signcolumn on by default
opt.signcolumn = 'yes'

-- Decrease update time
opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
opt.timeoutlen = 300

-- Configure how new splits should be opened
opt.splitright = true
opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
opt.inccommand = 'split'

-- Show which line your cursor is on
opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 5

-- Set highlight on search
opt.hlsearch = true

-- Don't have `o` add a comment
opt.formatoptions:remove 'o'

-- vim: ts=2 sts=2 sw=2 et
