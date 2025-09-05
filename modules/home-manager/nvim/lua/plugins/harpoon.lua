return {
	"ThePrimeagen/harpoon",
	dependencies = "nvim-lua/plenary.nvim",
	opts = {},
	keys = {
		{ "<leader>hh", function() require("harpoon.ui").toggle_quick_menu() end, desc = "Harpoon menu" },
		{ "<leader>ha", function() require("harpoon.mark").add_file() end,        desc = "Add file" },
		{ "<leader>hf", function() require("harpoon.ui").nav_file(1) end,         desc = "Go to file #1" },
		{ "<leader>hp", function() require("harpoon.ui").nav_file(2) end,         desc = "Go to file #2" },
		{ "<leader>hs", function() require("harpoon.ui").nav_file(3) end,         desc = "Go to file #3" },
		{ "<leader>ht", function() require("harpoon.ui").nav_file(4) end,         desc = "Go to file #4" },
	}
}
