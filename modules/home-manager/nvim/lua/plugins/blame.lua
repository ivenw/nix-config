return {
	{
		"FabijanZulj/blame.nvim",
		lazy = false,
		config = function()
			local km = vim.keymap
			require("blame").setup({
				km.set("n", "<leader>b", "<cmd>BlameToggle<CR>", { desc = "Toggle Blame" }),
			})
		end,
	},
}
