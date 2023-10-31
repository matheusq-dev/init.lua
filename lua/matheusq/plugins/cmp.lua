return {
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter", "BufEnter", "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets", -- useful snippets
		"onsails/lspkind.nvim", -- vs-code like pictograms
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		local ELLIPSIS_CHAR = "…"
		local MAX_LABEL_WIDTH = 20
		local MIN_LABEL_WIDTH = 20

		-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			completion = {
				completeopt = "menu, menuone, preview, noselect",
			},
			snippet = { -- configure how nvim-cmp interacts with snippet engine
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<Tab>"] = cmp.mapping(function(fallback)
					vim.opt.termguicolors = true
					if cmp.visible() then
						cmp.confirm({ select = true })
					elseif luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					else
						fallback()
					end
				end, {
					"i",
					"s",
				}),
			}),
			-- sources for autocompletion
			sources = cmp.config.sources({
				{ name = "nvim_lsp", priority = 50, keyword_length = 3 }, -- lsp
				{ name = "buffer", priority = 40, keyword_length = 3 }, -- text within current buffer
				{ name = "luasnip", priority = 30, keyword_length = 3 }, -- snippets
				{ name = "path", priority = 20, keyword_length = 3 }, -- file system paths
				{ name = "nvim_lsp_signature_help", keyword_length = 3 }, -- display function signatures with current parameter emphasized
				{ name = "nvim_lua", keyword_length = 3 }, -- complete neovim's Lua runtime API such vim.lsp.*
				{ name = "vsnip", keyword_length = 3 }, -- nvim-cmp source for vim-vsnip
				{ name = "calc" }, -- source for math calculation
			}),
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			experimental = {
				ghost_text = true,
			},
			-- configure lspkind for vs-code like icons
			formatting = {
				format = function(entry, vim_item)
					local label = vim_item.abbr
					local truncated_label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH)
					if truncated_label ~= label then
						vim_item.abbr = truncated_label .. ELLIPSIS_CHAR
					elseif string.len(label) < MIN_LABEL_WIDTH then
						local padding = string.rep(" ", MIN_LABEL_WIDTH - string.len(label))
						vim_item.abbr = label .. padding
					end
					return vim_item
				end,
			},
			vim.api.nvim_create_autocmd("BufEnter", {
				callback = function()
					vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
				end,
			}),
		})
	end,
}
