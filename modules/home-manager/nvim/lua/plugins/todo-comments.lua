return {
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			highlight = {
				keyword = "",
				after = "",
			},
		},
		config = function(_, opts)
			require("todo-comments").setup(opts)
			vim.keymap.set("n", "<leader>tc", ":TodoTelescope<CR>", { desc = "Search todos" })
		end,
	},
}
