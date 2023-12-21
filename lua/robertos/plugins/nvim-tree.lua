return {
	"nvim-tree/nvim-tree.lua",
	requires = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup()
		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "<leader>tt", "<cmd>NvimTreeToggle<CR>", opts)
		vim.keymap.set("n", "<leader>tf", "<cmd>NvimTreeFocus<CR>", opts)
		vim.keymap.set("n", "<leader>ts", "<cmd>NvimTreeFindFile<CR>", opts)
		vim.keymap.set("n", "<leader>tc", "<cmd>NvimTreeCollapse<CR>", opts)
	end,
}
