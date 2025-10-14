-- Helper functions + plugin abstractions, so that if I decided to change picker plugins (for exmaple)
-- I only need to make changes here.

local pick = require("mini.pick")
local extra = require("mini.extra")
local deps = require("mini.deps")

function AutoCmd(trigger, opts)
    vim.api.nvim_create_autocmd(trigger, opts)
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

function PickLSP(opts)
    extra.pickers.lsp(opts)
end

function PickSymbols()
    PickLSP({ scope = "document_symbol" })
end

function PickReferences()
    PickLSP({ scope = "references" })
end

function PickFiles(opts)
    pick.builtin.files(opts)
end

function PickGrep(opts)
    pick.builtin.grep_live(opts)
end

function PickResume(opts)
    pick.builtin.resume(opts)
end

function ToggleExplorer()
    local files = require("mini.files")
    if not files.close() then
        -- Open explorer in dir of current file
        files.open(vim.api.nvim_buf_get_name(0), false)
    end
end

function PickDiagnostic(opts)
    extra.pickers.diagnostic(opts)
end

function Jump()
    require("flash").jump()
end

function WriteSession()
    local name = vim.fn.getcwd():gsub("[\\/:]+", "-"):sub(2)
    require("mini.sessions").write(name)
end

function ToggleTerminal()
    Snacks.terminal.toggle(nil, {
        win = { position = "float" },
        keys = {
            term_normal = {
                "<esc>",
                function()
                    local in_terminal = vim.bo.buftype == "terminal"
                    if in_terminal then
                        vim.cmd("stopinsert")
                        vim.cmd("hide")
                    end
                end,
                mode = "t",
                expr = true,
                desc = "close term",
            },
        },
    })
end
