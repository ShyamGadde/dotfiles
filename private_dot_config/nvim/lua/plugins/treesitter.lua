return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "cpp",
        "css",
        "dockerfile",
        "gitignore",
        "php",
        "phpdoc",
      })

      -- Autoinstall languages that are not installed
      opts.auto_install = true

      opts.highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "php" },
      }
    end,
  },
}
