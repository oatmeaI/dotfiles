-- Helper functions + plugin abstractions, so that if I decided to change picker plugins (for exmaple)
-- I only need to make changes here.

local vim = vim
local pick = require("mini.pick")
local extra = require("mini.extra")
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

function PickLSP(opts)
    extra.pickers.lsp(opts)
end

function PickSymbols()
    PickLSP({ scope = "document_symbol" })
end

function PickReferences()
    PickLSP({ scope = "references" })
end

function PickDefinition()
    PickLSP({ scope = "definition" })
end

function LspDefinition()
    vim.lsp.buf.definition({
        on_list = function(options)
            if #options.items > 1 then
                PickDefinition()
            else
                -- TODO: this is dumb, but I couldn't figure out how to do the jump
                -- if there's only one option. I'm sure there's a way.
                vim.lsp.buf.definition()
            end
        end,
    })
end

function PickFiles(opts)
    pick.builtin.files(opts)
end

function PickBranches()
    extra.pickers.git_branches()
end

function PickRegisters()
    extra.pickers.registers()
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

function PickSession()
    require("persistence").select()
end

function OpenDirSession()
    require("persistence").load()
end

function ToggleTerminal()
    vim.cmd("ToggleTerm")
end
