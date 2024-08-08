return {
	"hrsh7th/nvim-cmp",
	dependencies = { "onsails/lspkind.nvim", "nvim-tree/nvim-web-devicons" },
	event = { "InsertEnter", "BufEnter", "BufReadPre", "BufNewFile" },
	config = function()
		-- require("matheusq.snippets")

		vim.opt.completeopt = { "menu", "menuone", "noselect" }
		vim.opt.shortmess:append("c")

		local lspkind = require("lspkind")
		lspkind.init({})

		local cmp = require("cmp")

		cmp.setup({
			sources = {
				{ name = "nvim_lsp" },
				{ name = "cody" },
				{ name = "path" },
				{ name = "buffer" },
			},
			mapping = {
				["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-y>"] = cmp.mapping(
					cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Insert,
						select = true,
					}),
					{ "i", "c" }
				),
			},

			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol_text", -- show symbol and text
					maxwidth = 50, -- limit completion item width
					ellipsis_char = "...", -- when text is truncated
					before = function(entry, vim_item)
						-- Add nvim-web-devicons
						local icons = require("nvim-web-devicons")
						local icon, hl_group = icons.get_icon(entry:get_completion_item().label)
						if icon then
							vim_item.kind = icon .. " " .. vim_item.kind
							vim_item.kind_hl_group = hl_group
						end
						return vim_item
					end,
				}),
			},

			-- Enable luasnip to handle snippet expansion for nvim-cmp
			snippet = {
				expand = function(args)
					vim.snippet.expand(args.body)
				end,
			},
		})
	end,
}
