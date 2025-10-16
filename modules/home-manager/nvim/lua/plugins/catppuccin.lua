return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "macchiato",
                styles = {
                    loops = { "italic" },
                    keywords = { "italic" },
                },
            })
            vim.cmd.colorscheme("catppuccin")
        end,
    },
}
