require("util")

local vim = vim
local del = vim.keymap.del
local diag = vim.diagnostic
local lsp = vim.lsp.buf
local tmap, imap_expr, nmap, vmap, lmap = U.tmap, U.imap_expr, U.nmap, U.vmap, U.lmap

-- Better tab + enter behavior with autocomplete - lifted from Mini
imap_expr("<CR>", function()
    -- If there is selected item in popup, accept it with <C-y>
    if vim.fn.complete_info()["selected"] ~= -1 then
        return "\25"
    end
    -- Fall back to plain `<CR>`.
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
tmap("<esc>",   HideTerminal,       "hide terminal")

nmap("qq",      ":qa!<cr>",         "quit")
nmap("<s-tab>", "<c-w>h",           "focus west window")
nmap("<tab>",   "<c-w>l",           "focus east window")
nmap("<c-p>",   "<c-i>",            "jump forward")
nmap("∆",       "<c-w>j",           "focus south window")   -- Alt-j
nmap("˙",       "<c-w>h",           "focus west window")    -- Alt-h
nmap("˚",       "<c-w>k",           "focus north window")   -- Alt-k
nmap("¬",       "<c-w>l",           "focus east window")    -- Alt-l
nmap("<cr>",    Jump,               "jump to location")

nmap("gr",      Pickers.References, "pick references")
nmap("gd",      LspDefinition,      "go to definition")

vmap("<down>",  "10j",              "skip down")
vmap("<up>",    "10k",              "skip up")

vmap("gy",      "\"*y",             "yank to system clipboard")
vmap("gp",      "\"*p",             "paste from system clipboard")

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
lmap("<space>", Pickers.Files,      "pick files")
lmap("/",       Pickers.Grep,       "grep in project")
lmap("e",       Pickers.Resume,     "resume previous picker")

lmap("fh",      Pickers.Help,       "pick help tags")
lmap("fr",      Pickers.Registers,  "pick register contents")
lmap("fb",      Pickers.Branches,   "pick git branches")

lmap(",c",      Pickers.Colors,     "pick colorscheme")

-- Sessions
lmap("sn",      CreateSession,      "create new session")
lmap("sl",      PickSession,        "pick session to load")

-- Windows
lmap("wd",      "<c-w>c",           "close current window")
lmap("ws",      "<cmd>sp<cr>",      "split window horizontally")
lmap("wv",      "<cmd>vs<cr>",      "split window vertically")
lmap("wz",      Zoom,               "toggle window zoom")

-- Tabs
lmap("td",      "<cmd>tabc<cr>",    "close current tab")
lmap("tn",      "<cmd>tabnew<cr>",  "open new tab")

-- Code
lmap("cx",      Pickers.Diagnostics,"pick buffer diagnostics")
lmap("cs",      Pickers.Symbols,    "pick buffer symbols")
lmap("cb",      Pickers.Blame,      "git blame")
lmap("ca",      lsp.code_action,    "pick code action")
lmap("cd",      diag.open_float,    "show line diagnostics")
lmap("ci",      lsp.hover,          "show LSP hover")
lmap("cr",      lsp.rename,         "rename")
