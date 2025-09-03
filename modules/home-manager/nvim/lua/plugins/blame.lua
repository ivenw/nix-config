return {
    {
        "FabijanZulj/blame.nvim",
        lazy = false,
        config = function()
            require("blame").setup()
        end,
        keys = {
            {
                "<leader>b",
                "<cmd>BlameToggle<CR>",
                desc = "Toggle blame"
            }
        }
    },
}
