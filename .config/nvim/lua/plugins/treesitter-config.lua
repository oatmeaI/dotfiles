require("nvim-treesitter.configs").setup({
	ensure_installed = "all",
	sync_install = false,
	auto_install = true,
	highlight = { enable = true },
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
