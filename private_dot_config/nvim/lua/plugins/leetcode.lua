-- local leet_arg = 'leetcode.nvim'
local leet_arg = "lc"

return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-treesitter/nvim-treesitter",
    "rcarriga/nvim-notify",
    "nvim-tree/nvim-web-devicons",
    -- '3rd/image.nvim',
  },
  lazy = leet_arg ~= vim.fn.argv()[1],
  config = function()
    require("leetcode").setup({
      arg = leet_arg,
      lang = "python3",
      storage = {
        home = "~/Workspace/leetcode",
      },
      injector = {
        ["python3"] = {
          before = true,
        },
      },
      -- image_support = true,
    })

    require("which-key").register({
      ["<leader>l"] = { name = "+leetcode" },
    })

    vim.keymap.set("n", "<leader>ld", "<Cmd> Leet desc toggle <CR>", { desc = "Toggle Description" })
    vim.keymap.set("n", "<leader>lm", "<Cmd> Leet menu <CR>", { desc = "Open Menu" })
    vim.keymap.set("n", "<leader>li", "<Cmd> Leet info <CR>", { desc = "Show Question Information" })
    vim.keymap.set("n", "<leader>lr", "<Cmd> Leet run <CR>", { desc = "Run Solution" })
    vim.keymap.set("n", "<leader>ls", "<Cmd> Leet submit <CR>", { desc = "Submit Solution" })
    vim.keymap.set("n", "<leader>lR", "<Cmd> Leet last_submit <CR>", { desc = "Retrieve Last Submitted Code" })
    vim.keymap.set("n", "<leader>lb", "<Cmd> Leet open <CR>", { desc = "Open in browser" })
    vim.keymap.set("n", "<leader>lq", "<Cmd> Leet exit <CR>", { desc = "Quit" })
  end,
}
