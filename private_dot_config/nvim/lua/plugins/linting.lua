return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        fish = {},
        sh = { "shellcheck" },
        zsh = { "shellcheck" },
        -- Run on all filetypes.
        -- ["*"] = {},
        -- Run on filetypes that don't have other linters configured.
        -- ["_"] = {},
      },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "shellcheck",
      },
    },
  },
}
