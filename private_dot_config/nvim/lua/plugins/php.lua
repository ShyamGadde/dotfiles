-- Helper function to find the closest PHP CodeSniffer standards file
local function find_phpcs_standard()
  local current_file_dir = vim.fn.expand("%:p:h")
  local cwd = vim.fn.getcwd() -- The directory where Neovim was opened
  local config_files = {
    ".phpcs.xml",
    "phpcs.xml",
    ".phpcs.xml.dist",
    "phpcs.xml.dist",
    "phpcs.ruleset.xml",
    "ruleset.xml",
  }

  -- Function to search for config files starting from the provided directory
  local function search_config_file(start_dir)
    for _, filename in ipairs(config_files) do
      local config_file = vim.fn.findfile(filename, start_dir)
      if config_file and #config_file > 0 then
        return config_file
      end
    end
    return nil
  end

  -- Start searching from the current file's directory and move upwards
  local config_file = search_config_file(current_file_dir)

  -- Stop searching one level below the current working directory (cwd)
  -- because if the config file exists in the current directory or above,
  -- phpcs/phpcbf will handle it internally.
  while not config_file and current_file_dir ~= cwd do
    -- Move up one directory level
    current_file_dir = vim.fn.fnamemodify(current_file_dir, ":h")
    config_file = search_config_file(current_file_dir)
  end

  if config_file then
    return "--standard=" .. vim.fn.fnameescape(config_file)
  else
    -- return "--standard=WordPress"
    return nil -- If no config file is found, return nil to omit this argument
  end
end

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
            local util = require("lspconfig.util")
            local root = util.root_pattern(".wproot", "composer.json", ".git")(pattern)

            -- Use cwd if root is nil
            if not root then
              return cwd
            end

            -- Prefer cwd if root is a descendant.
            return util.path.is_descendant(cwd, root) and cwd or root
          end,
          settings = {
            intelephense = {
              files = {
                maxSize = 5000000,
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
      linters = {
        phpcs = {
          args = {
            "--report=json",
            "-q",
            "-s",
            find_phpcs_standard,
            "-",
          },
        },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        php = { "phpcbf", "trim_whitespace", "trim_newlines" },
      },
      formatters = {
        phpcbf = {
          prepend_args = function()
            return { find_phpcs_standard() }
          end,
        },
      },
    },
  },
}
