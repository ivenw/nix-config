return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            bigfile = {},
            quickfile = {},
            input = {
                icon = "",
                win = {
                    style = {
                        relative = "cursor",
                        title_pos = "left",
                        keys = {
                            i_esc = { "<esc>", { "cmp_close", "cancel" }, mode = "i", expr = true },
                        },
                    },
                },
            },
            picker = {
                layout = { layout = { backdrop = false } },
                win = {
                    input = {
                        keys = {
                            ["<Esc>"] = { "close", mode = { "n", "i" } },
                        },
                        b = { minicompletion_disable = true },
                    },
                },
            },
            -- git = {},
            lazygit = { win = { style = { backdrop = false } } },
            statuscolumn = {},
            terminal = {},
            indent = {
                animate = { enabled = false },
            },
        },
        keys = {
            -- Picker
            {
                "<leader>f",
                function()
                    Snacks.picker.files()
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
