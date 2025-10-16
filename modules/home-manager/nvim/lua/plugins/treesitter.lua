return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            branch = "master",
        },
        -- rebuild parsers when updating nvim-treesitter
        build = ":TSUpdate",
        lazy = false,
        config = function()
            ---@diagnostic disable-next-line: missing-fields
            require("nvim-treesitter.configs").setup({
                auto_install = true,
                highlight = { enable = true, additional_vim_regex_highlighting = false },
                indent = { enable = true },
                textobjects = {
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
                },
            })

            local file_types = { "python" }
            vim.api.nvim_create_autocmd("FileType", {
                pattern = file_types,
                callback = function(args)
                    vim.treesitter.start(args.buf)
                end,
            })
        end,
    },
    -- Automatically close html tags
    { "windwp/nvim-ts-autotag" },
    -- Set `commentstring` based on cursor position in file
    {
        "JoosepAlviste/nvim-ts-context-commentstring",
        config = function()
            require("ts_context_commentstring").setup({ enable_autocmd = false })
        end,
    },
}
