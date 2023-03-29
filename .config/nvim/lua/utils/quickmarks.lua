local vim = vim
local M = {}

M.marks = {}

local function _updateQfList()
	-- Update the QF list
	local qf_list = {}
	for idx = 1, #M.marks do
		qf_list[idx] = {
			bufnr = M.marks[idx].bufnr,
			filename = M.marks[idx].filename,
			lnum = M.marks[idx].lnum,
			col = M.marks[idx].col,
		}
	end
	vim.fn.setqflist(qf_list)
end

function M.removeMark()
	local pos = vim.api.nvim_win_get_cursor(0)
	local line = pos[1]
	table.remove(M.marks, line)

	_updateQfList()
end

function M.toggleMark()
	local bufnr = vim.api.nvim_get_current_buf()
	local bufname = vim.api.nvim_buf_get_name(0)
	local pos = vim.api.nvim_win_get_cursor(0)
	local removed = false

	-- If mark already exists at this line in this file, remove it
	for idx = 1, #M.marks do
		local m_bufnr = M.marks[idx].bufnr
		local m_lnum = M.marks[idx].lnum
		if m_bufnr == bufnr and m_lnum == pos[1] then
			table.remove(M.marks, idx)
			removed = true
			break
		end
	end

	-- If we didn't remove a mark, that means we should add one instead
	if removed ~= true then
		table.insert(M.marks, { bufnr = bufnr, filename = bufname, lnum = pos[1], col = pos[2] })
	end

	_updateQfList()
end

-- Setup dd mapping in quickfix list to remove mark
vim.cmd([[autocmd FileType qf map <buffer> dd :lua require('utils/quickmarks').removeMark()<cr>]])

return M
