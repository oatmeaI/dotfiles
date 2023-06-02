local command_center = require("command_center")
local wk = require("which-key")
local vim = vim

local function map(mode, key, command, opts, hint)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, key, command, options)
	if hint ~= nil then
		command_center.add(
			{ { category = hint.category, desc = hint.desc, cmd = command, keys = { mode, key } } },
			command_center.mode.ADD
		)
		wk.register({
			[key] = { command, hint.desc },
		}, { mode = mode })
	end
end

-->> Tweaking J/K <<--
-- J/K navigation handles broken lines
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- Shift + J/K to scroll fast
map("n", "<down>", ":lua require('neoscroll').scroll(vim.wo.scroll, true, 150)<cr>")
map("n", "<up>", ":lua require('neoscroll').scroll(-vim.wo.scroll, true, 150)<cr>")
map("n", "<s-j>", ":lua require('neoscroll').scroll(vim.wo.scroll, true, 150)<cr>")
map("n", "<s-k>", ":lua require('neoscroll').scroll(-vim.wo.scroll, true, 150)<cr>")
-- Shift + J/K for visual mode too
map("v", "<down>", "10j")
map("v", "<up>", "10k")

-->> Space + ASDF <<--
map("n", "<space>a", ":Telescope neoclip<cr>", {}, {
	category = "Telescope",
	desc = "Clipboard history",
})

map("n", "<space>s", ":Telescope live_grep<cr>", {}, {
	category = "Telescope",
	desc = "Search in project",
})

map("n", "<space>d", ":AerialToggle<cr>", {}, {
	category = "Editor",
	desc = "Toggle symbols outline",
})

map("n", "<space>f", ":Telescope find_files<cr>", {}, {
	category = "Telescope",
	desc = "Find files",
})

map("n", "<space>g", ":Telescope buffers<cr>", {}, {
	category = "Telescope",
	desc = "List open buffers",
})

map("n", "<space>h", '<cmd>lua require("spectre").open()<cr>', {}, {
	category = "Editor",
	desc = "Find & replace in project",
})

map("n", "<space>j", ":lua require('utils/netrw-toggle').ToggleExplore()<cr>", {}, {
	category = "Application",
	desc = "Toggle file explorer",
})

map("n", "<space>k", ":w<cr>", {}, {
	category = "Editor",
	desc = "Write buffer",
})

map("n", "<space>l", ":FloatermToggle<cr>", {}, {
	category = "Application",
	desc = "Toggle floating terminal",
})

map("n", "<space>;", ":noh<cr>", {}, {
	category = "Application",
	desc = "Turn off search highlight",
})

-->> Space + QWERTY <<--
-- E is empty
map("n", "<space>q", ":lua MiniBufremove.wipeout()<cr>", {}, {
	category = "Editor",
	desc = "Close buffer",
})

map("n", "<space>w", "<c-w>q", {}, {
	category = "Window",
	desc = "Close window",
})

map("n", "<space>r", ":lua vim.lsp.buf.rename()<cr>", {}, {
	category = "LSP",
	desc = "Rename symbol",
})

map("n", "<space>t", ":lua require('utils/quickmarks').toggleMark()<cr>", {}, {
	category = "Marks",
	desc = "Add quickmark",
})

map("n", "<space>y", ":Telescope quickfix<cr>", {}, {
	category = "Marks",
	desc = "Show quickmarks popup",
})

map("n", "<space>u", ":lua vim.lsp.buf.hover({focusable = false})<cr>", {}, {
	category = "LSP",
	desc = "Show LSP info popover",
})

map("n", "<space>i", ":lua vim.diagnostic.open_float({focusable = false})<cr>", {}, {
	category = "LSP",
	desc = "Show LSP diagnostic popover",
})

map("n", "<space>o", ":TroubleToggle document_diagnostics<cr>", {}, {
	category = "LSP",
	desc = "Toggle document diagnostics window",
})

map("n", "<space>p", ":lua require('utils/helpers').toggleQf()<cr>", {}, {
	category = "Window",
	desc = "Toggle quickfix list",
})

map("n", "<space><space>", ":Telescope command_center<cr>", {}, {
	category = "Application",
	desc = "Open command center",
})

-->> Ctrl Maps <<--
-- Git Conflicts
map("n", "<c-g><c-o>", ":GitConflictChooseOurs<cr>", {}, {
	category = "Git",
	desc = "Conflicts: Choose ours",
})

