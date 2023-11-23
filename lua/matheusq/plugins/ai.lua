return {
	"Exafunction/codeium.nvim",
	event = { "InsertEnter", "BufEnter", "BufReadPre", "BufNewFile", "CursorMovedI" },
	after = "nvim-cmp",
	config = function()
		require("codeium").setup({})
	end,
}
