return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  dependencies = { 'hrsh7th/nvim-cmp' },
  opts = {
    check_ts = true, -- enable treesitter
    ts_config = {
      lua = { 'string' }, -- don't add pairs in lua string treesitter nodes
      javascript = { 'template_string' }, -- don't add pairs in javascript template_string
    },
  },
  config = function(_, opts)
    require('nvim-autopairs').setup(opts)
    -- If you want to automatically add `(` after selecting a function or method
    local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
    local cmp = require 'cmp'
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
  end,
}
