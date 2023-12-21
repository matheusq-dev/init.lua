local function LspToggle()
	if vim.g.diagnostic_virtual_text_enabled == true then
		vim.diagnostic.config({ virtual_text = false })
		vim.g.diagnostic_virtual_text_enabled = false
	else
		vim.diagnostic.config({ virtual_text = true })
		vim.g.diagnostic_virtual_text_enabled = true
	end
end

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
vim.keymap.set({ "n", "v" }, "=", "<Cmd>lua require('treesj').toggle()<CR>")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set({ "n", "v" }, "<leader>ip", [["+p]])
vim.keymap.set({ "n", "v" }, "<leader>t", function()
	LspToggle()
end)

vim.keymap.set({ "n" }, "'", "ysiw'")

vim.keymap.set({ "n" }, "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set({ "n" }, "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
vim.keymap.set({ "n" }, "gh", "<Cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set({ "n" }, "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
vim.keymap.set({ "n" }, "?", "<cmd>lua vim.lsp.buf.code_action()<CR>")

vim.keymap.set({ "n" }, "|", "<cmd>vsplit<CR>")

vim.g.saved_cursor_position = {}

-- Map Ctrl-y to insert a new line below and return to the exact cursor position
vim.keymap.set(
	"n",
	"<leader>o",
	'<Esc>:let g:saved_cursor_position = getpos(".")<CR>o<Up><Esc>:call setpos(".", g:saved_cursor_position)<CR>'
)

-- Map Ctrl-z to insert a new line above and return to the exact cursor position
vim.keymap.set(
	"n",
	"<leader>O",
	'<Esc>:let g:saved_cursor_position = getpos(".")<CR>O<Down><Esc>:let g:saved_cursor_position[1] = g:saved_cursor_position[1] + 1<CR>:call setpos(".", g:saved_cursor_position)<CR>'
)

vim.keymap.set({ "n" }, "<leader>dd", function()
	if vim.g.file_diff == true then
		vim.cmd("DiffviewClose")
		vim.g.file_diff = false
	else
		vim.cmd("DiffviewFileHistory %")
		vim.g.file_diff = true
	end
end)
