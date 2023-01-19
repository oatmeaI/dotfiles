require("mini.surround").setup()
require("mini.completion").setup({
	fallback_action = "<C-x><C-n>",
	lsp_completion = {
		auto_setup = false,
	},
})
require("mini.cursorword").setup()
require("mini.pairs").setup()
require("mini.trailspace").setup()
require("mini.ai").setup()
require("mini.bufremove").setup()
require("mini.fuzzy").setup()
require("mini.comment").setup()
require("mini.sessions").setup()
