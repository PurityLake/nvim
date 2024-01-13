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
				-- lua
				"lua_ls",
				-- python
				"pylsp",
				-- zig
				"zls",
				-- ocaml
				"ocamllsp",
				-- javascript
				"tsserver",
				-- rust
				"rust_analyzer",
				-- clojure
				"clojure_lsp",
				-- c/c++
				"clangd",
				-- php
				"phpactor",
			},
			automatic_installation = true,
		})
		mason_tool_installer.setup({
			ensure_installed = {
				-- python
				"black",
				"flake8",
				"mypy",
				-- lua
				"stylua",
				-- javascript
				"prettier",
				"eslint",
				-- c/c++
				"clang-format",
				-- rust
				"ast-grep",
				-- php
				"phpcs",
				"pretty-php",
			},
		})
	end,
}
