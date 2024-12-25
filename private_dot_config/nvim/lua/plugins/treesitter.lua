return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "cpp",
        "css",
        "dockerfile",
      })

      -- Auto install languages that are not installed
      opts.auto_install = true
    end,
  },
}
