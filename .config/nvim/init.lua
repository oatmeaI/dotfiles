-- Just to get rid of the annoying warnings
local vim = vim
require("impatient")

--==========General Settings==============================================
vim.o.mouse = "a"
vim.o.undofile = true
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

vim.cmd([[colorscheme catppuccin]])
-- " exec 'hi VertSplit guifg=' . synIDattr(hlID('TabLineFill'),'bg')|     " Make the split borders less obtrusive
-- " exec 'hi VertSplit guibg=' . synIDattr(hlID('TabLineFill'),'bg')|     " Make the split borders less obtrusive
vim.cmd([[hi! link FloatBorder TelescopeBorder]])
vim.cmd([[hi! link NormalFloat TelescopeNormal]])
vim.cmd([[hi! link FloatermBorder TelescopeBorder]])
vim.cmd([[hi! link Floaterm TelescopeNormal]])
vim.cmd([[hi! link MiniCursorWord Search]])
vim.cmd([[hi! MiniCursorwordCurrent gui=nocombine guifg=NONE guibg=NONE]])

-- Keymaps
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

function ToggleFileTree()
	-- TODO - cleaner way to track if Lexplore is open
	if vim.g.netrw_liststyle == 3 then
		vim.g.netrw_liststyle = 0
	else
		vim.g.netrw_liststyle = 3
	end
	vim.api.nvim_command("15Lexplore")
end

map("n", "gd", ":Telescope lsp_definitions<cr>")
map("n", "gr", ":Telescope lsp_references<cr>")
map("n", "do", ":lua vim.lsp.buf.code_action()<cr>")
map("t", "<esc>", "<cmd>FloatermHide!<cr>")
map("n", "<tab>", "<c-w><c-w>")
map("n", "<s-tab>", "<c-w><c-h>")
map("n", "<cr>", ":Pounce<cr>")

map("n", "<s-j>", "<c-d>")
map("n", "<s-k>", "<c-u>")

map("n", "<space>a", ":Telescope neoclip<cr>")
map("n", "<space>s", ":Telescope live_grep<cr>")
map("n", "<space>d", ":AerialToggle<cr>")
map("n", "<space>f", ":Telescope find_files<cr>")
map("n", "<space>g", ":lua vim.lsp.buf.formatting()<cr>")
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

-- Autocommands
local function autocommand(trigger, opts)
	vim.api.nvim_create_autocmd(trigger, opts)
end

autocommand("BufWritePre", { command = "lua MiniTrailspace.trim()" })
autocommand("BufWritePre", { command = "lua MiniTrailspace.trim_last_lines()" })
autocommand("BufWritePre", { command = "lua vim.lsp.buf.formatting()" })
autocommand("FocusLost", { command = "wall" })

-- command! Ls :lua MiniSessions.select()

-- ============================== Plugins =================================
require("packer").startup(function(use)
	--======================Dependencies===========================
	-- Package management
	-- https://github.com/wbthomason/packer.nvim
	use("wbthomason/packer.nvim")

	-- General Icons
	-- https://github.com/kyazdani42/nvim-web-devicons
	-- use 'kyazdani42/nvim-web-devicons'

	-- General Util Library
	-- https://github.com/nvim-lua/plenary.nvim
	use("nvim-lua/plenary.nvim")

	-- Plugin Caching Etc.
	-- https://github.com/lewis6991/impatient.nvim
	use("lewis6991/impatient.nvim")
	--=============================================================

	--======================IDE Essentials=========================
	-- Better Jumping
	use({
		"rlane/pounce.nvim",
		config = function()
			require("pounce").setup({})
		end,
	})

	-- Statusline
	-- https://github.com/nvim-lualine/lualine.nvim
	use({
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine-config")
		end,
	})

	-- Setup native treesitter
	-- https://github.com/nvim-treesitter/nvim-treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("treesitter-config")
		end,
	})

	-- Setup native LSP
	-- https://github.com/neovim/nvim-lspconfig
	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("lsp-config")
		end,
	})

	-- LSP server for doing formatting & linting
	-- https://github.com/jose-elias-alvarez/null-ls.nvim
	use({
		"jose-elias-alvarez/null-ls.nvim",
		run = "brew install fsouza/prettierd/prettierd jsonlint && npm install -g eslint_d",
		config = function()
			require("null-ls-config")
		end,
	})

	-- Set up tooling for LSP servers, formatters, linters, etc
	use({
		"williamboman/mason.nvim",
		run = "brew install luarocks",
		config = function()
			require("mason").setup()
		end,
	})
	--=============================================================

	--======================UI/UX Features & Tweaks ===============
	-- Lots of modules
	-- https://github.com/echasnovski/mini.nvim
	use({
		"echasnovski/mini.nvim",
		branch = "stable",
		config = function()
			require("mini.surround").setup()
			require("mini.completion").setup()
			require("mini.cursorword").setup()
			require("mini.pairs").setup()
			require("mini.trailspace").setup()
			require("mini.ai").setup()
			require("mini.bufremove").setup()
			require("mini.fuzzy").setup()
			require("mini.comment").setup()
			require("mini.sessions").setup()
			-- vim.api.nvim_create_user_command("Ls", ":lua MiniSessions.select()<cr>", {})
		end,
	})

	-- Command palette
	-- https://github.com/nvim-telescope/telescope.nvim
	use({
		"nvim-telescope/telescope.nvim",
		config = function()
			require("telescope").setup({
				defaults = {
					generic_sorter = require("mini.fuzzy").get_telescope_sorter,
					file_ignore_patterns = { "node_modules" },
					initial_mode = "normal",
				},
				pickers = {
					lsp_references = { initial_mode = "normal" },
					lsp_definitions = { initial_mode = "normal" },
				},
			})
			-- require('telescope').load_extension('neoclip')
		end,
	})

	-- Catppuccin Theme for NeoVim
	-- https://github.com/catppuccin/nvim
	use({
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			require("catppuccin").setup()
		end,
	})

	-- Better select ui
	-- https://github.com/stevearc/dressing.nvim
	use({
		"stevearc/dressing.nvim",
		config = function()
			require("dressing").setup()
		end,
	})

	-- Pretty LSP diagnostic display
	-- https://github.com/folke/trouble.nvim
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({ height = 5 })
		end,
		cmd = "TroubleToggle",
	})

	-- Floating terminal
	-- https://github.com/voldikss/vim-floaterm
	use({
		"voldikss/vim-floaterm",
	})
end)
