return {
	"mattn/emmet-vim",
	"tpope/vim-surround",
	"matze/vim-move",
	"mg979/vim-visual-multi",
	"christoomey/vim-tmux-navigator",
	"sindrets/diffview.nvim",
	"Wansmer/treesj",
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},
	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
}
