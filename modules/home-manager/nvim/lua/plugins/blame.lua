return {
    {
        "FabijanZulj/blame.nvim",
        lazy = false,
        config = function()
            require("blame").setup({})

            vim.keymap.set("n", "<leader>cb", ":BlameToggle virtual<CR>")
        end,
    },
}
