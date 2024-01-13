return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require("nvim-treesitter.configs").setup({
			modules = {},
			ensure_installed = { "lua", "rust", "toml", "javascript", "clojure", "python", "php" },
			auto_install = true,
			sync_install = false,
			ignore_install = {},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			ident = { enable = true },
			rainbow = {
				enable = true,
				extended_mode = true,
				max_file_lines = nil,
			},
		})

		-- Opening files does not fold all sections of code
		vim.api.nvim_command("augroup open_folds")
		vim.api.nvim_command("autocmd BufReadPost,FileReadPost * normal zR")
		vim.api.nvim_command("augroup END")
	end,
}
