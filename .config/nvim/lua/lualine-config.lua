-- local git_blame = require('gitblame')

local function path()
	return vim.fn.expand("%")
end

local function blame()
	return git_blame.is_blame_text_available() and git_blame.get_current_blame_text() or ""
end

require("lualine").setup({
	sections = {
		lualine_a = { "mode" },
		lualine_b = { path },
		-- lualine_c = {blame},
		lualine_c = {},
		lualine_x = { "filetype", "location" },
		lualine_y = {},
		lualine_z = { "aerial" },
	},
})
