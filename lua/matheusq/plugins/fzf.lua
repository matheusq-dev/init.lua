return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local osUtil = require("matheusq.plugins.utils.os")
		local fzf = require("fzf-lua")

		local function dropdown(opts, ...)
			opts = opts or { winopts = {} }

			return vim.tbl_deep_extend("force", {
				prompt = prompt,
				fzf_opts = { ["--layout"] = "reverse" },
				winopts = {
					title_pos = (opts.winopts and opts.winopts.title) and "center" or nil,
					height = 0.70,
					width = 0.45,
					row = 0.1,
					col = 0.5,
					preview = { hidden = "hidden", layout = "vertical", vertical = "up:50%" },
				},
			}, opts, ...)
		end

		if osUtil.is_windows() == false then
			require("fzf-lua").setup({})

			vim.keymap.set("n", "<leader>ff", "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
			vim.keymap.set("n", "<leader>g", "<cmd>lua require('fzf-lua').live_grep_native()<CR>", { silent = true })
			vim.keymap.set(
				{ "n", "v" },
				"<leader>ig",
				"<cmd>lua require('fzf-lua').grep_visual()<CR>",
				{ silent = true }
			)
			vim.keymap.set("n", "<leader>t", "<cmd>lua require('fzf-lua').quickfix()<CR>", { silent = true })
			fzf.register_ui_select(dropdown({
				winopts = { title = "Select one of:", height = 0.33, row = 0.5 },
			}))
		end
	end,
}
