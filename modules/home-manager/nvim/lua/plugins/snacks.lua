return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			bigfile = {},
			quickfile = {},
			input = { win = { style = { relative = "cursor" } } },
			picker = { enabled = true },
			git = {},
			lazygit = {},
			statuscolumn = {},
			terminal = {},
		},
		keys = {
			-- Picker
			{
				"<leader>f",
				function()
					Snacks.picker.smart()
				end,
				desc = "Find file",
			},
			{
				"<leader>tg",
				function()
					Snacks.picker.grep()
				end,
				desc = "Search",
			},
			{
				"<leader>td",
				function()
					Snacks.picker.lsp_definitions()
				end,
				desc = "Show definitions",
			},
			{
				"<leader>tr",
				function()
					Snacks.picker.lsp_references()
				end,
				desc = "Show references",
			},
			{
				"<leader>ts",
				function()
					Snacks.picker.lsp_symbols()
				end,
				desc = "Show symbols",
			},
			-- Git
			{
				"<leader>cb",
				function()
					Snacks.git.blame_line()
				end,
				desc = "Show commit details",
			},
			-- Lazygit
			{
				"<leader>nl",
				function()
					Snacks.lazygit()
				end,
				desc = "Toggle lazygit",
			},
			-- Terminal
			{
				"<leader>nn",
				function()
					Snacks.terminal.toggle()
				end,
				desc = "Toggle terminal",
			},
		},
	},
}
