local vim = vim -- Just to get rid of the annoying warnings

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

local function config(packageName)
	pcall(function() require(packageName).setup() end)
	pcall(require, packageName .. "-config")
end

local function install(use, packages)
	for _, package in ipairs(packages) do
		use({
			package.repo,
			config = config(package.name),
			run = package.run,
			as = package.as,
		})
	end
end

require("packer").startup(function(use)
	local null_ls_run = "brew install fsouza/prettierd/prettierd stylua jsonlint && npm install -g eslint_d"

	install(use, {
		{ name = "packer", repo = "wbthomason/packer.nvim" },
		{ name = "plenary", repo = "nvim-lua/plenary.nvim" },
		{ name = "treesitter", repo = "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
		{ name = "lsp", repo = "neovim/nvim-lspconfig" },
		{ name = "null-ls", repo = "jose-elias-alvarez/null-ls.nvim", run = null_ls_run },
		{ name = "mason", repo = "williamboman/mason.nvim", run = "brew install luarocks" },
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
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)

-- =========== Helpers
local function autocommand(trigger, opts)
	vim.api.nvim_create_autocmd(trigger, opts)
end

local function map(mode, key, command, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, key, command, options)
end

function ToggleExplore()
	if vim.fn.exists("w:netrw_rexlocal") == 1 then
		vim.api.nvim_command("Rexplore")
	elseif vim.fn.exists("w:netrw_rexfile") == 1 and vim.bo.filetype == "netrw" then
		vim.api.nvim_command("e " .. vim.w.netrw_rexfile)
	else
		vim.api.nvim_command("Explore")
	end
end

-- TODO:
-- x make hotkey toggle
-- x use lua api
-- o set buffer type, options, etc (like aerial)
-- o make cheatsheet display prettier - icons, etc.
-- o read cheatsheet from data directory instead of hardcoding path
-- o allow options passed in, etc
-- o make it not show up in buffer list
--
-- o add autocommands for mksession
-- o make mini.sessions store sessions in data folder, not project folder
CheatsheetWinId = false
function ViewCheatsheet()
	if CheatsheetWinId ~= false then
		vim.api.nvim_win_close(CheatsheetWinId, false)
		CheatsheetWinId = false
		return
	end
	vim.cmd([[topleft vs]])
	vim.cmd([[vertical resize 35]])
	vim.cmd([[view ~/.config/nvim/cheatsheet.txt]])
	vim.api.nvim_buf_set_option(0, "modifiable", false)
	vim.api.nvim_win_set_option(0, "list", false)
	vim.api.nvim_win_set_option(0, "winfixwidth", true)
	vim.api.nvim_win_set_option(0, "number", false)
	vim.api.nvim_win_set_option(0, "signcolumn", "no")
	vim.api.nvim_win_set_option(0, "foldcolumn", "0")
	vim.api.nvim_win_set_option(0, "relativenumber", false)
	vim.api.nvim_win_set_option(0, "wrap", false)
	vim.api.nvim_win_set_option(0, "spell", false)
	CheatsheetWinId = vim.api.nvim_get_current_win()
end

function ToggleFileTree()
	-- TODO - cleaner way to track if Lexplore is open
	if vim.g.netrw_liststyle == 3 then
		vim.g.netrw_liststyle = 0
	else
		vim.g.netrw_liststyle = 3
	end
	vim.api.nvim_command("15Lexplore")
end

--==========General Settings==============================================
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

vim.cmd([[colorscheme catppuccin]])
vim.cmd([[hi! link FloatBorder TelescopeBorder]])
vim.cmd([[hi! link NormalFloat TelescopeNormal]])
vim.cmd([[hi! link FloatermBorder TelescopeBorder]])
vim.cmd([[hi! link Floaterm TelescopeNormal]])
vim.cmd([[hi! link MiniCursorWord Search]])
vim.cmd([[hi! link VertSplit SignColumn]])
vim.cmd([[hi! MiniCursorwordCurrent gui=nocombine guifg=NONE guibg=NONE]])

-- Keymaps
map("n", "gd", ":Telescope lsp_definitions<cr>")
map("n", "gr", ":Telescope lsp_references<cr>")
map("n", "do", ":lua vim.lsp.buf.code_action()<cr>")
map("t", "<esc>", "<cmd>FloatermHide!<cr>")
map("n", "<tab>", "<c-w><c-w>")
map("n", "<s-tab>", "<c-w><c-h>")
map("n", "<cr>", ":Pounce<cr>")
map("n", "<leader>g", ":PounceRepeat<cr>")

map("n", "<space>a", ":Telescope neoclip<cr>")
map("n", "<space>s", ":Telescope live_grep<cr>")
map("n", "<space>d", ":AerialToggle<cr>")
map("n", "<space>f", ":Telescope find_files<cr>")
map("n", "<space>g", ":lua ViewCheatsheet()<cr>")
map("n", "<space>j", ":lua ToggleExplore()<cr>")
map("n", "<space>h", ":lua ToggleFileTree()<cr>")
map("n", "<space>k", ":w<cr>")
map("n", "<space>l", ":FloatermToggle<cr>")
map("n", "<space>;", ":noh<cr>")

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

map("n", "<leader>f", '<cmd>lua require("spectre").open()<cr>')
map("n", "<leader>q", ":Cheatsheet<cr>")

map("n", "<space><space>", ":Telescope buffers<cr>")

map("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true })
map("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })

vim.cmd([[command! Ls :lua MiniSessions.select()]])
vim.cmd([[command! -nargs=1 Ms :lua MiniSessions.write(<f-args>, {force = true})]])

-- Autocommands
autocommand("BufWritePre", { command = "lua vim.lsp.buf.formatting()" })
autocommand("BufWritePre", { command = "lua MiniTrailspace.trim()" })
autocommand("BufWritePre", { command = "lua MiniTrailspace.trim_last_lines()" })
autocommand("FocusLost", { command = "wall" })
autocommand("VimLeave", { command = "lua MiniSessions.write(nil, {force = true})" })
autocommand("VimEnter", { command = ":Ls" })
