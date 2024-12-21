return {
  -- Auto completion
  {
    "hrsh7th/nvim-cmp",
    optional = true,
    dependencies = { "hrsh7th/cmp-cmdline" },
    opts = function(_, opts)
      local cmp = require("cmp")

      -- Add borders to completions popups
      opts.window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      }

      opts.mapping = vim.tbl_extend("force", opts.mapping or {}, {
        ["<CR>"] = {}, -- Don't select on 'Enter'
      })

      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })
    end,
  },

  -- Auto pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    dependencies = { "hrsh7th/nvim-cmp" },
    opts = {
      check_ts = true, -- Enable treesitter
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

  -- Snippets
  {
    "hrsh7th/nvim-cmp",
    optional = true,
    keys = {
      {
        "<C-l>",
        function()
          return vim.snippet.active({ direction = 1 }) and "<cmd>lua vim.snippet.jump(1)<cr>" or "<C-l>"
        end,
        expr = true,
        silent = true,
        mode = { "i", "s" },
      },
      {
        "<C-h>",
        function()
          return vim.snippet.active({ direction = -1 }) and "<cmd>lua vim.snippet.jump(-1)<cr>" or "<C-h>"
        end,
        expr = true,
        silent = true,
        mode = { "i", "s" },
      },
    },
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
