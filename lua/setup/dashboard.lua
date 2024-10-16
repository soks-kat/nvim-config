return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    local open_config = function()
      local config_path = vim.call('stdpath', 'config')
      vim.cmd('cd ' .. config_path)
      vim.cmd 'Neotree'
    end
    require('dashboard').setup {
      theme = 'doom',
      config = {
        center = {
          {
            icon = ' ',
            desc = 'New File            ',
            action = 'DashboardNewFile',
            shortcut = 'SPC o',
          },
          -- {
          --   icon = ' ',
          --   desc = 'Browse Files        ',
          --   shortcut = 'SPC n',
          -- },
          {
            icon = ' ',
            desc = 'Find File           ',
            action = 'Telescope find_files',
            shortcut = 'SPC f',
          },
          {
            icon = ' ',
            desc = 'Configure Neovim    ',
            action = open_config,
            shortcut = 'SPC v',
          },
          {
            icon = ' ',
            desc = 'Exit Neovim              ',
            action = 'quit',
          },
        },
      },
    }
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
}
