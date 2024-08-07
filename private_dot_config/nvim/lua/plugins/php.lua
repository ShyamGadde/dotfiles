return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "php" } },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        intelephense = {},
      },
    },
  },

  -- Use the globally installed phpcs and phpcbf as this doesn't quite work with the WordPress standards
  -- installed globally using composer.
  -- {
  --   "williamboman/mason.nvim",
  --   opts = {
  --     ensure_installed = {
  --       "phpcs",
  --       "phpcbf",
  --     },
  --   },
  -- },

  {
    "mfussenegger/nvim-dap",
    opts = function()
      local dap = require("dap")
      local path = require("mason-registry").get_package("php-debug-adapter"):get_install_path()
      dap.adapters.php = {
        type = "executable",
        command = "node",
        args = { path .. "/extension/out/phpDebug.js" },
      }
    end,
  },

  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        php = { "phpcs" },
      },
      -- linters = {
      --   phpcs = {
      --     args = {
      --       "-q",
      --       "--standard=WordPress",
      --       "--report=json",
      --       "-",
      --     },
      --   },
      -- },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        php = { "phpcbf" },
      },
      -- formatters = {
      --   phpcbf = {
      --     prepend_args = { "--standard=WordPress" },
      --   },
      -- },
    },
  },
}
