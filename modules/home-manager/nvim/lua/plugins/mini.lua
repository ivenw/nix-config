return {
    {
        "nvim-mini/mini.nvim",
        config = function()
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
            vim.keymap.set("n", "<leader>cb", MiniGit.show_at_cursor, { desc = "Show blame" })

            -- local indentscope = require("mini.indentscope")
            -- indentscope.setup({
            --     draw = {
            --         delay = 0,
            --         animation = indentscope.gen_animation.none(),
            --     },
            --     symbol = "│",
            --     options = { indent_at_cursor = false },
            -- })

            require("mini.pick").setup({})
            vim.keymap.set("n", "<leader>f", function()
                MiniPick.builtin.files({ tools = git })
            end, { desc = "Pick files" })
            vim.keymap.set("n", "<leader>tg", function()
                MiniPick.builtin.grep_live()
            end, { desc = "Live grep" })
            vim.keymap.set("n", "<leader>td", function()
                MiniExtra.pickers.lsp({ scope = "definition" })
            end, { desc = "Show definitions" })
            vim.keymap.set("n", "<leader>tr", function()
                MiniExtra.pickers.lsp({ scope = "references" })
            end, { desc = "Show references" })
            vim.keymap.set("n", "<leader>tb", function()
                MiniExtra.pickers.buf_lines({ scope = "current", preserve_order = true })
            end, { desc = "Search buffer" })
            vim.keymap.set("n", "<leader>ts", function()
                MiniExtra.pickers.lsp({ scope = "document_symbol" })
            end, { desc = "Search doument symbols" })

            require("mini.files").setup({})
            vim.keymap.set("n", "<leader>tf", function()
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
        end,
    },
}
