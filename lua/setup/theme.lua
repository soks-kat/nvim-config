return {
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    opts = {
      transparent = false,
    },
  },
  {
    'sho-87/kanagawa-paper.nvim',
    priority = 1000,
  },
  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    opts = {
      transparent = false,
    },
  },
  {
    -- dir = 'C:\\Users\\elies\\Documents\\Development\\nvim\\kanagawa-desat.nvim',
    'NullSeile/kanagawa-desat.nvim',
    priority = 1000,
    init = function()
      require('kanagawa-desat').setup {
        transparent = true,
      }
      vim.cmd 'colorscheme kanagawa-desat'
    end,
  },
}
