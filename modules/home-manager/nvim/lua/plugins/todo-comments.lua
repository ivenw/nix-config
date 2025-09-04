return {
    {
        "folke/todo-comments.nvim",
        opts = {
            highlight = {
                keyword = "",
                after = "",
            },
        },
        keys = {
            { "<leader>tc", function() Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } }) end, desc = "Todos" },

        }
    },
}
