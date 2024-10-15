return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      -- open_mapping = [[<leader>o]],
      start_in_insert = true,
    }
    vim.keymap.set('n', '<leader>o', ':ToggleTerm<Cr>')
    local exitTerm = function()
      vim.cmd ':ToggleTerm'
    end

    vim.keymap.set('t', '<esc><esc>', exitTerm)
  end,
}
