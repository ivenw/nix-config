return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        config = function()
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
                -- bigfile = {},
                -- input = {
                --     icon = "",
                --     win = {
                --         style = {
                --             relative = "cursor",
                --             title_pos = "left",
                --             keys = {
                --                 i_esc = { "<esc>", { "cmp_close", "cancel" }, mode = "i", expr = true },
                --             },
                --         },
                --     },
                -- },
                -- picker = {
                --     layout = { layout = { backdrop = false } },
                --     win = {
                --         input = {
                --             keys = {
                --                 ["<Esc>"] = { "close", mode = { "n", "i" } },
                --             },
                --             b = { minicompletion_disable = true },
                --         },
                --     },
                -- },
                -- git = {},
                -- terminal = {},
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
        end,
    },
}
