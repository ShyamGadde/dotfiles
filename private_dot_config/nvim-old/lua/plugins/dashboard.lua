return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

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
      dashboard.button('r', '  Restore workspace session', '<cmd> SessionRestore <CR>'),
      dashboard.button('.', '  Recent files', '<cmd> Telescope oldfiles <CR>'),
      dashboard.button('f', '󰥨  Find File', '<cmd> Telescope find_files <CR>'),
      dashboard.button('g', '󰱼  Live Grep', '<cmd> Telescope live_grep <CR>'),
      dashboard.button('u', '  Update Plugins', '<cmd> Lazy update <CR>'),
      dashboard.button('m', '󱌣  Mason', '<cmd> Mason <CR>'),
      dashboard.button('q', '  Quit NVIM', '<cmd> qa <CR>'),
    }

    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = 'AlphaButtonText'
      button.opts.hl_shortcut = 'AlphaShortcut'
    end
    dashboard.section.header.opts.hl = 'AlphaHeader'
    dashboard.section.buttons.opts.hl = 'AlphaButtons'
    dashboard.section.footer.opts.hl = 'AlphaFooter'

    -- Close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == 'lazy' then
      vim.cmd.close()
      vim.api.nvim_create_autocmd('User', {
        pattern = 'AlphaReady',
        callback = function()
          require('lazy').show()
        end,
      })
    end

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    vim.api.nvim_create_autocmd('User', {
      pattern = 'LazyVimStarted',
      callback = function()
        local stats = require('lazy').stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        -- local footer = fortune()
        local plugin_info = ' Loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins'
        local startup_time = ' ' .. ms .. 'ms'
        local v = vim.version()
        local nvim_version_info = ' ' .. 'v' .. v.major .. '.' .. v.minor .. '.' .. v.patch
        local info_bar = nvim_version_info .. '   ' .. plugin_info .. '   ' .. startup_time
        dashboard.section.footer.val = info_bar
        pcall(vim.cmd.AlphaRedraw)
      end,
    })

    -- Disable folding on alpha buffer
    vim.cmd [[autocmd FileType alpha setlocal nofoldenable]]
  end,
}
