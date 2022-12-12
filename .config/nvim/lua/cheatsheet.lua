local vim = vim -- Just to get rid of the annoying warnings

-- TODO:
-- x make hotkey toggle
-- x use lua api
-- o set buffer type, options, etc (like aerial)
-- o make cheatsheet display prettier - icons, etc.
-- o read cheatsheet from data directory instead of hardcoding path
-- o allow options passed in, etc
-- o make it not show up in buffer list
-- o add autocommands for mksession
-- o make mini.sessions store sessions in data folder, not project folder
local M = {}
M.CheatsheetWinId = false
function M.ViewCheatsheet()
	if M.CheatsheetWinId ~= false then
		vim.api.nvim_win_close(M.CheatsheetWinId, false)
		M.CheatsheetWinId = false
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
	M.CheatsheetWinId = vim.api.nvim_get_current_win()
end

return M
