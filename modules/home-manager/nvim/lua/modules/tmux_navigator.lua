local M = {}

-- Switch nvim panes, fallback to tmux panes if at edge
local function smart_move(direction)
    local tmux_cmd
    if direction == "k" then
        tmux_cmd = "-U"
    elseif direction == "j" then
        tmux_cmd = "-D"
    elseif direction == "h" then
        tmux_cmd = "-L"
    elseif direction == "l" then
        tmux_cmd = "-R"
    else
        error("Invalid direction")
    end

    local window_before = vim.api.nvim_get_current_win()
    vim.cmd.wincmd(direction)
    local window_after = vim.api.nvim_get_current_win()

    -- If we didn't move to a different window, try tmux
    if window_before == window_after then
        vim.fn.system("tmux select-pane " .. tmux_cmd)
    end
end

function M.left()
    smart_move("h")
end

function M.right()
    smart_move("l")
end

function M.up()
    smart_move("k")
end

function M.down()
    smart_move("j")
end

_G.TmuxNavigator = M

return M
