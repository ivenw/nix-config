vim.keymap.set("n", "x", '"_x') -- Don't yank when single deleting

-- Redraw screen with cursorline at center when scrolling
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- Unbind go to previous/next search result
vim.keymap.set("n", "N", "")
vim.keymap.set("n", "n", "")

-- Easy access to commands
vim.keymap.set("n", "<leader><leader>", ":", { desc = "Open command line" })
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Write file" })
vim.keymap.set("n", "<leader>q", ":bd<CR>", { desc = "Close buffer" })

vim.keymap.set("n", "<leader>cs", ':let @/ = ""<CR>', { desc = "Clear search" })

-- Split management
vim.keymap.set("n", "<leader>pn", ":vnew<CR>", { desc = "New pane" })
vim.keymap.set("n", "<leader>px", ":close<CR>", { desc = "Close pane" })

vim.keymap.set("n", "<C-h>", TmuxNavigator.left, { silent = false })
vim.keymap.set("n", "<C-j>", TmuxNavigator.down, { silent = true })
vim.keymap.set("n", "<C-k>", TmuxNavigator.up, { silent = true })
vim.keymap.set("n", "<C-l>", TmuxNavigator.right, { silent = true })

-- Rename
vim.keymap.set("n", "<leader>R", function()
    local current_word = vim.fn.expand("<cword>")
    vim.ui.input({ prompt = "Replace: ", default = current_word }, function(input)
        if input == nil then
            return
        end
        vim.cmd("%s/\\<" .. current_word .. "\\>/" .. input .. "/g")
    end)
end, { desc = "Find and replace symbol" })

vim.keymap.set("n", "<leader>i", vim.lsp.buf.hover, { desc = "Symbol info" })
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Diagnostics info" })
