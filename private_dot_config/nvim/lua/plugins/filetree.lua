return {
  'nvim-neo-tree/neo-tree.nvim',
  version = "*",
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  keys = {
    { "<leader>n", "<cmd>Neotree toggle reveal position=right<CR>", desc = "[N]eoTree" },
  },
  config = function ()
    require('neo-tree').setup {}
  end,
}
