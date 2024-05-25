return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'
    local fortune = require 'alpha.fortune'

    -- Set header
    dashboard.section.header.val = {
      [[                                                                   ]],
      [[      ████ ██████           █████      ██                    ]],
      [[     ███████████             █████                            ]],
      [[     █████████ ███████████████████ ███   ███████████  ]],
      [[    █████████  ███    █████████████ █████ ██████████████  ]],
      [[   █████████ ██████████ █████████ █████ █████ ████ █████  ]],
      [[ ███████████ ███    ███ █████████ █████ █████ ████ █████ ]],
      [[██████  █████████████████████ ████ █████ █████ ████ ██████]],
      [[                                                                     ]],
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button('e', '  New File', '<cmd> ene <BAR> startinsert <CR>'),
      dashboard.button('r', '  Recent files', ':Telescope oldfiles <CR>'),
      dashboard.button('f', '󰥨  Find File', '<cmd> Telescope find_files <CR>'),
      dashboard.button('g', '󰱼  Find Word', '<cmd> Telescope live_grep <CR>'),
      dashboard.button('u', '  Update Plugins', '<cmd> Lazy update <CR>'),
      dashboard.button('m', '󱌣  Mason', '<cmd> Mason <CR>'),
      dashboard.button('q', '  Quit NVIM', '<cmd> qa <CR>'),
    }

    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = 'AlphaButtons'
      button.opts.hl_shortcut = 'AlphaShortcut'
    end
    dashboard.section.header.opts.hl = 'AlphaHeader'
    dashboard.section.buttons.opts.hl = 'AlphaButtons'
    dashboard.section.footer.opts.hl = 'AlphaFooter'

    -- dashboard.opts.layout[1].val = 7

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    vim.api.nvim_create_autocmd('User', {
      pattern = 'LazyVimStarted',
      callback = function()
        local stats = require('lazy').stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        local footer = fortune()
        local info = '           ⚡ ' .. stats.count .. ' plugins loaded in ' .. ms .. 'ms'
        table.insert(footer, 1, info)
        dashboard.section.footer.val = footer
        pcall(vim.cmd.AlphaRedraw)
      end,
    })

    -- Disable folding on alpha buffer
    vim.cmd [[autocmd FileType alpha setlocal nofoldenable]]
  end,
}
