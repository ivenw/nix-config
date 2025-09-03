return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.config("pyright", { disableOrganizeImports = true })
			vim.lsp.config("ruff", {
				init_options = {
					settings = {
						organizeImports = true,
						fixAll = true,
					},
					format = {
						enable = true,
					},
					lint = {
						enable = true,
					}
				},
			})
			vim.lsp.enable({
				"lua_ls",
				"sourcekit",
				"rust_analyzer",
				"ts_ls",
				"nil_ls",
				"ruff",
				"pyright",
				"zls",
				"gopls",
				"tailwindcss",
				"efm",
			})

			---------------------
			-- Format on write --
			---------------------
			-- Create an augroup that is used for managing our formatting autocmds.
			--  We need one augroup per client to make sure that multiple clients
			--  can attach to the same buffer without interfering with each other.
			local _augroups = {}
			local get_augroup = function(client)
				if not _augroups[client.id] then
					local group_name = "lsp-attach-format-on-write-" .. client.name
					local id = vim.api.nvim_create_augroup(group_name, { clear = true })
					_augroups[client.id] = id
				end

				return _augroups[client.id]
			end
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach-format-on-write", { clear = true }),
				callback = function(args)
					local client_id = args.data.client_id
					local client = vim.lsp.get_client_by_id(client_id)
					local bufnr = args.buf

					if not client.server_capabilities.documentFormattingProvider then
						return
					end

					vim.api.nvim_create_autocmd("BufWritePre", {
						group = get_augroup(client),
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								async = false,
								filter = function(c)
									return c.id == client.id
								end,
							})
						end,
					})
				end,
			})
		end,
	},

	-- Formatting
	{
		"creativenull/efmls-configs-nvim",
		-- "ivenw/efmls-configs-nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			local shellcheck = require("efmls-configs.linters.shellcheck")
			local shfmt = require("efmls-configs.formatters.shfmt")
			local eslint = require("efmls-configs.linters.eslint")
			local prettier = require("efmls-configs.formatters.prettier")
			local stylua = require("efmls-configs.formatters.stylua")
			local alejandra = require("efmls-configs.formatters.alejandra")
			local rustfmt = require("efmls-configs.formatters.rustfmt")
			local gofmt = require("efmls-configs.formatters.gofmt")
			local terraformfmt = require("efmls-configs.formatters.terraform_fmt")
			-- local terramatefmt = require("efmls-configs.formatters.terramate_fmt")
			local sql_formatter = require("efmls-configs.formatters.sql-formatter")
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
				yaml = { prettier },
				html = { prettier },
				htmldjango = { prettier },
				terraform = { terraformfmt },
				javascript = { eslint, prettier },
				sql = { sql_formatter },
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
			require("lspconfig").efm.setup(vim.tbl_extend("force", config, { offset_encoding = "utf-16" }))
		end,
	},
}
