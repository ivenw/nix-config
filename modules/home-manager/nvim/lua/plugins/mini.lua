return {
    {
        "nvim-mini/mini.nvim",
        config = function()
            require("mini.basics").setup({})
            require("mini.extra").setup({})
            require("mini.comment").setup({
                options = {
                    custom_commentstring = function()
                        return require('ts_context_commentstring').calculate_commentstring() or vim.bo.commentstring
                    end,
  },
            })
            require("mini.surround").setup({})
            require("mini.icons").setup({})
            require("mini.snippets").setup({})
            require("mini.trailspace").setup({})
            require("mini.statusline").setup({})

            require("mini.completion").setup({})
            -- Disable mini.completion inside the picker input
            local f = function(args)
                vim.b[args.buf].minicompletion_disable = true
            end
            vim.api.nvim_create_autocmd("FileType", { pattern = "snacks_picker_input", callback = f })

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
            vim.keymap.set("n", "<leader>cb", function()
                MiniGit.show_at_cursor()
            end, { desc = "Show blame" })

            -- local indentscope = require("mini.indentscope")
            -- indentscope.setup({
            --     draw = { delay = 0, animation = indentscope.gen_animation.none() },
            -- })

            require("mini.files").setup({})
            vim.keymap.set("n", "<leader>tf", function()
                MiniFiles.open()
            end, { desc = "File browser" })
            vim.api.nvim_create_autocmd("User", {
                pattern = "MiniFilesActionRename",
                callback = function(event)
                    Snacks.rename.on_rename_file(event.data.from, event.data.to)
                end,
            })

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
                    -- Enhance this by adding descriptions for <Leader> mapping groups
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
