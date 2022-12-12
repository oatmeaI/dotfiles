local vim = vim -- Just to get rid of the annoying warnings

local M = {}

function M.ToggleExplore()
	if vim.fn.exists("w:netrw_rexlocal") == 1 then
		vim.api.nvim_command("Rexplore")
	elseif vim.fn.exists("w:netrw_rexfile") == 1 and vim.bo.filetype == "netrw" then
		vim.api.nvim_command("e " .. vim.w.netrw_rexfile)
	else
		vim.api.nvim_command("Explore")
	end
end

function M.ToggleFileTree()
	-- TODO - cleaner way to track if Lexplore is open
	if vim.g.netrw_liststyle == 3 then
		vim.g.netrw_liststyle = 0
	else
		vim.g.netrw_liststyle = 3
	end
	vim.api.nvim_command("15Lexplore")
end

return M
