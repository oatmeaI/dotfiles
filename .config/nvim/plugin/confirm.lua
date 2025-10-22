-- Huge chunk of this is stolen from Mini.Notify - learning how to open windows etc.
-- TODO: can't select a choice
-- TODO: msg type doesn't do anything
-- TODO: size window correctly
Pack({ source = "MunifTanjim/nui.nvim" })

local Popup = require("nui.popup")
local H = {}

-- ns = vim.api.nvim_create_namespace("my_fancy_pum")
-- vim.ui_attach(ns, { ext_messages = true }, function(event, ...)
--     vim.inspect(event, ...)
-- end)

function Confirm(msg, choices, default, type)
    local popup = Popup({
        enter = true,
        focusable = true,
        border = {
            style = "rounded",
        },
        relative = "editor",
        zindex = 210,
        position = {
            row = 3,
            col = "50%",
        },
        size = {
            width = 80,
            height = 40,
        },
    })
    popup:mount()
    local buf_id = popup.bufnr
    H.buffer_update(buf_id, msg, choices, default, type)
    vim.cmd("redraw")
    local response = vim.fn.getcharstr(-1)
    local options = {}
    -- TODO: map response to choice. also make it only accept viable characters
    print(response)
    return response
end

H.buffer_update = function(buf_id, msg, choices, default, type)
    local lines, highlights = {}, {}

    local notif_lines = vim.split(msg, "\n")
    for _, l in ipairs(notif_lines) do
        table.insert(lines, l)
    end
    local choice_lines = vim.split(choices, "\n")
    for _, l in ipairs(choice_lines) do
        table.insert(lines, l)
    end

    vim.api.nvim_buf_set_lines(buf_id, 0, -1, true, lines)
end
