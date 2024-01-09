return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		-- LSP completion source:
		"hrsh7th/cmp-nvim-lsp",

		-- Useful completion sources:
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"hrsh7th/cmp-vsnip",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",
		"hrsh7th/vim-vsnip",
	},
	config = function()
		local cmp = require("cmp")

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = {
				expand = function(args)
					vim.fn["vsnip#anonymous"](args.body)
				end,
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "nvim_lsp_signature_help" },
				{ name = "nvim_lua" },
				{ name = "buffer" },
				{ name = "vsnip" },
				{ name = "path" },
				{ name = "calc" },
			}),
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<M-j>"] = cmp.mapping.select_next_item(),
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<M-k>"] = cmp.mapping.select_prev_item(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}),
			formatting = {
				expandable_indicator = true,
				fields = { "menu", "abbr", "kind" },
				format = function(entry, item)
					local menu_icon = {
						nvim_lsp = "λ",
						vsnip = "⋗",
						buffer = "Ω",
						path = "🖫",
					}
					item.menu = menu_icon[entry.source.name]
					return item
				end,
			},
		})
	end,
}
