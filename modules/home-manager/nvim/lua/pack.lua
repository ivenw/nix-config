local gh = function(x)
	return "https://github.com/" .. x
end

local km = vim.keymap.set

-- rebuild parsers when updating nvim-treesitter
vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "nvim-treesitter" and kind == "update" then
			-- TODO: Not sure this line is needed so disabled for now.
			-- if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
			vim.cmd("TSUpdate")
		end
	end,
})

vim.pack.add({
	gh("catppuccin/nvim"),
	{ src = gh("nvim-treesitter/nvim-treesitter"),             version = "main" },
	{ src = gh("nvim-treesitter/nvim-treesitter-textobjects"), version = "main" },

	gh("neovim/nvim-lspconfig"),
	gh("creativenull/efmls-configs-nvim"),

	gh("nvim-mini/mini.nvim"),
	gh("folke/snacks.nvim"),

	gh("JoosepAlviste/nvim-ts-context-commentstring"),
	-- Automatically close html tags
	gh("windwp/nvim-ts-autotag"),
	gh("tpope/vim-sleuth"),
	gh("folke/lazydev.nvim"),
})

require("catppuccin").setup({
	flavour = "macchiato",
	styles = {
		loops = { "italic" },
		keywords = { "italic" },
	},
})
vim.cmd.colorscheme("catppuccin")

vim.lsp.config("ruff", {
	init_options = {
		settings = { organizeImports = true, fixAll = true },
		format = { enable = true },
		lint = { enable = true },
	},
})
vim.lsp.enable({
	"lua_ls",
	"clangd",
	"rust_analyzer",
	"ts_ls",
	"nil_ls",
	"ruff",
	"ty",
	"zls",
	"gopls",
	"tailwindcss",
	"efm",
})

local shellcheck = require("efmls-configs.linters.shellcheck")
local shfmt = require("efmls-configs.formatters.shfmt")
local eslint = require("efmls-configs.linters.eslint")
local prettier = require("efmls-configs.formatters.prettier")
local stylua = require("efmls-configs.formatters.stylua")
local alejandra = require("efmls-configs.formatters.alejandra")
local rustfmt = require("efmls-configs.formatters.rustfmt")
local gofmt = require("efmls-configs.formatters.gofmt")
local terraformfmt = require("efmls-configs.formatters.terraform_fmt")
local sql_formatter = require("efmls-configs.formatters.sql-formatter")
local yamllint = require("efmls-configs.linters.yamllint")
local taplo = require("efmls-configs.formatters.taplo")
local hadolint = require("efmls-configs.linters.hadolint")
local markdownlint = require("efmls-configs.linters.markdownlint")

local languages = {
	sh = { shellcheck, shfmt },
	lua = { stylua },
	nix = { alejandra },
	rust = { rustfmt },
	go = { gofmt },
	css = { prettier },
	json = { prettier },
	yaml = { prettier, yamllint },
	toml = { taplo },
	dockerfile = { hadolint },
	html = { prettier },
	htmldjango = { prettier },
	terraform = { terraformfmt },
	javascript = { eslint, prettier },
	sql = { sql_formatter },
	-- markdown = { markdownlint },
}

vim.lsp.config("efm", {
	filetypes = vim.tbl_keys(languages),
	settings = { languages = languages },
	init_options = {
		documentFormatting = true,
		documentRangeFormatting = true,
	},
})

require("mini.basics").setup()
require("mini.extra").setup()
require("mini.icons").setup()
require("mini.comment").setup({
	options = {
		custom_commentstring = function()
			return require("ts_context_commentstring").calculate_commentstring() or vim.bo.commentstring
		end,
	},
})

require("mini.ai").setup()
require("mini.surround").setup()
require("mini.statusline").setup()
require("mini.completion").setup()

require("mini.trailspace").setup()
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		MiniTrailspace.trim()
	end,
})

local hipatterns = require("mini.hipatterns")
hipatterns.setup({
	highlighters = {
		hex_colors = hipatterns.gen_highlighter.hex_color(),
		todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
	},
})

require("mini.diff").setup({
	view = {
		style = "sign",
		signs = { add = "│", delete = "│", change = "│" },
		-- signs = { add = "+", delete = "-", change = "~" },
	},
})

