return {
  -- Auto completion
  {
    "saghen/blink.cmp",
    optional = true,
    opts = {
      keymap = {
        -- Don't accept suggestion on Enter.
        ["<CR>"] = {},
        ["<C-y>"] = { "select_and_accept" },
        ["<C-l>"] = { "snippet_forward", "fallback" },
        ["<C-h>"] = { "snippet_backward", "fallback" },
        -- Add ability to select the nth item with Alt + n for the first 5 items.
        -- stylua: ignore start
        ["<A-1>"] = { function(cmp) cmp.accept({ index = 1 }) end },
        ["<A-2>"] = { function(cmp) cmp.accept({ index = 2 }) end },
        ["<A-3>"] = { function(cmp) cmp.accept({ index = 3 }) end },
        ["<A-4>"] = { function(cmp) cmp.accept({ index = 4 }) end },
        ["<A-5>"] = { function(cmp) cmp.accept({ index = 5 }) end },
        -- stylua: ignore end
      },
      completion = {
        menu = {
          -- border = "rounded",
          winblend = 10,
        },
        documentation = {
          window = {
            -- border = "rounded",
            winblend = 10,
          },
        },
      },
    },
  },

  -- Auto pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts = true, -- enable treesitter
      -- ts_config = {
      --   lua = { "string" }, -- Don't add a pair on that treesitter node (i.e., lua string)
      -- },
    },
  },

  -- Comments
  {
    "numToStr/Comment.nvim",
    event = "LazyFile",
    opts = {},
  },

  -- Edit surrounding
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = { "LazyFile" },
    opts = {
      keymaps = {
        normal = "gs",
        normal_cur = "gss",
        normal_line = "gS",
        normal_cur_line = "gSS",
        visual = "gs",
        visual_line = "gS",
      },
      aliases = {
        ["p"] = ")",
        ["b"] = "}",
        ["B"] = "]",
      },
    },
    config = function(_, opts)
      require("nvim-surround").setup(opts)

      local map = vim.keymap.set

      -- Add motions for aliases
      map("o", "ir", "i[")
      map("o", "ar", "a[")
      map("o", "ia", "i<")
      map("o", "aa", "a<")
    end,
  },

  -- TreeSJ
  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    keys = {
      {
        "<localleader>j",
        function()
          require("treesj").toggle()
        end,
        desc = "Split/Join Codeblock",
      },
      {
        "<localleader>J",
        function()
          require("treesj").toggle({ split = { recursive = true } })
        end,
        desc = "Split/Join Codeblock Recursively",
      },
    },
    opts = {
      use_default_keymaps = false,
    },
  },

  -- Vim Sleuth (set buffer options)
  {
    "tpope/vim-sleuth",
    event = "LazyFile",
  },
}
