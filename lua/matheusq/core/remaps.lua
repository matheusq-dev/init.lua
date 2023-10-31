vim.g.mapleader = " "
vim.keymap.set("n", "<leader>p", '"_diwP')

vim.keymap.set({ "n", "v" }, "<C-w>", "<Cmd>bw<CR>")
vim.keymap.set({ "n", "v", "i" }, "<C-s>", ":silent write<CR> <BAR> :set termguicolors<CR>", { silent = true })

vim.keymap.set("i", "kj", "<Esc>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "5j")
vim.keymap.set("n", "K", "5k")

vim.keymap.set({ "n", "v" }, "<leader>h", "_")
vim.keymap.set({ "n", "v" }, "<leader>l", "$")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set({ "n", "v" }, "<leader>ip", [["+p]])

vim.keymap.set({ "n" }, "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set({ "n" }, "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
vim.keymap.set({ "n" }, "gh", "<Cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set({ "n" }, "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
