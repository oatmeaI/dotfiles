local command_center = require("command_center")

require("telescope").setup({
	defaults = {
		generic_sorter = require("mini.fuzzy").get_telescope_sorter,
		file_ignore_patterns = { "node_modules", "bundle", "dll" },
		initial_mode = "normal",
	},
	pickers = {
		lsp_references = { initial_mode = "normal" },
		find_files = { initial_mode = "insert" },
		live_grep = { initial_mode = "insert" },
		lsp_definitions = { initial_mode = "normal" },
		command_center = { initial_mode = "normal" },
	},
	extensions = {
		command_center = {
			components = {
				command_center.component.CATEGORY,
				command_center.component.DESC,
				command_center.component.KEYS,
			},
			sort_by = {
				command_center.component.CATEGORY,
				command_center.component.DESC,
			},
			separator = "           ",
			auto_replace_desc_with_cmd = false,
		},
	},
})
require("telescope").load_extension("neoclip")
require("telescope").load_extension("command_center")
