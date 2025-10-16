-- Set leader to <Space>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.loaded_netrw = 1
vim.g.netrwPlugin = 1

vim.opt.termguicolors = true  -- Enable true colors. Terminal needs to support this.
vim.opt.number = true         -- Enable line numbers
vim.opt.relativenumber = true -- Line numbers relative to current cursorline
vim.opt.cursorline = true     -- Enable highlight of current cursorline
vim.opt.scrolloff = 8         -- Always keep this many lines under/above the curser when scrolling down/up
vim.opt.wrap = false          -- Disable line wrapping when window is too small
vim.opt.swapfile = false      -- Disable swap file
vim.opt.colorcolumn = "100"   -- Mark the width of the buffer
vim.opt.winborder = "rounded" -- Set style of floating window borders
vim.opt.winbar = " "          -- Empty winbar to add some padding to the top

-- Pane settings
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Tab settings
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true

-- Search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

vim.opt.timeoutlen = 500 -- Default is 1000
vim.opt.ttimeoutlen = 50 -- Default is 100
