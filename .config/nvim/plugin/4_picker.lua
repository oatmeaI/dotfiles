-- Abstraction layer on top of picker plugin to make it easier to switch if need be
local p = FzfLua

-- stylua: ignore start
Pickers = {
    Symbols         = p.lsp_document_symbols,
    References      = p.lsp_references,
    Definition      = p.lsp_definitions,
    Files           = p.files,
    Branches        = p.git_branches,
    Registers       = p.registers,
    Grep            = p.live_grep,
    Resume          = p.resume,
    Diagnostics     = p.diagnostics_document,
    Help            = p.helptags,
    Colors          = p.colorschemes,
    Blame           = p.git_blame,
}
