function Entry()
    local pos = vim.api.nvim_win_get_cursor(0)
    return {
        filename = vim.fn.expand("%"),
        lnum = pos[1],
        col = pos[2],
    }
end

function AddEntry()
    vim.fn.setqflist({ Entry() }, "a")
end

function ClearQF()
    vim.fn.setqflist({}, "r")
end

function ToggleQF()
    local winid = vim.fn.getqflist({ winid = true }).winid
    if winid and winid ~= 0 then
        vim.cmd("cclose")
    else
        vim.cmd("copen")
    end
end

function RemoveEntry()
    local lines = vim.fn.getqflist()
    table.remove(lines, vim.fn.line("."))
    vim.fn.setqflist(lines, "r")
end
