local vim = vim -- Just to get rid of the annoying warnings
local packup = require("helpers").packup
local map = require("helpers").map
local autocommand = require("helpers").autocommand

-- Packages
packup({
	{ name = "packer", repo = "wbthomason/packer.nvim" },
	{ name = "plenary", repo = "nvim-lua/plenary.nvim" },
	{ name = "kevin-promise", repo = "kevinhwang91/promise-async" },
	{ name = "ufo", repo = "kevinhwang91/nvim-ufo" },
	{ name = "treesitter", repo = "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
	{ name = "lsp", repo = "neovim/nvim-lspconfig" },
	{ name = "nullls", repo = "jose-elias-alvarez/null-ls.nvim" },
	{ name = "mason", repo = "williamboman/mason.nvim", run = "brew install luarocks" },
	{ name = "mason_nullls", repo = "jayp0521/mason-null-ls.nvim" },
	{ name = "mason_lspconfig", repo = "williamboman/mason-lspconfig.nvim" },
	{ name = "autolist", repo = "gaoDean/autolist.nvim" },
	{ name = "mini", repo = "echasnovski/mini.nvim" },
	{ name = "neoclip", repo = "AckslD/nvim-neoclip.lua" },
	{ name = "telescope", repo = "nvim-telescope/telescope.nvim" },
	{ name = "aerial", repo = "stevearc/aerial.nvim" },
	{ name = "stickybuf", repo = "stevearc/stickybuf.nvim" },
	{ name = "pounce", repo = "rlane/pounce.nvim" },
	{ name = "lualine", repo = "nvim-lualine/lualine.nvim" },
	{ name = "catppuccin", repo = "catppuccin/nvim", as = "catpuccin" },
	{ name = "dressing", repo = "stevearc/dressing.nvim" },
	{ name = "trouble", repo = "folke/trouble.nvim" },
	{ name = "floaterm", repo = "voldikss/vim-floaterm" },
	{ name = "neoscroll", repo = "karb94/neoscroll.nvim" },
	{ name = "clever-f", repo = "rhysd/clever-f.vim" },
	{ name = "gitblame", repo = "f-person/git-blame.nvim" },
	{ name = "exchange", repo = "tommcdo/vim-exchange" },
	{ name = "treesitter-textsubjects", repo = "RRethy/nvim-treesitter-textsubjects" },
	{ name = "fidget", repo = "j-hui/fidget.nvim" },
	{ name = "smartyank", repo = "ibhagwan/smartyank.nvim" },
	{ name = "boole", repo = "nat-418/boole.nvim" },
	{ name = "devicons", repo = "nvim-tree/nvim-web-devicons" },
	{ name = "silicon", repo = "narutoxy/silicon.lua", run = "brew install silicon" },
	{ name = "luasnip", repo = "L3MON4D3/LuaSnip" },
	{ name = "typescript", repo = "leafgarland/typescript-vim" },
})

-- Settings
vim.o.mouse = "a"
vim.o.undofile = true
vim.o.swapfile = false
vim.o.breakindent = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.updatetime = 250
vim.o.termguicolors = true
vim.o.cursorline = true
vim.o.laststatus = 3
vim.o.cursorline = true
vim.o.splitright = true
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.signcolumn = "yes"
vim.o.number = true

-- UFO - clean this shit up
require("ufo").setup({
	open_fold_hl_timeout = 0,
	provider_selector = function()
		return { "treesitter", "indent" }
	end,
})

vim.o.foldcolumn = "0"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 0
vim.o.foldenable = false

vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

-- UI Settings
vim.g.floaterm_shell = "zsh"
vim.g.floaterm_borderchars = "─│─│╭╮╯╰"
vim.g.floaterm_opener = "edit"
vim.g.gitblame_message_template = "<author>, <date>"
vim.g.gitblame_display_virtual_text = 0
vim.g.gitblame_date_format = "%r"
vim.g.catppuccin_flavour = "macchiato"
vim.g.netrw_banner = false
vim.g.netrw_hide = 0
vim.g.hardtime_default_on = false
-- Color settings
vim.cmd([[colorscheme catppuccin]])
vim.cmd([[hi! Folded guibg=NONE gui=nocombine]])
vim.cmd([[hi! link FloatBorder TelescopeBorder]])
vim.cmd([[hi! link NormalFloat TelescopeNormal]])
vim.cmd([[hi! link FloatermBorder TelescopeBorder]])
vim.cmd([[hi! link Floaterm TelescopeNormal]])
vim.cmd([[hi! link MiniCursorWord Search]])
vim.cmd([[hi! link VertSplit SignColumn]])
vim.cmd([[hi! MiniCursorwordCurrent gui=nocombine guifg=NONE guibg=NONE]])

-- Basic Keymaps
map("n", "gd", ":Telescope lsp_definitions<cr>")
map("n", "gr", ":Telescope lsp_references<cr>")
map("n", "do", ":lua vim.lsp.buf.code_action()<cr>")
map("t", "<esc>", "<cmd>FloatermHide!<cr>")
map("n", "<s-tab>", "<c-w>h")
map("n", "<tab>", "<c-w>l")
-- Alt + h/j/k/l maps for moving around windows
map("n", "∆", "<c-w>j")
map("n", "˙", "<c-w>h")
map("n", "˚", "<c-w>k")
map("n", "¬", "<c-w>l")
map("n", "<cr>", ":Pounce<cr>")
map("n", "<leader>g", ":PounceRepeat<cr>")
-- Space + home row maps
map("n", "<space>a", ":Telescope neoclip<cr>")
map("n", "<space>s", ":Telescope live_grep<cr>")
map("n", "<space>d", ":AerialToggle<cr>")
map("n", "<space>f", ":Telescope find_files<cr>")
map("n", "<space>g", ":lua require('cheatsheet').ViewCheatsheet()<cr>")
map("n", "<space>j", ":lua require('netrw-toggle').ToggleExplore()<cr>")
map("n", "<space>h", ":lua require('netrw-toggle').ToggleFileTree()<cr>")
map("n", "<space>k", ":w<cr>")
map("n", "<space>l", ":FloatermToggle<cr>")
map("n", "<space>;", ":noh<cr>")
-- Other space maps
map("n", "<space>q", ":lua MiniBufremove.wipeout()<cr>")
map("n", "<space>w", "<c-w>q")
map("n", "<space>e", 'viw"0p')
map("n", "<space>r", ":lua vim.lsp.buf.rename()<cr>")
map("n", "<space>ts", ":so $MYVIMRC<cr>")
map("n", "<space>tl", ":LspRestart<cr>")
map("v", "<space>y", '"*y')
map("n", "<space>u", ":lua vim.lsp.buf.hover({focusable = false})<cr>")
map("n", "<space>i", ":lua vim.diagnostic.open_float({focusable = false})<cr>")
map("n", "<space>o", ":TroubleToggle document_diagnostics<cr>")
map("n", "<space>p", "o<esc>p")
map("n", "<space><space>", ":Telescope buffers<cr>")
-- Leader maps
map("n", "<leader>f", '<cmd>lua require("spectre").open()<cr>')
map("n", "<leader>q", ":Cheatsheet<cr>")

-- Autocomplete maps
map("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true })
map("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })
-- TODO understand and clean this
local keys = {
	["cr"] = vim.api.nvim_replace_termcodes("<CR>", true, true, true),
	["ctrl-y"] = vim.api.nvim_replace_termcodes("<C-y>", true, true, true),
	["ctrl-y_cr"] = vim.api.nvim_replace_termcodes("<C-y><CR>", true, true, true),
}
local luasnip = require("luasnip")
local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end
require("luasnip.loaders.from_vscode").lazy_load() -- Why isn't this showing up in autocomplete list??
require("luasnip.loaders.from_vscode").load({ paths = { "~/.config/snippets" } })
_G.cr_action = function()
	if luasnip.expand_or_jumpable() then
		return t("<Plug>luasnip-expand-or-jump")
	elseif vim.fn.pumvisible() > 0 then
		-- If popup is visible, confirm selected item or add new line otherwise
		local item_selected = vim.fn.complete_info()["selected"] ~= -1
		return item_selected and keys["ctrl-y"] or keys["ctrl-y_cr"]
	else
		-- If popup is not visible, use plain `<CR>`. You might want to customize
		-- according to other plugins. For example, to use 'mini.pairs', replace
		-- next line with `return require('mini.pairs').cr()`
		return keys["cr"]
	end
end
vim.api.nvim_set_keymap("i", "<CR>", "v:lua._G.cr_action()", { noremap = true, expr = true })

-- Custom commands
vim.cmd([[command! Ls :lua MiniSessions.select()]])
vim.cmd([[command! Silicon :lua require('silicon').visualise_cmdline({})]])
vim.cmd([[command! Ms :lua MiniSessions.write(require('helpers').getSessionName(), {force = true})]])

-- Autocommands
autocommand("BufWritePre", { command = "lua if vim.lsp.buf.server_ready() then vim.lsp.buf.format() end" })
autocommand("BufWritePre", { command = "lua MiniTrailspace.trim()" })
autocommand("BufWritePre", { command = ":EslintFixAll", pattern = "*.tsx,*.ts,*.jsx,*.js" })
autocommand("BufWritePre", { command = "lua MiniTrailspace.trim_last_lines()" })
autocommand("FocusLost", { command = "wall" })
autocommand("VimLeave", { command = "lua MiniSessions.write(nil, {force = true})" })
autocommand("VimEnter", { command = "lua require('helpers').loadSession()" })
