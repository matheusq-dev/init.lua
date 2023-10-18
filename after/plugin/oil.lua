local oil = require('oil')
oil.setup({
  keymaps = {
    ['<C-b>'] = hide,
    ['<C-c>'] = close,
    ['<C-d>'] = directory_selection,
  },

})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set('n', '<C-e>', function()
  oil.toggle_float()
end)
