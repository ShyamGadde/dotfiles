return {
  {
    "stevearc/conform.nvim",
    optional = true,
    vscode = true,
    opts = {
      -- NOTE: (Note to self)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style like C and C++. (refer kickstart.nvim for more info)
      formatters_by_ft = {
        css = {},
        fish = {},
        scss = {},
        zsh = { "shfmt" },
        -- Run on all filetypes.
        -- ["*"] = {},
        -- Run on filetypes that don't have other formatters configured.
        ["_"] = { "trim_whitespace", "trim_newlines" },
      },
      formatters = {
        shfmt = {
          -- INFO:
          -- i 4: Sets indentation to 4 spaces.
          -- bn: Places binary operators at the beginning of the next line.
          -- ci: Controls case statement indentation.
          -- sr: Simplifies formatting rules.
          prepend_args = { "-i", "4", "-bn", "-ci", "-sr" },
        },
        injected = {
          -- Set the options field
          options = {
            ignore_errors = true,
            lang_to_formatters = {
              -- json = { "jq" },
            },
            -- Map of treesitter language to file extension
            -- A temporary file name with this extension will be generated during formatting
            -- because some formatters care about the filename.
            lang_to_ext = {
              bash = "sh",
              javascript = "js",
              latex = "tex",
              markdown = "md",
              python = "py",
              typescript = "ts",
            },
          },
        },
      },
    },
  },

  -- {
  --   "williamboman/mason.nvim",
  --   opts = {
  --     ensure_installed = {},
  --   },
  -- },
}