map("n", "<c-g><c-t>", ":GitConflictChooseTheirs<cr>", {}, {
	category = "Git",
	desc = "Conflicts: Choose theirs",
})

map("n", "<c-g><c-b>", ":GitConflictChooseBoth<cr>", {}, {
	category = "Git",
	desc = "Conflicts: Choose both",
})

map("n", "<c-g><c-]>", ":GitConflictNextConflict<cr>", {}, {
	category = "Git",
	desc = "Conflicts: Next conflict",
})

map("n", "<c-g><c-[>", ":GitConflictPrevConflict<cr>", {}, {
	category = "Git",
	desc = "Conflicts: Previous conflict",
})

-- LSP Diagnostics
map("n", "<c-d><c-]>", ":lua vim.diagnostic.goto_next()<cr>", {}, {
	category = "LSP",
	desc = "Diagnostics: Next diagnostic",
})

map("n", "<c-d><c-[>", ":lua vim.diagnostic.goto_prev()<cr>", {}, {
	category = "LSP",
	desc = "Diagnostics: Previous diagnostic",
})

-- Misc ctrl maps
map("n", "<c-n>", ":lua require('tsht').move()<cr>", {}, {
	category = "Syntax Tree",
	desc = "Jump to node",
})

map("n", "<c-m>", ":lua require('tsht').nodes()<cr>", {}, {
	category = "Syntax Tree",
	desc = "Select node with hints",
})

map("n", "<c-p>", "<c-i>", {}, {
	category = "Jump",
	desc = "Jump forward",
})

map("n", "<c-b>", ":HopChar2<cr>", {}, {
	category = "Jump",
	desc = "Jump to two character pattern",
})

-->> Window navigation <<--
-- Alt + j
map("n", "∆", "<c-w>j", {}, {
	category = "Window",
	desc = "Focus south window",
})

-- Alt + h
map("n", "˙", "<c-w>h", {}, {
	category = "Window",
	desc = "Focus west window",
})

-- Alt + k
map("n", "˚", "<c-w>k", {}, {
	category = "Window",
	desc = "Focus north window",
})

-- Alt + l
map("n", "¬", "<c-w>l", {}, {
	category = "Window",
	desc = "Focus east window",
})

map("n", "<s-tab>", "<c-w>h", {}, {
	category = "Window",
	desc = "Focus west window",
})

map("n", "<tab>", "<c-w>l", {}, {
	category = "Window",
	desc = "Focus east window",
})

-->> Other Misc. Keymaps <<--
map("n", "<bs>w", "ciw", {}, {
	category = "Editor",
	desc = "Change word",
})

map("n", "<bs>e", 'ci"', {}, {
	category = "Editor",
	desc = "Change inner double quote",
})

map("n", "<bs>", "ci", {}, {
	category = "Editor",
	desc = "Change inner [blank]",
})

map("n", "gd", ":Telescope lsp_definitions<cr>", {}, {
	category = "LSP",
	desc = "Go to symbol definition",
})

map("n", "gr", ":Telescope lsp_references<cr>", {}, {
	category = "LSP",
	desc = "List symbol references",
})

map("n", "do", ":lua vim.lsp.buf.code_action()<cr>", {}, {
	category = "LSP",
	desc = "List code actions",
})

map("t", "<esc>", "<cmd>FloatermHide!<cr>", {}, {
	category = "Application",
	desc = "Hide floating terminal",
})

map("n", "<cr>", ":Pounce<cr>", {}, {
	category = "Jump",
	desc = "Jump to search string",
})

-- Open Command Center in visual mode (Alt-P)
map("v", "π", ":<c-u>Telescope command_center<cr>", {}, {
	category = "Application",
	desc = "Open command center while in visual mode",
})

-->> Setup tab functionality in autocomplete <<--
map("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true })
map("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })

-->> Syntax Tree Maps <<--
local opts = { noremap = true, silent = true }
map("v", "n", ":lua require('tree-climber').select_node()<cr>", opts, {
	category = "Syntax Tree",
	desc = "Select current node",
})

map("n", "vu", ":lua require('tree-climber').swap_prev({highlight = true})<cr>", opts, {
	category = "Syntax Tree",
	desc = "Swap current node up",
})

map("n", "vd", ":lua require('tree-climber').swap_next({highlight = true})<cr>", opts, {
	category = "Syntax Tree",
	desc = "Swap current node down",
})
