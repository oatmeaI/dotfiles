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

function ToggleExplorer()
    local files = require("mini.files")
    if not files.close() then
        -- Open explorer in dir of current file
        files.open(vim.api.nvim_buf_get_name(0), false)
    end
end

function Jump()
    require("flash").jump()
end

function OpenDirSession()
    require("persistence").load()
end

function ToggleTerminal()
    vim.cmd("ToggleTerm")
end
