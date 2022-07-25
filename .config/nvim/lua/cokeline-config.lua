local get_hex = require("cokeline/utils").get_hex
local tabFg = get_hex('Normal', 'fg')

local function tabBg(buffer)
    return buffer.is_focused and get_hex('Pmenu', 'bg') or get_hex('CursorColumn', 'bg')
end

local components = {
    filename = {
        text = function(buffer)
            return buffer.unique_prefix .. buffer.filename
        end,
        style = function(buffer)
            return
                (buffer.is_focused and 'bold')
                or nil
        end,
        bg = function(buffer) 
            return tabBg(buffer)
        end
    },
    close_or_unsaved = {
        text = function(buffer)
            return buffer.is_modified and '●' or ''
        end,
        fg = function(buffer)
            return buffer.is_modified and green or nil
        end,
        delete_buffer_on_left_click = true,
        truncation = { priority = 1 },
        bg = function(buffer) 
            return tabBg(buffer)
        end
    },
    spacer = {
        text = ' ',
        bg = tabFg,
        fg = function(buffer)
            return tabBg(buffer)
        end
    },
    curve_start = {
        text = function (buffer) 
            return ''
        end,
        bg = get_hex('Normal', 'bg'),
        fg =  function(buffer) 
            return tabBg(buffer)
        end,
        truncation = { priority = 1 },
    },
    devicon = {
        text = function(buffer)
            return buffer.devicon.icon
        end,
        fg = function(buffer)
            return buffer.devicon.color
        end,
        bg = function(buffer) 
            return tabBg(buffer)
        end
    },
    spacer1 = {
        text = function (buffer) 
            return buffer.index == 1 and ' ' or ' '
        end,
        fg = tabFg,
        bg = get_hex('Normal', 'bg')
    },
    spacer2 = {
        text = ' ',
        fg = tabFg,
        bg = function(buffer) 
            return tabBg(buffer)
        end
    },
    curve_end = {
        text = '',
        bg = get_hex('Normal', 'bg'),
        fg = function(buffer)
            return tabBg(buffer)
        end,
        truncation = { priority = 1 },
    },
}

require('cokeline').setup({
    sidebar = {
        filetype = 'NvimTree',
        components = {
            {
                text = '  Explorer',
                bg = get_hex('Normal', 'bg'),
                fg = get_hex('Normal', 'fg'),
                style = 'bold',
            },
        }
    },
    default_hl = {
        bg = get_hex('Normal', 'bg'),
        fg = get_hex('Normal', 'fg'),
    },
    components = {
        components.spacer1,
        components.curve_start,
        components.spacer2,
        components.devicon,
        components.spacer2,
        components.filename,
        components.spacer2,
        components.close_or_unsaved,
        components.spacer2,
        components.curve_end,
    },
})
