local map = vim.keymap.set
local unmap = vim.keymap.del

-- Use a command instead of a keymap
-- map("n", "<leader>L", function() LazyVim.news.changelog() end, { desc = "LazyVim Changelog" })
unmap("n", "<leader>L")
-- stylua: ignore
vim.api.nvim_create_user_command("LazyVimChangelog", function() LazyVim.news.changelog() end, { desc = "LazyVim Changelog" })
-- map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
unmap("n", "<leader>l")
map("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })

--[[
-- Toggle options
]]
-- stylua: ignore start
map("n", "<leader>uf", function() LazyVim.format.toggle(true) end, { desc = "Toggle Auto Format (Buffer)" })
map("n", "<leader>uF", function() LazyVim.format.toggle() end, { desc = "Toggle Auto Format (Global)" })
-- stylua: ignore end

--[[
-- Lazygit
]]
-- stylua: ignore start
map("n", "<leader>gg", function() Snacks.lazygit() end, { desc = "Lazygit (cwd)" })
map("n", "<leader>gG", function() Snacks.lazygit({ cwd = LazyVim.root.git() }) end, { desc = "Lazygit (Root Dir)" })
map("n", "<leader>gl", function() Snacks.lazygit({ args = { "log" } }) end, { desc = "Lazygit Log (cwd)" })
map("n", "<leader>gL", function() Snacks.lazygit({ args = { "log" }, cwd = LazyVim.root.git() }) end, { desc = "Lazygit Log" })
unmap("n", "<leader>gB")
-- Previously mapped to <leader>gB
map("n", "<leader>go", function() Snacks.gitbrowse() end, { desc = "Open in Browser" })
unmap("n", "<leader>gf")
-- Previously mapped to <leader>gf
map("n", "<leader>gF", function() Snacks.lazygit.log_file() end, { desc = "Lazygit Current File History" })
-- stylua: ignore end

--[[
-- Lazydocker
]]
map("n", "<leader>D", function()
  Snacks.terminal.open({ "lazydocker" }, { cwd = LazyVim.root.get(), esc_esc = false, ctrl_hjkl = false })
end, { desc = "Lazydocker" })

--[[
-- Floating terminal
]]
-- stylua: ignore start
local lazyterm = function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end
map("n", "<leader>ft", function() Snacks.terminal() end, { desc = "Terminal (cwd)" })
map("n", "<leader>fT", lazyterm, { desc = "Terminal (Root Dir)" })
unmap("n", "<c-/>")
unmap("n", "<c-_>")
-- previously mapped to <c-_> and <c-/>
map("n", "<C-CR>", lazyterm, { desc = "Terminal (Root Dir)" })
-- stylua: ignore end

--[[
-- Neovim Terminal
]]
map("n", "<leader>tv", "<Cmd>vsplit | terminal<CR>", { desc = "Open Terminal (Vertical Split)" })
map("n", "<leader>th", "<Cmd>split | terminal<CR>", { desc = "Open Terminal (Horizontal Split)" })
unmap("t", "<C-/>")
unmap("t", "<c-_>")
map("t", "<C-CR>", "<Cmd>close<CR>", { desc = "Hide Terminal" })

--[[
-- Files
]]
map("n", "<leader>fx", "<Cmd>!chmod +x %<CR>", { desc = "Make Current File Executable" })
map("n", "<leader>fs", "<Cmd>w<CR>", { desc = "Save File" })
map("n", "<leader>fd", "<Cmd>!rm %<CR>", { desc = "Delete File" })
map("n", "<leader>fD", "<Cmd>!rm %<CR><Cmd>bdelete<CR>", { desc = "Delete File and Buffer" })

--[[
-- Comments
--]]
-- Toggle current line (linewise) using C-/
map("n", "<C-/>", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Toggle Comment" })

-- Toggle Selection linewise
map("x", "<C-/>", function()
  local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
  vim.api.nvim_feedkeys(esc, "nx", false)
  require("Comment.api").toggle.linewise(vim.fn.visualmode())
end, { desc = "Toggle Comment" })

--[[
-- Misc
--]]
-- Don't jump when using '*' or '#'
map("n", "*", "*N")
map("n", "#", "#N")
-- Delete single character without copying into register
map("n", "x", '"_x')