require("mini.git").setup()
-- vim.keymap.set("n", "<leader>cb", MiniGit.show_at_cursor, { desc = "Show blame" })

require("mini.pick").setup({})
km("n", "<leader>f", function()
	MiniPick.builtin.files({ tools = git })
end, { desc = "Pick files" })
km("n", "<leader>tg", function()
	MiniPick.builtin.grep_live()
end, { desc = "Live grep" })
km("n", "<leader>td", function()
	MiniExtra.pickers.lsp({ scope = "definition" })
end, { desc = "Show definitions" })
km("n", "<leader>tr", function()
	MiniExtra.pickers.lsp({ scope = "references" })
end, { desc = "Show references" })
km("n", "<leader>tb", function()
	MiniExtra.pickers.buf_lines({ scope = "current", preserve_order = true })
end, { desc = "Search buffer" })
km("n", "<leader>ts", function()
	MiniExtra.pickers.lsp({ scope = "document_symbol" })
end, { desc = "Search doument symbols" })
km("n", "<leader>tp", function()
	MiniExtra.pickers.hipatterns({ scope = "all" })
end, { desc = "Search hipatterns" })

require("mini.files").setup({})
km("n", "<leader>tf", function()
	MiniFiles.open()
end, { desc = "File browser" })

local clue = require("mini.clue")
clue.setup({
	triggers = {
		-- Leader triggers
		{ mode = "n", keys = "<Leader>" },
		{ mode = "x", keys = "<Leader>" },

		-- Built-in completion
		{ mode = "i", keys = "<C-x>" },

		-- `g` key
		{ mode = "n", keys = "g" },
		{ mode = "x", keys = "g" },

		-- 's' key
		{ mode = "n", keys = "s" },
		{ mode = "x", keys = "s" },

		-- Marks
		{ mode = "n", keys = "'" },
		{ mode = "n", keys = "`" },
		{ mode = "x", keys = "'" },
		{ mode = "x", keys = "`" },

		-- Registers
		{ mode = "n", keys = '"' },
		{ mode = "x", keys = '"' },
		{ mode = "i", keys = "<C-r>" },
		{ mode = "c", keys = "<C-r>" },

		-- Window commands
		{ mode = "n", keys = "<C-w>" },

		-- `z` key
		{ mode = "n", keys = "z" },
		{ mode = "x", keys = "z" },
	},

	clues = {
		clue.gen_clues.builtin_completion(),
		clue.gen_clues.g(),
		clue.gen_clues.marks(),
		clue.gen_clues.registers(),
		clue.gen_clues.windows(),
		clue.gen_clues.z(),
	},
	window = { delay = 0, config = { width = "auto" } },
})

require("snacks").setup({
	-- LSP aware file renaming
	rename = {},

	-- Prettier statuscolumn
	statuscolumn = {},

	-- Indicate indentscope
	indent = {
		indent = { char = "┊" },
		animate = { enabled = false },
		scope = { enabled = false, char = "┊", only_current = true },
	},

	-- Integrate lazygit into nvim
	lazygit = { win = { style = { backdrop = false } } },
})

vim.keymap.set("n", "<leader>nl", function()
	Snacks.lazygit()
end, { desc = "Toggle lazygit" })

-- Let LSP know that a file was renamed by MiniFiles
vim.api.nvim_create_autocmd("User", {
	pattern = "MiniFilesActionRename",
	callback = function(event)
		Snacks.rename.on_rename_file(event.data.from, event.data.to)
	end,
})

require("nvim-treesitter-textobjects").setup({
	select = {
		enable = true,
		lookahead = true,
		keymaps = {
			["af"] = "@function.outer",
			["if"] = "@function.inner",
			["ac"] = "@class.outer",
			["ic"] = "@class.inner",
		},
	},
	swap = {
		enable = true,
		swap_next = { ["<leader>sn"] = "@parameter.inner" },
		swap_previous = { ["<leader>sp"] = "@parameter.inner" },
	},
})

require("ts_context_commentstring").setup({
	enable_autocmd = false,
})

---@diagnostic disable-next-line: missing-fields
require("lazydev").setup({ integrations = { cmp = false } })
