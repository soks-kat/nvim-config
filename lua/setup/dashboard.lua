return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    local open_config = function()
      local config_path = vim.call('stdpath', 'config')
      vim.cmd('cd ' .. config_path)
      vim.cmd 'Neotree'
    end

    local additional_items = {
      {
        icon = ' ',
        desc = 'Configure Neovim    ',
        action = open_config,
        shortcut = 'SPC v',
      },
    }

    require('dashboard').setup {
      -- theme = 'hyper',
      theme = 'doom',
      preview = {
        -- command = 'lolcrab',
        -- command = vim.fn.stdpath 'config' .. '/test',
        command = 'python ' .. vim.fn.stdpath 'config' .. '/header.py',
        file_path = vim.fn.stdpath 'config' .. '/art.txt',
        file_width = 71,
        file_height = 13,
      },
      config = {
        center = {
          {
            icon = ' ',
            desc = 'New File            ',
            -- desc = vim.fn.hostname(),
            action = 'DashboardNewFile',
            shortcut = 'SPC o',
          },
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
