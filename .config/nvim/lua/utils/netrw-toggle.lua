local vim = vim -- Just to get rid of the annoying warnings

local M = {}

function M.ToggleExplore()
	if vim.fn.exists("w:netrw_rexlocal") == 1 then
		vim.api.nvim_command("Rexplore")
	else
		vim.api.nvim_command("Explore")
	end
end

return M
