return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  cmd = 'Neotree',
  keys = {
    { '<leader>nf', '<cmd>Neotree filesystem reveal right<CR>', desc = '[N]eoTree reveal [F]ilesystem' },
    { '<leader>nb', '<cmd>Neotree buffers reveal right<CR>', desc = '[N]eoTree reveal [B]uffers' },
    { '<leader>ng', '<cmd>Neotree git_status reveal right<CR>', desc = '[N]eoTree reveal [G]it Status' },
  },
  opts = {
    source_selector = {
      winbar = true,
    },
  },
}
