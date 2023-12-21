return {
	"voldikss/vim-floaterm",
	config = function()
		vim.keymap.set("n", "<leader>fn", "<cmd>FloatermNew --name=term<CR>")
		vim.keymap.set("n", "<C-f>t", "<cmd>FloatermToggle term<CR>")
	end,
}
