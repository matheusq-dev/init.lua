require("fzf-lua").setup({})

vim.keymap.set("n", "<c-P>", "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
vim.keymap.set("n", "<leader>f", "<cmd>lua require('fzf-lua').live_grep_native()<CR>", { silent = true })
vim.keymap.set("v", "<leader>if", "<cmd>lua require('fzf-lua').grep_visual()<CR>", { silent = true })
vim.keymap.set("n", "<leader>t", "<cmd>lua require('fzf-lua').quickfix()<CR>", { silent = true })
