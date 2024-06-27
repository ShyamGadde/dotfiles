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
      -- "chrisgrieser/cmp-nerdfont",
      "hrsh7th/cmp-cmdline",
    },
    opts = function(_, opts)
      local cmp = require("cmp")

      -- Add borders to completions popups
      opts.window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      }

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
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
      -- table.insert(opts.sources, { name = "nerdfont" })
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
    "echasnovski/mini.pairs",
    enabled = false,
    -- INFO: Why?
    -- When trying to insert an ending quote results in a pair.
    -- E.g., `"hello|` -> insert `"` -> `"hello"|"`
    -- Couldn't figure out how to fix this, hence disabled and replaced with "nvim-autopairs".
    -- NOTE: This behaviour was only noticed in Python files.
  },
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

  -- Comments
  {
    "numToStr/Comment.nvim",
    event = "LazyFile",
    opts = {},
  },
}
