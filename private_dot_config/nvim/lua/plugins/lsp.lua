return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        update_in_insert = false,
        virtual_text = {
          prefix = "icons",
        },
      },

      codelens = {
        enabled = false,
      },

      servers = {
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                autoImportCompletions = true,
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "openFilesOnly",
                -- FIX: This doesn't disable diagnostics
                ignore = { "*" },
              },
            },
          },
        },

        emmet_ls = {},

        hyprls = {
          root_dir = function()
            return vim.fn.getcwd()
          end,
        },

        lua_ls = {
          -- mason = false, -- Set to false if you don't want this server to be installed with mason
          -- keys = {}, -- Use this to add any additional keymaps for specific lsp servers
          settings = {
            Lua = {
              diagnostics = {
                disable = { "missing-fields" },
                globals = { "vim" },
              },
            },
          },
        },

        stylelint_lsp = {
          settings = {
            stylelintplus = {
              autoFixOnFormat = true,
              autoFixOnSave = true,
            },
          },
        },

        typos_lsp = {
          init_options = {
            diagnosticSeverity = "Hint",
          },
        },

        yamlls = {},
      },

      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      setup = {
        -- This function will be called for all LSP servers
        -- ["*"] = function(server, opts) end,
      },
    },
  },
}
