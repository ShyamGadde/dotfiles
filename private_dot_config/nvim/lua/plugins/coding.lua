return {
  -- Set buffer options
  {
    "tpope/vim-sleuth",
    event = "LazyFile",
  },

  -- Auto completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      -- "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-cmdline",
    },
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

      -- table.insert(opts.sources, { name = "emoji" })
    end,
  },

  -- Snippets
  {
    "nvim-cmp",
    keys = {
      { "<Tab>", false },
      {
        "<C-l>",
        function()
          return vim.snippet.active({ direction = 1 }) and "<cmd>lua vim.snippet.jump(1)<cr>" or "<C-l>"
        end,
        expr = true,
        silent = true,
        mode = { "i", "s" },
      },

      { "<S-Tab>", false },
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

  -- Auto pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    dependencies = { "hrsh7th/nvim-cmp" },
    opts = {
      check_ts = true, -- enable treesitter
      -- ts_config = {
      --   lua = { "string" }, -- don't add pairs in lua string treesitter nodes
      --   javascript = { "template_string" }, -- don't add pairs in javascript template_string
      -- },
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

  -- Comments
  {
    "numToStr/Comment.nvim",
    event = "LazyFile",
    opts = {},
  },
}
