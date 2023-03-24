local vim = vim -- Just to get rid of the annoying warnings
local packup = require("helpers").packup
local autocommand = require("helpers").autocommand

-- Packages
packup({
	-- Package manager
	{ name = "packer", repo = "wbthomason/packer.nvim" },
	-- Depedencies for other plugins
	{ name = "plenary", repo = "nvim-lua/plenary.nvim" },
	-- Dependencies for other plugins(?)
	{ name = "kevin-promise", repo = "kevinhwang91/promise-async" },
	-- Language parsing for things like symbols, etc
	{ name = "treesitter", repo = "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
	-- Configs for builtin language servers
	{ name = "lsp", repo = "neovim/nvim-lspconfig" },
	-- Language server that provides other functionality - like linting, formatting, etc.
	{ name = "nullls", repo = "jose-elias-alvarez/null-ls.nvim" },
	-- Tool for installing & managing other code tools - like linters, etc.
	{ name = "mason", repo = "williamboman/mason.nvim" },
	-- Connect Mason tools to Null LS automatically
	{ name = "mason_nullls", repo = "jayp0521/mason-null-ls.nvim" },
	-- Connect Mason tools to LSP automatically
	{ name = "mason_lspconfig", repo = "williamboman/mason-lspconfig.nvim" },
	-- Small tweak to automatically continue lists (ex. type "- some stuff" and then newline)
	{ name = "autolist", repo = "gaoDean/autolist.nvim" },
	-- Lots of modules - I use:
	-- Surround, Completion, Cursorword, Pairs, Trailspace, AI (textobjects),
	-- Bufremove, Fuzzy (for Telescope), Comment, Sessions
	{ name = "mini", repo = "echasnovski/mini.nvim" },
	-- Clipboard history manager for Telescope
	{ name = "neoclip", repo = "AckslD/nvim-neoclip.lua" },
	-- Popup palette to pick lots of stuff
	{ name = "telescope", repo = "nvim-telescope/telescope.nvim" },
	-- Sidebar symbols layout
	{ name = "aerial", repo = "stevearc/aerial.nvim" },
	-- Helps keep certain buffers static (i.e. Aerial)
	{ name = "stickybuf", repo = "stevearc/stickybuf.nvim" },
	-- Quick buffer navigation, a la Hop or Sneak
	{ name = "pounce", repo = "rlane/pounce.nvim" },
	-- Statusline
	{ name = "lualine", repo = "nvim-lualine/lualine.nvim" },
	-- Catppuccin theme
	{ name = "catppuccin", repo = "catppuccin/nvim", as = "catpuccin" },
	-- Small UI enhancements
	{ name = "dressing", repo = "stevearc/dressing.nvim" },
	-- Quick access to LSP diagnostics
	{ name = "trouble", repo = "folke/trouble.nvim" },
	-- Floating terminal inside Neovim
	{ name = "floaterm", repo = "voldikss/vim-floaterm" },
	-- Cleaner scrolling
	{ name = "neoscroll", repo = "karb94/neoscroll.nvim" },
	-- Tweaks to F (find in line) functionality
	{ name = "clever-f", repo = "rhysd/clever-f.vim" },
	-- Provides git blame for statusline
	{ name = "gitblame", repo = "f-person/git-blame.nvim" },
	-- Loading UI, mostly used by LSP
	{ name = "fidget", repo = "j-hui/fidget.nvim" },
	-- Some tweaks to the basic yank functionality, including adding it to the system clipboard
	{ name = "smartyank", repo = "ibhagwan/smartyank.nvim" },
	-- Increment / decrement booleans, and some other datatypes
	{ name = "boole", repo = "nat-418/boole.nvim" },
	-- Icons for use in the UI
	{ name = "devicons", repo = "nvim-tree/nvim-web-devicons" },
	-- Quick way to generate screenshots from code
	{ name = "silicon", repo = "narutoxy/silicon.lua", run = "brew install silicon" },
	-- Snippet manager
	{ name = "luasnip", repo = "L3MON4D3/LuaSnip" },
	-- Predefined snippets
	{ name = "snippets", repo = "rafamadriz/friendly-snippets" },
	-- Typescript syntax for Vim. Might not be necessary, since I have LSP
	{ name = "typescript", repo = "leafgarland/typescript-vim" },
	-- Project-wide find & replace
	{ name = "spectre", repo = "nvim-pack/nvim-spectre" },
	-- Convenience methods for managing / navigating git conflicts
	{ name = "git-conflict", repo = "akinsho/git-conflict.nvim" },
	-- Telescope plugin to show commands / cheatsheet
	{ name = "command-center", repo = "FeiyouG/command_center.nvim" },
	-- Basic treesitter powered textobjects
	{ name = "treesitter-textobjects", repo = "nvim-treesitter/nvim-treesitter-textobjects" },
	-- Smart treesitter-aware textobjects
	{ name = "treesitter-textsubjects", repo = "RRethy/nvim-treesitter-textsubjects" },
	-- LSP-based syntax tree navigation & editing
	{ name = "tree-climber", repo = "drybalka/tree-climber.nvim" },
	-- Easy textobject creation
	{ name = "user-textobj", repo = "kana/vim-textobj-user" },
	-- Textobj for working with camelcase, etc
	{ name = "text-obj-variable-segment", repo = "Julian/vim-textobj-variable-segment" },
	-- Completion engine
	{ name = "nvim-cmp", repo = "hrsh7th/nvim-cmp" },
	{ name = "nvim-cmp-lsp", repo = "hrsh7th/cmp-nvim-lsp" },
	{ name = "nvim-cmp-buffer", repo = "hrsh7th/cmp-buffer" },
	{ name = "nvim-cmp-luasnip", repo = "saadparwaiz1/cmp_luasnip" },
	-- Automatically switch between relative linenumbers and absolute
	{ name = "relative-toggle", repo = "cpea2506/relative-toggle.nvim" },
	-- Prettier notifications
	{ name = "notify", repo = "rcarriga/nvim-notify" },
	-- Keyboard shortcut coach
	{ name = "which-key", repo = "folke/which-key.nvim" },
	-- Help correct typos when opening files
	{ name = "typo", repo = "axieax/typo.nvim" },
	-- Just a toy: add a pet
	{ name = "hologram", repo = "giusgad/hologram.nvim" },
	{ name = "nui", repo = "MunifTanjim/nui.nvim" },
	{ name = "pets", repo = "giusgad/pets.nvim" },
})

-- Settings
-- Use nvim-notify plugin for notifications
vim.notify = require("notify")
-- Allow mouse interaction
vim.o.mouse = "a"
-- Use undofile for tracking undo history
vim.o.undofile = true
-- Don't use swapfile
vim.o.swapfile = false
-- Indent wrapped lines for clearer reading
vim.o.breakindent = true
-- Ignore case in search, etc by default
vim.o.ignorecase = true
-- Don't ignore case if search contains mixed case
vim.o.smartcase = true
-- Quicker timeout during key combos etc
vim.o.updatetime = 250
-- Use GUI colors (more color options)
vim.o.termguicolors = true
-- Highlight the current line
vim.o.cursorline = true
-- Statusline spans entire application, instead of windows
vim.o.laststatus = 3
-- Always open new splits to the right
vim.o.splitright = true
-- Default to inserting spaces instead of tabs
vim.o.expandtab = true
-- 1 tab (\t) = 4 spaces
vim.o.tabstop = 4
-- 1 tab keypress = 4 spaces
vim.o.softtabstop = 4
-- 1 indent = 4 spaces
vim.o.shiftwidth = 4
-- Column on the side for showing icons etc (might not need this)
vim.o.signcolumn = "yes"
-- Show linenumber
vim.o.number = true
-- Fold based on indents (can use LSP for this, but indent seems to work just fine)
vim.o.foldmethod = "indent"
-- Start without folds turned on
vim.o.foldenable = false
-- Always show the tabline
vim.o.showtabline = 2
-- Use relative linenumbers
vim.o.relativenumber = true
-- Hide Markdown stuff
vim.o.conceallevel = 3
-- Keep cursor from hitting absolute top or bottom of window
vim.o.scrolloff = 4
-- Insert indents automatically
vim.o.smartindent = true

-- UI Settings
-- TODO: plugin specific ones shouldn't be here
-- Make Floatterm use ZSH
vim.g.floaterm_shell = "zsh"
-- Make Floatterm look like Telescope
vim.g.floaterm_borderchars = "─│─│╭╮╯╰"
-- If Floatterm opens a file, open it in a split
vim.g.floaterm_opener = "split"
-- Template for git blame string in statusline
vim.g.gitblame_message_template = "<author>, <date>"
-- ???
vim.g.gitblame_display_virtual_text = 0
-- Format git blame like "3 days ago"
vim.g.gitblame_date_format = "%r"
-- Theme
vim.g.catppuccin_flavour = "macchiato"
-- Don't show the help banner on file browser
vim.g.netrw_banner = false
-- Don't hide files in Netrw
vim.g.netrw_hide = 0

-- Color settings
-- TODO: Plugin specific to separate files
-- Set colorscheme
vim.cmd([[colorscheme catppuccin]])
-- Clean up fold highlights
vim.cmd([[hi! Folded guibg=NONE gui=nocombine]])
-- Make floating windows look like telescope
vim.cmd([[hi! link FloatBorder TelescopeBorder]])
vim.cmd([[hi! link NormalFloat TelescopeNormal]])
vim.cmd([[hi! link FloatermBorder TelescopeBorder]])
vim.cmd([[hi! link Floaterm TelescopeNormal]])
-- Change highlight for currently selected word
vim.cmd([[hi! link MiniCursorWord Search]])
vim.cmd([[hi! MiniCursorwordCurrent gui=nocombine guifg=NONE guibg=NONE]])
-- Nicer borders between windows
vim.cmd([[hi! link VertSplit SignColumn]])

-- Nicer diagnostic signs
local signs = {
	Error = " ",
	Warn = " ",
	Hint = " ",
	Info = " ",
}
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

require("keys")

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
-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
	command = "checktime",
})
-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})
-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})
