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
                -- FIX: This apparently doesn't disable diagnostics.
                ignore = { "*" },
              },
            },
          },
        },

        emmet_ls = {},

        harper_ls = {
          settings = {
            ["harper-ls"] = {
              -- userDictPath = "$XDG_CONFIG_HOME/harper-ls",
              -- fileDictPath = "$XDG_DATA_HOME/harper-ls/file_dictionaries",
              diagnosticSeverity = "hint", -- Can also be "information", "warning", or "error"
              linters = {
                an_a = true,
                avoid_curses = true,
                correct_number_suffix = true,
                linking_verbs = false,
                long_sentences = true,
                matcher = true,
                multiple_sequential_pronouns = true,
                number_suffix_capitalization = true,
                repeated_words = true,
                sentence_capitalization = true,
                spaces = true,
                spell_check = true,
                spelled_numbers = false,
                terminating_conjunctions = true,
                unclosed_quotes = true,
                wrong_quotes = false,
              },
              codeActions = {
                -- Set this to true if you want consistent code actions (actions which aren't dependent on specific words)
                -- to appear at the top.
                forceStable = false,
              },
            },
          },
        },

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

      -- You can do any additional LSP server setup here,
      -- return true if you don't want this server to be setup with `nvim-lspconfig`.
      setup = {
        -- This function will be called for all LSP servers
        -- ["*"] = function(server, opts) end,
      },
    },
  },
}
