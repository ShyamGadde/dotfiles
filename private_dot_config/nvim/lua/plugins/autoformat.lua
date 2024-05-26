return { -- Autoformat
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  keys = {
    {
      '<leader>cf',
      function()
        require('conform').format { async = true, lsp_fallback = true }
      end,
      mode = { 'n', 'x' },
      desc = 'Code [F]ormat',
    },
  },
  config = function()
    require('conform').setup {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        css = { { 'prettierd', 'prettier' } },
        graphql = { { 'prettierd', 'prettier' } },
        html = { { 'prettierd', 'prettier' } },
        javascript = { { 'prettierd', 'prettier' } },
        javascriptreact = { { 'prettierd', 'prettier' } },
        json = { { 'prettierd', 'prettier' } },
        liquid = { { 'prettierd', 'prettier' } },
        lua = { 'stylua' },
        markdown = { { 'prettierd', 'prettier' } },
        python = { 'isort', 'black' },
        -- python = { 'ruff_format', 'ruff_organize_imports' },
        svelte = { { 'prettierd', 'prettier' } },
        typescript = { { 'prettierd', 'prettier' } },
        typescriptreact = { { 'prettierd', 'prettier' } },
        yaml = { { 'prettierd', 'prettier' } },
      },
      -- formatters = {
      --   ruff_organize_imports = {
      --     command = 'ruff',
      --     args = {
      --       'check',
      --       '--force-exclude',
      --       '--select=I001',
      --       '--fix',
      --       '--exit-zero',
      --       '--stdin-filename',
      --       '$FILENAME',
      --       '-',
      --     },
      --     stdin = true,
      --     cwd = require('conform.util').root_file {
      --       'pyproject.toml',
      --       'ruff.toml',
      --       '.ruff.toml',
      --     },
      --   },
      -- },
    }
  end,
}
