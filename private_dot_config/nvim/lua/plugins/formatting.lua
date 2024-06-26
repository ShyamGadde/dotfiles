return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        fish = {},
        zsh = { "shfmt" },
        -- Run on all filetypes.
        -- ["*"] = {},
        -- Run on filetypes that don't have other formatters configured.
        ["_"] = { "trim_whitespace", "trim_newlines" },
      },
      formatters = {
        shfmt = {
          -- i 4: Sets indentation to 4 spaces.
          -- bn: Places binary operators at the beginning of the next line.
          -- ci: Controls case statement indentation.
          -- sr: Simplifies formatting rules.
          prepend_args = { "-i", "4", "-bn", "-ci", "-sr" },
        },
      },
    },
  },

  -- {
  --   "mason.nvim",
  --   opts = {
  --     ensure_installed = {},
  --   },
  -- },
}
