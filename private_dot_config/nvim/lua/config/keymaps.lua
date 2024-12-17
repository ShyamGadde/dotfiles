local map = vim.keymap.set
local unmap = vim.keymap.del

-- Use a command instead of a keymap
-- stylua: ignore
vim.api.nvim_create_user_command("LazyVimChangelog", function() LazyVim.news.changelog() end, { desc = "LazyVim Changelog" }) -- Previously mapped to <leader>L
unmap("n", "<leader>l") -- Motions for leetcode.nvim are now prefixed with <leader>l
map("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" }) -- Previously mapped to <leader>l

--------------------
-- Toggle options --
--------------------
LazyVim.format.snacks_toggle(true):map("<leader>uf")
LazyVim.format.snacks_toggle():map("<leader>uF")

-------------
-- Lazygit --
-------------
-- stylua: ignore start
map("n", "<leader>gg", function() Snacks.lazygit() end, { desc = "Lazygit (cwd)" })
map("n", "<leader>gG", function() Snacks.lazygit({ cwd = LazyVim.root.git() }) end, { desc = "Lazygit (Root Dir)" })
map("n", "<leader>gl", function() Snacks.lazygit.log() end, { desc = "Lazygit Log (cwd)" })
map("n", "<leader>gL", function() Snacks.lazygit.log({ cwd = LazyVim.root.git() }) end, { desc = "Lazygit Log" })
unmap({ "x" }, "<leader>gB") -- <leader>gB in normal mode is overridden by telescope git_branches
map({ "n", "x" }, "<leader>go", function() Snacks.gitbrowse() end, { desc = "Git Browse (open)" }) -- Previously mapped to <leader>gB
-- stylua: ignore end

----------------
-- Lazydocker --
----------------
map("n", "<leader>D", function()
  Snacks.terminal.open({ "lazydocker" }, { cwd = LazyVim.root.get(), esc_esc = false, ctrl_hjkl = false })
end, { desc = "Lazydocker" })

-----------------------
-- Floating terminal --
-----------------------
-- stylua: ignore start
local lazyterm = function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end
map("n", "<leader>ft", function() Snacks.terminal() end, { desc = "Terminal (cwd)" })
map("n", "<leader>fT", lazyterm, { desc = "Terminal (Root Dir)" })
unmap("n", "<c-/>") -- Now this keymap is used for commenting
unmap("n", "<c-_>")
map("n", "<M-CR>", lazyterm, { desc = "Terminal (Root Dir)" }) -- previously mapped to <c-_> and <c-/>
-- stylua: ignore end

---------------------
-- Neovim Terminal --
---------------------
require("which-key").add({ { "<leader>t", group = "+terminal" } })
map("n", "<leader>tv", "<Cmd>vsplit | terminal<CR>", { desc = "Open Terminal (Vertical Split)" })
map("n", "<leader>th", "<Cmd>split | terminal<CR>", { desc = "Open Terminal (Horizontal Split)" })
unmap("t", "<C-/>")
unmap("t", "<c-_>")
map("t", "<M-CR>", "<Cmd>close<CR>", { desc = "Hide Terminal" })
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit Terminal Mode" })

-----------
-- Files --
-----------
map("n", "<leader>fx", "<Cmd>!chmod +x %<CR>", { desc = "Make Current File Executable" })
map("n", "<leader>fs", "<Cmd>w<CR>", { desc = "Save File" })
map("n", "<leader>fd", "<Cmd>!rm %<CR>", { desc = "Delete File" })
map("n", "<leader>fD", "<Cmd>!rm %<CR><Cmd>bdelete<CR>", { desc = "Delete File and Buffer" })

--------------
-- Comments --
--------------
-- Toggle current line (linewise) using C-/
-- stylua: ignore
map("n", "<C-/>", function() require("Comment.api").toggle.linewise.current() end, { desc = "Toggle Comment" })
-- stylua: ignore
map("n", "<C-_>", function() require("Comment.api").toggle.linewise.current() end, { desc = "which_key_ignore" })

-- Helper function to toggle comments linewise in visualmode
local toggle_comment = function()
  local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
  vim.api.nvim_feedkeys(esc, "nx", false)
  require("Comment.api").toggle.linewise(vim.fn.visualmode())
end

-- Toggle Selection linewise
map("x", "<C-/>", toggle_comment, { desc = "Toggle Comment" })
map("x", "<C-_>", toggle_comment, { desc = "which_key_ignore" })

----------
-- Misc --
----------
-- Don't jump when using '*' or '#'
map({ "n", "x" }, "*", "*N")
map({ "n", "x" }, "#", "#N")
-- Delete single character without copying into register
map("n", "x", '"_x')
-- Add empty lines before and after cursor line
map("n", "go", "<Cmd>call append(line('.'),     repeat([''], v:count1))<CR>", { desc = "Put empty line below" })
map("n", "gO", "<Cmd>call append(line('.') - 1, repeat([''], v:count1))<CR>", { desc = "Put empty line above" })
-- Copy/paste with system clipboard
map({ "n", "x" }, "<localleader>y", '"+y', { desc = "Copy to system clipboard" })
map("n", "<localleader>p", '"+p', { desc = "Paste from system clipboard" })
-- - Paste in Visual with `P` to not copy selected text (`:h v_P`)
map("x", "<localleader>p", '"+P', { desc = "Paste from system clipboard" })
-- Reselect latest changed, put, or yanked text
-- stylua: ignore
map( "n", "gV", '"`[" . strpart(getregtype(), 0, 1) . "`]"', { expr = true, replace_keycodes = false, desc = "Visually select changed text" })
-- Search inside visually highlighted text. Use `silent = false` for it to make effect immediately.
map("x", "g/", "<esc>/\\%V", { silent = false, desc = "Search inside visual selection" })
