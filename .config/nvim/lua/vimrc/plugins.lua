local packup = require("utils/helpers").packup

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
	-- Keyboard shortcut coach
	{ name = "which-key", repo = "folke/which-key.nvim" },
	-- Help correct typos when opening files
	{ name = "typo", repo = "axieax/typo.nvim" },
	-- Just a toy: add a pet
	{ name = "hologram", repo = "giusgad/hologram.nvim" },
	{ name = "nui", repo = "MunifTanjim/nui.nvim" },
	{ name = "pets", repo = "giusgad/pets.nvim" },
	-- Enhance QF list
	{ name = "bqf", repo = "kevinhwang91/nvim-bqf" },
	-- Git diff view
	{ name = "diffview", repo = "sindrets/diffview.nvim" },
})
