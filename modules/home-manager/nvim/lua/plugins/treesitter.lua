return {

    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            branch = "main",
        },
        -- rebuild parsers when updating nvim-treesitter
        build = ":TSUpdate",
        lazy = false,
        config = function()
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
