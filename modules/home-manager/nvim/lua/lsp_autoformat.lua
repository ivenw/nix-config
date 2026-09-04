-- Format on write
-- Create an augroup that is used for managing our formatting autocmds.
-- We need one augroup per client to make sure that multiple clients
-- can attach to the same buffer without interfering with each other.
local _augroups = {}
local get_augroup = function(client)
    if not _augroups[client.id] then
        local group_name = "lsp-attach-format-on-write-" .. client.name
        local id = vim.api.nvim_create_augroup(group_name, { clear = true })
        _augroups[client.id] = id
    end

    return _augroups[client.id]
end

-- On LSP attach create a new formatting autocmd
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp-attach-format-on-write", { clear = true }),
    callback = function(args)
        local client_id = args.data.client_id
        local client = vim.lsp.get_client_by_id(client_id)

        -- Nothing to do if the LS doesn't support formatting...
        if not client.server_capabilities.documentFormattingProvider then
            return
        end

        vim.api.nvim_create_autocmd("BufWritePre", {
            group = get_augroup(client),
            buffer = args.buf,
            callback = function()
                -- Preserve cursor position after format
                local cursor_pos_before = vim.api.nvim_win_get_cursor(0)
                vim.lsp.buf.format({
                    async = false,
                    filter = function(c)
                        return c.id == client.id
                    end,
                })

                -- Ensure cursor position is within buffer bounds
                local line_count = vim.api.nvim_buf_line_count(0)
                local target_line = math.min(cursor_pos_before[1], line_count)
                local line_content = vim.api.nvim_buf_get_lines(0, target_line - 1, target_line, false)[1]
                    or ""
                local target_col = math.min(cursor_pos_before[2], #line_content)
                local cursos_pos_after = { target_line, target_col }

                vim.api.nvim_win_set_cursor(0, cursos_pos_after)
            end,
        })
    end,
})
