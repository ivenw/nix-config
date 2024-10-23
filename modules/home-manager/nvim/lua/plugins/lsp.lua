return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		init = function()
			local lsp_zero = require("lsp-zero").preset({})
			lsp_zero.extend_lspconfig()
			lsp_zero.on_attach(function(_, bufnr)
				-- see :help lsp-zero-keybindings
				-- to learn the available actions
				lsp_zero.default_keymaps({ buffer = bufnr })
			end)
			lsp_zero.extend_cmp()
			require("lspconfig").lua_ls.setup(lsp_zero.nvim_lua_ls())
			require("lspconfig").rust_analyzer.setup({
				settings = {
					["rust-analyzer"] = {
						files = {
							excludeDirs = {
								"target",
								"node_modules",
								".git",
								".cargo",
								".direnv",
							},
							watcherExlude = {
								"target",
								"node_modules",
								".git",
								".cargo",
								".direnv",
							},
						},
						checkOnSave = {
							command = "clippy",
						},
						diagnostics = {
							enable = true,
							experimental = { enable = true },
						},
					},
				},
			})

			lsp_zero.setup_servers({
				"nil_ls",
				-- "ruff",
				"ruff_lsp",
				"pyright",
				"efm",
				"zls",
				"gopls",
				"terraformls",
				"tflint",
				"tailwindcss",
			})
		end,
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
		},
	},

	-- Formatting
	{
		"creativenull/efmls-configs-nvim",
		-- "ivenw/efmls-configs-nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			local shellcheck = require("efmls-configs.linters.shellcheck")
			local shfmt = require("efmls-configs.formatters.shfmt")
			local prettier = require("efmls-configs.formatters.prettier")
			local stylua = require("efmls-configs.formatters.stylua")
			local alejandra = require("efmls-configs.formatters.alejandra")
			local rustfmt = require("efmls-configs.formatters.rustfmt")
			local gofmt = require("efmls-configs.formatters.gofmt")
			local terraformfmt = require("efmls-configs.formatters.terraform_fmt")
			-- local terramatefmt = require("efmls-configs.formatters.terramate_fmt")
			local yamllint = require("efmls-configs.linters.yamllint")

			local languages = {
				sh = { shellcheck, shfmt },
				lua = { stylua },
				-- python = { black },
				-- python = { ruff },
				nix = { alejandra },
				rust = { rustfmt },
				go = { gofmt },
				css = { prettier },
				json = { prettier },
				yaml = { yamllint, prettier },
				html = { prettier },
				htmldjango = { prettier },
				terraform = { terraformfmt },
				javascript = { prettier },
				-- hcl = { terramatefmt },
			}
			local config = {
				filetypes = vim.tbl_keys(languages),
				settings = {
					-- rootMarkers = { ".git/" },
					languages = languages,
				},
				init_options = {
					documentFormatting = true,
					documentRangeFormatting = true,
				},
			}
			require("lspconfig").efm.setup(vim.tbl_extend("force", config, {}))
		end,
	},
}
