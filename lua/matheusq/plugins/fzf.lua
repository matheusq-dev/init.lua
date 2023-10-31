return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("fzf-lua").setup({})

    vim.keymap.set("n", "<leader>ff", "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
    vim.keymap.set("n", "<leader>g", "<cmd>lua require('fzf-lua').live_grep_native()<CR>", { silent = true })
    vim.keymap.set({"n", "v"}, "<leader>ig", "<cmd>lua require('fzf-lua').grep_visual()<CR>", { silent = true })
    vim.keymap.set("n", "<leader>t", "<cmd>lua require('fzf-lua').quickfix()<CR>", { silent = true })
  end
}
