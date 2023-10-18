local treesj = require('treesj')


treesj.setup({
  use_default_keymaps = false,
})

vim.keymap.set('n', 'gJ', require('treesj').join)
vim.keymap.set('n', 'gS', require('treesj').split)
