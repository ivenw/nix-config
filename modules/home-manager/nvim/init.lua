-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out,                            "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.loaded_netrw = 1
vim.g.netrwPlugin = 1

-- Enable true colors
vim.opt.termguicolors = true

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- column marker
vim.opt.colorcolumn = "100"

-- pane settings
vim.opt.splitright = true
vim.opt.splitbelow = true

-- cursorline
vim.opt.cursorline = true

-- tab settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

-- saving settings
vim.opt.swapfile = false
vim.opt.backup = false

-- line wrapping
vim.opt.wrap = false

-- search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

-- scroll settings
vim.opt.scrolloff = 8

-- shorten timeoutlen
vim.opt.timeoutlen = 500


local km = vim.keymap

-- Don't yank when single deleting
km.set("n", "x", '"_x')

-- Improve scrolling
km.set("n", "<C-u>", "<C-u>zz")
km.set("n", "<C-d>", "<C-d>zz")

-- Easy access to commands
km.set("n", "<leader><leader>", ":", { desc = "Open command line" })
km.set("n", "<leader>w", ":w<CR>", { desc = "Write file" })
km.set("n", "<leader>q", ":bd<CR>", { desc = "Close buffer" })

-- Clear search
km.set("n", "<leader>cs", ':let @/ = ""<CR>', { desc = "Clear search" })

-- unbind search
km.set("n", "n", "")

-- Split management
km.set("n", "<leader>pn", ":vnew<CR>", { desc = "New pane" })
km.set("n", "<leader>px", ":close<CR>", { desc = "Close pane" })

-- Rename
km.set("n", "<leader>R", function()
	local current_word = vim.fn.expand("<cword>")
	vim.ui.input({ prompt = "Replace: ", default = current_word }, function(input)
		if input == nil then
			return
		end
		vim.cmd("%s/\\<" .. current_word .. "\\>/" .. input .. "/g")
	end)
end, { desc = "Find and replace symbol" })

-- LSP
km.set("n", "<leader>i", vim.lsp.buf.hover, { desc = "Symbol info" })
km.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "Rename symbol" })
km.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Diagnostics info" })
km.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })

-- Setup lazy.nvim
require("lazy").setup({
	spec = { import = "plugins" },
	-- Automatically check for plugin updates
	checker = { enabled = true },
	change_detection = { enabled = false }
})
