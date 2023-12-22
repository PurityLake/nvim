return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"onsails/lspkind.nvim",
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
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = {
				expand = function(args)
					vim.fn["vnip#anonymous"](args.body)
				end,
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp", keyword_length = 3 },
				{ name = "nvim_lsp_signature_help" },
				{ name = "nvim_lua", keyword_length = 3 },
				{ name = "buffer", keyword_length = 2 },
				{ name = "luasnip" },
				{ name = "vsnip", keyword_length = 2 },
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
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),
			formatting = {
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
