-- This file can be loaded by calling `lua require('plugins')` from your init.

-- Only required if you have packer configured as `opt`
vim.cmd.packadd("packer.nvim")

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use("NvChad/base46")
	use("terrortylor/nvim-comment")
	use("hoob3rt/lualine.nvim")
	use("glepnir/dashboard-nvim")

	use("neovim/nvim-lspconfig") -- LSP
	use("jose-elias-alvarez/null-ls.nvim") -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
	use("jayp0521/mason-null-ls.nvim")
	use("MunifTanjim/prettier.nvim")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	use("onsails/lspkind-nvim") -- vscode-like pictograms
	use("hrsh7th/cmp-buffer") -- nvim-cmp source for buffer words

	use("hrsh7th/nvim-cmp") -- Completion
	use("hrsh7th/cmp-nvim-lsp") -- nvim-cmp source for neovim's built-in LSP
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

  use{"jose-elias-alvarez/typescript.nvim", requires = 'jose-elias-alvarez/nvim-lsp-ts-utils'}
    
	use("glepnir/lspsaga.nvim") -- LSP UIs
	use("L3MON4D3/LuaSnip")

	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-file-browser.nvim")
	use("nvim-telescope/telescope-symbols.nvim")
	use("nvim-tree/nvim-web-devicons")

  use 'helbing/aura.nvim'

	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("toggleterm").setup()
		end,
	})

	use({ "nvim-treesitter/nvim-treesitter" })
	use("nvim-treesitter/playground")
	use("theprimeagen/harpoon")
	use("mbbill/undotree")
	use("tpope/vim-fugitive")

	use({ "tzachar/cmp-tabnine", after = "nvim-cmp", run = "powershell ./install.ps1", requires = "hrsh7th/nvim-cmp" })

	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "tzachar/cmp-tabnine" },

			{ "hrsh7th/cmp-cmdline" },
			{ "ray-x/lsp_signature.nvim" },
			{ "onsails/lspkind-nvim" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	})

	use("folke/zen-mode.nvim")
	use("lewis6991/gitsigns.nvim")
	use("dinhhuy258/git.nvim") -- For git blame & browse

   use 'windwp/nvim-autopairs'
   use 'windwp/nvim-ts-autotag'

   use 'folke/lsp-colors.nvim'

end)
