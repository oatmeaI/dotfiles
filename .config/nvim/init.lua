-- Just to get rid of the annoying warnings
local vim = vim
require("impatient")

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
map("n", "<space>d", ":AerialToggle<cr>:AerialTreeSetCollapseLevel 1<cr>")
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

-- Autocommands
local function autocommand(trigger, opts)
	vim.api.nvim_create_autocmd(trigger, opts)
end

autocommand("BufWritePre", { command = "lua vim.lsp.buf.formatting()" })
autocommand("BufWritePre", { command = "lua MiniTrailspace.trim()" })
autocommand("BufWritePre", { command = "lua MiniTrailspace.trim_last_lines()" })
autocommand("FocusLost", { command = "wall" })
autocommand("VimLeave", { command = "lua MiniSessions.write(nil, {force = true})" })

vim.cmd([[command! Ls :lua MiniSessions.select()]])
vim.cmd([[command! -nargs=1 Ms :lua MiniSessions.write(<f-args>, {force = true})]])

autocommand("VimEnter", { command = ":Ls" })

require("packer").startup(function(use)
	--======================Dependencies===========================
	-- Package management
	-- https://github.com/wbthomason/packer.nvim
	use("wbthomason/packer.nvim")

	-- General Util Library
	-- https://github.com/nvim-lua/plenary.nvim
	use("nvim-lua/plenary.nvim")

	-- Plugin Caching Etc.
	-- https://github.com/lewis6991/impatient.nvim
	use("lewis6991/impatient.nvim")

	--======================IDE Essentials=========================

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

	--======================UI/UX Features & Tweaks ===============
	-- Auto List Continuation
	-- https://github.com/gaoDean/autolist.nvim
	use({
		"gaoDean/autolist.nvim",
		config = function()
			require("autolist").setup({})
		end,
	})

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
		end,
	})

	-- Register (clipboard) manager
	-- https://github.com/AckslD/nvim-neoclip.lua
	use({
		"AckslD/nvim-neoclip.lua",
		config = function()
			require("neoclip").setup()
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
					find_files = { initial_mode = "insert" },
					live_grep = { initial_mode = "insert" },
					lsp_definitions = { initial_mode = "normal" },
				},
			})
			require("telescope").load_extension("neoclip")
		end,
	})

	-- Symbols outline sidebar
	-- https://github.com/stevearc/aerial.nvim
	use({
		"stevearc/aerial.nvim",
		config = function()
			require("aerial").setup({
				filter_kind = {
					"Class",
					"Constructor",
					"Enum",
					"Field",
					"File",
					"Function",
					"Interface",
					"Key",
					"Method",
					"Module",
					"Namespace",
					"Null",
					"Package",
					"Property",
					"String",
					"Struct",
					"Operator",
					"TypeParameter",
					"Variable",
				},
			})
		end,
	})

	-- Stop buffers from loading into Aerial window, etc
	-- https://github.com/stevearc/stickybuf.nvim
	use({
		"stevearc/stickybuf.nvim",
		config = function()
			require("stickybuf").setup()
		end,
	})

	-- Better Jumping
	-- https://github.com/rlane/pounce.nvim
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

	-- HARD MODE (stop using hjkl)
	-- https://github.com/takac/vim-hardtime
	use({
		"takac/vim-hardtime",
	})

	-- Smooth scrolling
	use({
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup()
			local t = {}
			-- Syntax: t[keys] = {function, {function arguments}}
			t["<s-j>"] = { "scroll", { "vim.wo.scroll", "true", "150" } }
			t["<s-k>"] = { "scroll", { "-vim.wo.scroll", "true", "150" } }
			require("neoscroll.config").set_mappings(t)
		end,
	})

	-- Better find in line experience
	use({
		"rhysd/clever-f.vim",
	})

	-- Exchange operator
	use({
		"tommcdo/vim-exchange",
	})

	use({
		"RRethy/nvim-treesitter-textsubjects",
		config = function()
			require("nvim-treesitter.configs").setup({
				textsubjects = {
					enable = true,
					prev_selection = ",", -- (Optional) keymap to select the previous selection
					keymaps = {
						["."] = "textsubjects-smart",
						[";"] = "textsubjects-container-outer",
						["i;"] = "textsubjects-container-inner",
					},
				},
			})
		end,
	})

	-- LSP Loading Spinner
	-- https://github.com/j-hui/fidget.nvim
	use({
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup()
		end,
	})

	-- Better yank / system clipboard integration
	-- https://github.com/ibhagwan/smartyank.nvim
	use({
		"ibhagwan/smartyank.nvim",
		config = function()
			require("smartyank").setup()
		end,
	})
end)
