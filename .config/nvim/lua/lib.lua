-- Helper functions + plugin abstractions, so that if I decided to change plugins
-- I only need to make changes here.

local vim = vim
local deps = require("mini.deps")

function AutoCmd(trigger, opts)
    vim.api.nvim_create_autocmd(trigger, opts)
end

function Walk(dir)
    return function()
        vim.cmd("Treewalker " .. dir)
    end
end

function Zoom()
    MiniMisc.zoom()
end

function Pack(opts)
    if type(opts) == "string" then
        deps.add(opts)
        return
    end

    local name = opts.name or vim.fn.fnamemodify(opts.source, ":t:r")
    opts.name = name

    deps.add(opts)

    if opts.setup == true then
        require(name).setup(opts.config)
    end

    if opts.callback then
        opts.callback()
    end
end

function HideTerminal()
    local in_terminal = vim.bo.buftype == "terminal"
    if in_terminal then
        vim.cmd("stopinsert")
        vim.cmd("hide")
    end
end

function LspDefinition()
    vim.lsp.buf.definition({
        on_list = function(options)
            if #options.items > 1 then
                Pickers.Definition()
            else
                -- TODO: this is dumb, but I couldn't figure out how to do the jump
                -- if there's only one option. I'm sure there's a way.
                vim.lsp.buf.definition()
            end
        end,
    })
end

function string.starts(String, Start)
    return string.sub(String, 1, string.len(Start)) == Start
end

function ToggleExplorer()
    local files = require("mini.files")
    if not files.close() then
        -- Open explorer in dir of current file
        local path = vim.api.nvim_buf_get_name(0)
        if string.starts(path, "/") then
            files.open(vim.api.nvim_buf_get_name(0), false)
        else
            files.open()
        end
    end
end

function Jump()
    require("flash").jump()
end

function CreateSession()
    require("nvim-possession").new()
end

function PickSession()
    require("nvim-possession").list()
end

function SaveSession()
    -- TODO: kinda annoying to pass these config values here, probably a better way
    vim.cmd.mksession({ args = { vim.fn.stdpath("data") .. "/sessions/" .. vim.g.sessions }, bang = true })
    -- require("nvim-possession.utils").autosave({
    --     sessions = { sessions_variable = "session", sessions_path = vim.fn.stdpath("data") .. "/sessions/" },
    -- })
end

function ListSessions()
    -- TODO: config values live somewhere else
    local sessions_path = vim.fn.stdpath("data") .. "/sessions/"

    local sessions = {}

    for name, type in vim.fs.dir(sessions_path) do
        if type == "file" then
            local path = sessions_path .. name
            local stat = vim.uv.fs_stat(path)
            if stat then
                table.insert(sessions, { name = name, mtime = stat.mtime, path = path })
            end
        end
    end

    table.sort(sessions, function(a, b)
        if a.mtime.sec ~= b.mtime.sec then
            return a.mtime.sec > b.mtime.sec
        end
        if a.mtime.nsec ~= b.mtime.nsec then
            return a.mtime.nsec > b.mtime.nsec
        end
        return a.name < b.name
    end)

    return sessions
end

function ToggleTerminal()
    vim.cmd("ToggleTerm")
end
