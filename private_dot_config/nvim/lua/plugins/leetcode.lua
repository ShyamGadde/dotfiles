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
      ["<leader>l"] = {
        name = "+leetcode",
        d = { "<Cmd> Leet desc toggle <CR>", "Toggle Description" },
        m = { "<Cmd> Leet menu <CR>", "Open Menu" },
        i = { "<Cmd> Leet info <CR>", "Show Question Information" },
        r = { "<Cmd> Leet run <CR>", "Run Solution" },
        s = { "<Cmd> Leet submit <CR>", "Submit Solution" },
        R = { "<Cmd> Leet last_submit <CR>", "Retrieve Last Submitted Code" },
        b = { "<Cmd> Leet open <CR>", "Open in browser" },
        q = { "<Cmd> Leet exit <CR>", "Quit" },
      },
    })
  end,
}
