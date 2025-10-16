return {
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" },
        enabled = false,
        config = function()
            require("render-markdown").setup({
                heading = {
                    width = "block",
                },
                dash = {
                    width = 80,
                },
                link = {
                    enabled = true,
                },
            })
        end,
    },
}
