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
map({ "n", "v" },   "<down>",       "10j",              { desc = "skip down" })
map({ "n", "v" },   "<up>",         "10k",              { desc = "skip up" })
map("t",            "<esc>",        HideTerminal,       { desc = "hide Terminal" })

nmap("qq",      ":qa!<cr>",         "quit")
nmap("<s-tab>", "<c-w>h",           "focus west window")
nmap("<tab>",   "<c-w>l",           "focus east window")
nmap("<c-p>",   "<c-i>",            "jump forward")
nmap("∆",       "<c-w>j",           "focus south window")   -- Alt-j
nmap("˙",       "<c-w>h",           "focus west window")    -- Alt-h
nmap("˚",       "<c-w>k",           "focus north window")   -- Alt-k
nmap("¬",       "<c-w>l",           "focus east window")    -- Alt-l
nmap("<cr>",    Jump,               "jump to location")

nmap("gr",      PickReferences,     "pick references")
nmap("gd",      LspDefinition,      "go to definition")

nmap("gy",      "+y",               "yank to system clipboard")
nmap("gp",      "+p",               "paste from system clipboard")

nmap("<c-j>",   Walk("Down"),       "treewalker down",  { silent = true })
nmap("<c-k>",   Walk("Up"),         "treewalker up",    { silent = true })
nmap("<c-h>",   Walk("Left"),       "treewalker left",  { silent = true })
nmap("<c-l>",   Walk("Right"),      "treewalker right", { silent = true })

--> Leader Maps <--
-- Basics
lmap("k",       ":w<cr>",           "write buffer")
lmap("K",       ":noa w<cr>",       "write buffer without running autocommands")
lmap("j",       ToggleExplorer,     "toggle file explorer")
lmap("l",       ToggleTerminal,     "toggle floating terminal")

-- Searching
lmap("<space>", PickFiles,          "pick files")
lmap("/",       PickGrep,           "grep in project")
lmap("e",       PickResume,         "resume previous picker")

lmap("fh",      PickHelp,           "pick help tags")
lmap("fr",      PickRegisters,      "pick register contents")
lmap("fb",      PickBranches,       "pick git branches")

-- Sessions
lmap("so",      OpenDirSession,     "load session for current dir")
lmap("sl",      PickSession,        "pick session to load")

-- Windows
lmap("wd",      "<c-w>c",           "close current window")
lmap("ws",      "<cmd>sp<cr>",      "split window horizontally")
lmap("wv",      "<cmd>vs<cr>",      "split window vertically")

-- Tabs
lmap("td",      "<cmd>tabc<cr>",    "close current tab")
lmap("tn",      "<cmd>tabnew<cr>",  "open new tab")

-- Code
lmap("cx",      PickDiagnostic,     "pick buffer diagnostics")
lmap("cs",      PickSymbols,        "pick buffer symbols")
lmap("ca",      lsp.code_action,    "pick code action")
lmap("cd",      diag.open_float,    "show line diagnostics")
lmap("ci",      lsp.hover,          "show LSP hover")
lmap("cr",      lsp.rename,         "rename")
