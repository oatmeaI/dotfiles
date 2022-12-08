
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
