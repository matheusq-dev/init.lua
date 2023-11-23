return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.4",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local osUtil = require("matheusq.plugins.utils.os")

		if osUtil.is_windows() then
			require("fzf-lua").setup({})

			vim.keymap.set(
				"n",
				"<leader>ff",
				"<cmd>lua require('telescope.builtin').find_files()<CR>",
				{ silent = true }
			)
			vim.keymap.set("n", "<leader>g", "<cmd>lua require('fzf-lua').live_grep_native()<CR>", { silent = true })
			vim.keymap.set(
				{ "n", "v" },
				"<leader>ig",
				"<cmd>lua require('telescope.builtin').live_grep()<CR>",
				{ silent = true }
			)
			vim.keymap.set("n", "<leader>t", "<cmd>lua require('telescope.builtin').quickfix()<CR>", { silent = true })
		end
	end,
}
