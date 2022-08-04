local curl = require("plenary.curl")
local timer = vim.loop.new_timer()
local git_blame = require('gitblame')

local artist = ''
local title = ''

local function plex()
    timer:stop() 
    timer:start(
        250,
        0,
        vim.schedule_wrap(function()
            body = curl.get("http://10.0.0.40:32400/status/sessions?X-Plex-Token=z4GLsbc-gdqPusYW_h-v").body
            artist = body:match "grandparentTitle=\"([^\"]+)\""
            title = body:match "title=\"([^\"]+)\""
        end)
    )
    return artist .. ' - ' .. title
end

local function path()
    return vim.fn.expand('%')
end

local function blame()
    return git_blame.is_blame_text_available() and git_blame.get_current_blame_text() or ''
end

require('lualine').setup {
    options = {
        disabled_filetypes = {'alpha', '', 'minimap', 'aerial'},
        extensions = {"mundo"},
    },
    sections = {
         lualine_a = {'mode'},
         lualine_b = {path},
         lualine_c = {blame},
         lualine_x = {'filetype', 'location'},
         lualine_y = {},
         lualine_z = {'aerial'},
    },
}
