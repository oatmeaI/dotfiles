local vim = vim -- Just to get rid of the annoying warnings
local packup = require("helpers").packup
local map = require("helpers").map
local autocommand = require("helpers").autocommand

-- Packages
packup({
	{ name = "packer", repo = "wbthomason/packer.nvim" },
	{ name = "plenary", repo = "nvim-lua/plenary.nvim" },
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
map("n", "<tab>", "<c-w><c-w>")
map("n", "<s-tab>", "<c-w><c-h>")
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
