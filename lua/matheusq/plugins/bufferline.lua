return {
  'akinsho/bufferline.nvim',
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    vim.opt.termguicolors = true
    require("bufferline").setup{}

    vim.keymap.set({"n", "v"}, "<Tab>", "<Cmd>BufferLineCycleNext<CR>")
    vim.keymap.set({"n", "v"}, "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>")
  end
}
