return {
   "kdheepak/lazygit.nvim",
   dependencies = {
    "nvim-lua/plenary.nvim",
   },
    config = function()
      vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", { silent = true })
    end
}

