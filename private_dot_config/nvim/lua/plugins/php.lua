local util = require("lspconfig.util")

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "php" } },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        intelephense = {
          root_dir = function(pattern)
            local cwd = vim.loop.cwd()
            local root = util.root_pattern(".wproot", "composer.json", ".git")(pattern)

            -- prefer cwd if root is a descendant
            return util.path.is_descendant(cwd, root) and cwd or root
          end,
          settings = {
            intelephense = {
              files = {
                maxSize = 5000000,
              },
              stubs = {
                "Core",
                "FFI",
                "PDO",
                "Phar",
                "Reflection",
                "SPL",
                "SimpleXML",
                "Zend OPcache",
                "acf-pro",
                "apache",
                "bcmath",
                "bz2",
                "calendar",
                "com_dotnet",
                "ctype",
                "curl",
                "date",
                "dba",
                "dom",
                "enchant",
                "exif",
                "fileinfo",
                "filter",
                "fpm",
                "ftp",
                "gd",
                "genesis",
                "gettext",
                "gmp",
                "hash",
                "iconv",
                "imap",
                "intl",
                "json",
                "ldap",
                "libxml",
                "mbstring",
                "meta",
                "mssql",
                "mysqli",
                "oci8",
                "odbc",
                "openssl",
                "pcntl",
                "pcre",
                "pdo_ibm",
                "pdo_mysql",
                "pdo_pgsql",
                "pdo_sqlite",
                "pgsql",
                "phpunit",
                "polylang",
                "posix",
                "pspell",
                "readline",
                "recode",
                "regex",
                "session",
                "shmop",
                "snmp",
                "soap",
                "sockets",
                "sodium",
                "sqlite3",
                "standard",
                "superglobals",
                "sybase",
                "sysvmsg",
                "sysvsem",
                "sysvshm",
                "tidy",
                "tokenizer",
                "woocommerce",
                "wordpress",
                "wordpress-globals",
                "wordpress-seo-stubs",
                "wp-cli",
                "xml",
                "xmlreader",
                "xmlrpc",
                "xmlwriter",
                "xsl",
                "zip",
                "zlib",
              },
            },
          },
        },
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
