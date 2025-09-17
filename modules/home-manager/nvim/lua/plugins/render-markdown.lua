return {
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" },
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {
            heading = {
                width = "block",
            },
            dash = {
                width = 80,
            },
            link = {
                enabled = false,
            },
        },
    },
}
