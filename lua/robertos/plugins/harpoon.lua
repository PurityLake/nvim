return {
  "ThePrimeagen/harpoon",
  depenencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("harpoon").setup({
      global_settings = {
        save_on_toggle = true,
        save_on_change = true,
      },
    })
    vim.keymap.set("n", "<leader>mf", function()
      require("harpoon.mark").add_file()
    end)
    vim.keymap.set("n", "<leader>mq", function()
      require("harpoon.ui").toggle_quick_menu()
    end)
    for i = 1, 8 do
      vim.keymap.set("n", "<leader>" .. i, function()
        require("harpoon.ui").nav_file(i)
      end)
    end
    vim.keymap.set("n", "<leader>mn", function()
      require("harpoon.ui").nav_next()
    end)
    vim.keymap.set("n", "<leader>mp", function()
      require("harpoon.ui").nav_prev()
    end)

    require("telescope").load_extension("harpoon")
  end,
}
