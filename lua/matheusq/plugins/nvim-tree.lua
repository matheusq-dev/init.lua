return {
  "nvim-tree/nvim-tree.lua",
  config = function()
    require("nvim-tree").setup({
      actions = {
        open_file = {
            quit_on_open = true,
        },
      },
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
  end
}
