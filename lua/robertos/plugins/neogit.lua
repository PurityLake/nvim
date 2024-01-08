return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local neogit = require("neogit")
		neogit.setup({})

		vim.keymap.set("n", "<leader>gg", function()
			require("neogit").open()
		end, { desc = "Open Neogit" })

		vim.keymap.set("n", "<leader>gq", function()
			require("neogit").close()
		end, { desc = "Close Neogit" })

		vim.api.nvim_create_autocmd("User", {
			pattern = "NeogitPushComplete",
			group = nil,
			callback = require("neogit").close,
		})
	end,
}
