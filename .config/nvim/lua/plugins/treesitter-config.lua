require("nvim-treesitter.configs").setup({
	ensure_installed = "all",
	sync_install = false,
	auto_install = true,
	highlight = { enable = true },
	rainbow = {
		enable = true,
		-- list of languages you want to disable the plugin for
		disable = { "jsx", "cpp" },
		-- Which query to use for finding delimiters
		query = "rainbow-parens",
		-- Highlight the entire buffer all at once
		strategy = require("ts-rainbow").strategy.global,
	},
	playground = {
		enable = true,
		disable = {},
		updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
		persist_queries = false, -- Whether the query persists across vim sessions
		keybindings = {
			toggle_query_editor = "o",
			toggle_hl_groups = "i",
			toggle_injected_languages = "t",
			toggle_anonymous_nodes = "a",
			toggle_language_display = "I",
			focus_language = "f",
			unfocus_language = "F",
			update = "R",
			goto_node = "<cr>",
			show_help = "?",
		},
	},
	textobjects = {
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
		},
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["iq"] = "@parameter.inner",
				["aq"] = "@parameter.outer",
			},
		},
	},
})
