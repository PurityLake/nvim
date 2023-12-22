return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({})
		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
				"pyright",
				"eslint",
				"rust_analyzer",
				"tsserver",
				"clojure_lsp",
				"clangd",
			},
			automatic_installation = true,
		})
		mason_tool_installer.setup({
			ensure_installed = {
				"black",
				"stylua",
				"pylint",
				"isort",
				"prettier",
				"clang-format",
				"ast-grep",
			},
		})
	end,
}
