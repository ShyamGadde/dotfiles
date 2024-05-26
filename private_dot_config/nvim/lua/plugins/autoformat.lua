return { -- Autoformat
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  keys = {
    {
      '<leader>cf',
      function()
        require('conform').format { async = true, lsp_fallback = true }
      end,
      mode = '',
      desc = 'Code [F]ormat',
    },
  },
  opts = {
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
      -- python = { 'isort', 'black' },
      python = { 'ruff_organize_imports', 'ruff_format' },
      svelte = { { 'prettierd', 'prettier' } },
      typescript = { { 'prettierd', 'prettier' } },
      typescriptreact = { { 'prettierd', 'prettier' } },
      yaml = { { 'prettierd', 'prettier' } },
    },
  },
}
