return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier" },
				c = { "clang-format" },
				rust = { "ast-grep" },
				python = { "black" },
				php = { "pretty-php" },
			},
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				local old_location = vim.api.nvim_win_get_cursor(0)
				require("conform").format({
					lsp_fallback = "always",
					bufnr = args.bufnr,
				})
				pcall(vim.api.nvim_win_set_cursor, 0, old_location)
			end,
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = "always",
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
