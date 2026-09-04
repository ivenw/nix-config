local km = vim.keymap.set

km("n", "x", '"_x') -- Don't yank when single deleting

-- Redraw screen with cursorline at center when scrolling
km("n", "<C-u>", "<C-u>zz")
km("n", "<C-d>", "<C-d>zz")

-- Unbind go to previous/next search result
km("n", "N", "")
km("n", "n", "")

-- Easy access to commands
km("n", "<leader><leader>", ":", { desc = "Open command line" })
km("n", "<leader>w", ":w<CR>", { desc = "Write file" })
km("n", "<leader>q", ":bd<CR>", { desc = "Close buffer" })

km("n", "<leader>cs", ':let @/ = ""<CR>', { desc = "Clear search" })

-- Split management
km("n", "<leader>pn", ":vnew<CR>", { desc = "New pane" })
km("n", "<leader>px", ":close<CR>", { desc = "Close pane" })

km("n", "<C-h>", TmuxNavigator.left, { silent = false })
km("n", "<C-j>", TmuxNavigator.down, { silent = true })
km("n", "<C-k>", TmuxNavigator.up, { silent = true })
km("n", "<C-l>", TmuxNavigator.right, { silent = true })

-- Rename
km("n", "<leader>R", function()
    local current_word = vim.fn.expand("<cword>")
    vim.ui.input({ prompt = "Replace: ", default = current_word }, function(input)
        if input == nil then
            return
        end
        vim.cmd("%s/\\<" .. current_word .. "\\>/" .. input .. "/g")
    end)
end, { desc = "Find and replace symbol" })

km("n", "<leader>i", vim.lsp.buf.hover, { desc = "Symbol info" })
km("n", "<leader>r", vim.lsp.buf.rename, { desc = "Rename symbol" })
km("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
km("n", "<leader>e", vim.diagnostic.open_float, { desc = "Diagnostics info" })
