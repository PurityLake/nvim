return {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			python = { "flake8", "mypy" },
			cpp = { "clangtidy" },
			javascript = { "eslint" },
			php = { "phpcs" },
			json = { "jsonlint" },
		}
		vim.keymap.set("n", "<leader>nl", function()
			require("lint").try_lint()
		end)
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
