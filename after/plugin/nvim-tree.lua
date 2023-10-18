require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    side = 'right',
    width = 40,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

vim.keymap.set({"n"}, "<leader>e", "<Cmd>:NvimTreeToggle<CR>")
