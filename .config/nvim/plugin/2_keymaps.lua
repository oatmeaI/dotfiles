local vim = vim
local map = vim.keymap.set
local del = vim.keymap.del
local diag = vim.diagnostic
local lsp = vim.lsp.buf

local nmap = function(trigger, effect, description, options)
    local options = options or {}
    options.desc = description
    vim.keymap.set("n", trigger, effect, options)
end

-- Map in normal mode with leader key
local lmap = function(trigger, effect, description)
    vim.keymap.set("n", "<leader>" .. trigger, effect, { desc = description })
end

local imap_expr = function(lhs, rhs)
    vim.keymap.set("i", lhs, rhs, { expr = true })
end

-- Better tab + enter behavior with autocomplete - lifted from Mini
imap_expr("<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
imap_expr("<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])
imap_expr("<CR>", function()
    -- If there is selected item in popup, accept it with <C-y>
    if vim.fn.complete_info()["selected"] ~= -1 then
        return "\25"
    end
    -- Fall back to plain `<CR>`. You might want to customize according
    -- to other plugins. For example if 'mini.pairs' is set up, replace
    -- next line with `return MiniPairs.cr()`
    return "\r"
end)

-- stylua: ignore start
-- Delete some builtin LSP mappings; we'll remap them later
del("n", "gra")
del("n", "gri")
del("n", "grn")
del("n", "grr")
del("n", "grt")

--> Basic Nav Etc <-- 
map({ "n", "v" },   "<down>",   "10j",          { desc = "Skip down" })
map({ "n", "v" },   "<up>",     "10k",          { desc = "Skip up" })
map("t",            "<esc>",    HideTerminal,   { desc = "Hide Terminal" })

nmap("qq",      ":qa!<cr>",         "Quit")
nmap("<s-tab>", "<c-w>h",           "Focus west window")
nmap("<tab>",   "<c-w>l",           "Focus east window")
nmap("<c-p>",   "<c-i>",            "Jump forward")
nmap("∆",       "<c-w>j",           "Focus south window")   -- Alt-j
nmap("˙",       "<c-w>h",           "Focus west window")    -- Alt-h
nmap("˚",       "<c-w>k",           "Focus north window")   -- Alt-k
nmap("¬",       "<c-w>l",           "Focus east window")    -- Alt-l
nmap("<cr>",    Jump,               "Jump to location")

nmap("gr",      PickReferences,     "Pick references")
nmap("gd",      LspDefinition,      "Go to definition")

nmap("<c-j>",   Walk("Down"),       "Treewalker down",  { silent = true })
nmap("<c-k>",   Walk("Up"),         "Treewalker up",    { silent = true })
nmap("<c-h>",   Walk("Left"),       "Treewalker left",  { silent = true })
nmap("<c-l>",   Walk("Right"),      "Treewalker right", { silent = true })

--> Leader Maps <--
-- Basics
lmap("k",       ":w<cr>",           "Write buffer")
lmap("K",       ":noa w<cr>",       "Write buffer without running autocommands")
lmap("j",       ToggleExplorer,     "Toggle file explorer")
lmap("l",       ToggleTerminal,     "Toggle floating terminal")

-- Searching
lmap("<space>", PickFiles,          "Pick files")
lmap("/",       PickGrep,           "Grep in project")
lmap("e",       PickResume,         "Resume previous picker")

-- Sessions
lmap("so",      OpenDirSession,     "Load session for current dir")
lmap("sl",      PickSession,        "Pick session to load")

-- Windows
lmap("wd",      "<c-w>c",           "Close current window")
lmap("ws",      "<cmd>sp<cr>",      "Split window horizontally")
lmap("wv",      "<cmd>vs<cr>",      "Split window vertically")

-- Tabs
lmap("td",      "<cmd>tabc<cr>",    "Close current tab")
lmap("tn",      "<cmd>tabnew<cr>",  "Open new tab")

-- Registers
lmap("rs",      PickRegisters,      "Pick register contents")

-- Git
lmap("gb",      PickBranches,       "Pick git branches")

-- Code
lmap("cx",      PickDiagnostic,     "Pick buffer diagnostics")
lmap("cs",      PickSymbols,        "Pick buffer symbols")
lmap("ca",      lsp.code_action,    "Pick code action")
lmap("cd",      diag.open_float,    "Show line diagnostics")
lmap("ci",      lsp.hover,          "Show LSP hover")
