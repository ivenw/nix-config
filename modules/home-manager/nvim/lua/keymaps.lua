local map = vim.keymap.set

map("n", "x", '"_x') -- Don't yank when single deleting

-- Redraw screen with cursorline at center when scrolling
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")

-- Unbind go to previous/next search result
map("n", "N", "")
map("n", "n", "")

-- Easy access to commands
map("n", "<leader><leader>", ":", { desc = "Open command line" })
map("n", "<leader>w", ":w<CR>", { desc = "Write file" })
map("n", "<leader>q", ":bd<CR>", { desc = "Close buffer" })

map("n", "<leader>cs", ':let @/ = ""<CR>', { desc = "Clear search" })


-- Split management
map("n", "<leader>pn", ":vnew<CR>", { desc = "New pane" })
map("n", "<leader>px", ":close<CR>", { desc = "Close pane" })

-- Rename
map("n", "<leader>R", function()
    local current_word = vim.fn.expand("<cword>")
    vim.ui.input({ prompt = "Replace: ", default = current_word }, function(input)
        if input == nil then
            return
        end
        vim.cmd("%s/\\<" .. current_word .. "\\>/" .. input .. "/g")
    end)
end, { desc = "Find and replace symbol" })

map("n", "<leader>i", vim.lsp.buf.hover, { desc = "Symbol info" })
map("n", "<leader>r", vim.lsp.buf.rename, { desc = "Rename symbol" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Diagnostics info" })
