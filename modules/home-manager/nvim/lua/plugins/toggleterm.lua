return {
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup()

			local Terminal = require("toggleterm.terminal").Terminal
			local term = Terminal:new({
				dir = "git_dir",
				direction = "float",
				float_opts = {
					border = "curved",
				},
				on_open = function(term)
					vim.cmd("startinsert!")
					vim.api.nvim_buf_set_keymap(
						term.bufnr,
						"n",
						"q",
						"<cmd>close<CR>",
						{ noremap = true, silent = true }
					)
				end,
				on_close = function(term)
					vim.cmd("startinsert!")
				end,
			})

			local lazygit = Terminal:new({
				cmd = "lazygit",
				dir = "git_dir",
				direction = "float",
				float_opts = {
					border = "curved",
				},
				on_open = function(term)
					vim.cmd("startinsert!")
					vim.api.nvim_buf_set_keymap(
						term.bufnr,
						"n",
						"q",
						"<cmd>close<CR>",
						{ noremap = true, silent = true }
					)
				end,
				on_close = function(term)
					vim.cmd("startinsert!")
				end,
			})

			function _term_toggle()
				term:toggle()
			end

			function _lazygit_toggle()
				lazygit:toggle()
			end

			local km = vim.keymap
			km.set(
				"n",
				"<leader>nn",
				"<cmd>lua _term_toggle()<CR>",
				{ noremap = true, silent = true, desc = "Toggle terminal" }
			)
			km.set(
				"n",
				"<leader>nl",
				"<cmd>lua _lazygit_toggle()<CR>",
				{ noremap = true, silent = true, desc = "Toggle lazygit" }
			)
			km.set("t", "<leader><esc>", "<cmd>close<CR>", { noremap = true, silent = true })
		end,
	},
}
