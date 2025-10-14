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

-- Delete some builtin LSP mappings; we'll remap them later
del("n", "gra")
del("n", "gri")
del("n", "grn")
del("n", "grr")
del("n", "grt")

-- stylua: ignore start

--> Basic Nav Etc <-- 
map({ "n", "v" }, "<down>", "10j",          { desc = "Skip down" })
map({ "n", "v" }, "<up>",   "10k",          { desc = "Skip up" })
map({ "n", "t" }, "<esc>",  HideTerminal,   { desc = "Hide Terminal" })

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
nmap("gd",      lsp.definition,     "Go to definition")

nmap("<c-j>",   "<cmd>Treewalker Down<cr>", "Treewalker down",  { silent = true })
nmap("<c-k>",   "<cmd>Treewalker Up<cr>",   "Treewalker up",    { silent = true })
nmap("<c-h>",   "<cmd>Treewalker Left<cr>", "Treewalker left",  { silent = true })
nmap("<c-l>",   "<cmd>Treewalker Right<cr>","Treewalker right", { silent = true })

--> Leader Maps <--
lmap("k",       ":w<cr>",           "Write buffer")
lmap("j",       ToggleExplorer,     "Toggle file explorer")
lmap("l",       ToggleTerminal,     "Toggle floating terminal")

lmap("<space>", PickFiles,          "Pick files")
lmap("s",       PickSymbols,        "Pick document symbols")
lmap("x",       PickDiagnostic,     "Pick buffer diagnostics")
lmap("/",       PickGrep,           "Grep in project")
lmap("e",       PickResume,         "Resume previous picker")

lmap("wd",      "<c-w>c",           "Close current window")
lmap("td",      "<cmd>tabc<cr>",    "Close current tab")

lmap("cd",      diag.open_float,    "Line Diagnostics")
lmap("ca",      lsp.code_action,    "Code Action")
lmap("ci",      lsp.hover,          "Show LSP hover")
