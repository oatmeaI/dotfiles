local vim = vim
local git_blame = require("gitblame")

local function path()
	return vim.fn.expand("%")
end

local function blame()
	return git_blame.is_blame_text_available() and git_blame.get_current_blame_text() or ""
end

require("lualine").setup({
	options = {
		globalstatus = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { path },
		lualine_c = { "aerial" },
		lualine_x = {},
		lualine_y = { blame },
		lualine_z = { "filetype" },
	},
	tabline = {
		lualine_a = { "filename" },
		lualine_b = { "diagnostics", { sources = { "nvim_lsp" } } },
		lualine_y = { "tabs" },
		lualine_z = { "branch" },
	},
})
