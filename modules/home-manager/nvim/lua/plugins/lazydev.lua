return {
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        config = function()
            ---@diagnostic disable-next-line: missing-fields
            require("lazydev").setup({ integrations = { cmp = false } })
        end,
    },
}
