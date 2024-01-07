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

		local old_open = neogit.open
		local old_close = neogit.close

		---@diagnostic disable-next-line: duplicate-set-field
		neogit.open = function(...)
			old_open(...)
			vim.keymap.set("n", "<leader>gq", function()
				require("neogit").close()
			end, { desc = "Close Neogit if it is open already" })
		end

		neogit.close = function(...)
			old_close(...)
		end

		vim.keymap.set("n", "<leader>gg", function()
			require("neogit").open()
		end, { desc = "Open Neogit" })

		local group = vim.api.nvim_create_augroup("MyNeogitEvents", { clear = true })
		vim.api.nvim_create_autocmd("User", {
			pattern = "NeogitPushComplete",
			group = group,
			callback = require("neogit").close,
		})
	end,
}
