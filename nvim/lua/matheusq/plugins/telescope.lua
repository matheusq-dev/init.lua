return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.4",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { silent = true })
		vim.keymap.set("n", "<leader>fr", builtin.resume, { silent = true })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { silent = true })
		vim.keymap.set("n", "<leader>fi", builtin.grep_string, { silent = true })
		vim.keymap.set("n", "<leader>ft", builtin.quickfix, { silent = true })
	end,
}
