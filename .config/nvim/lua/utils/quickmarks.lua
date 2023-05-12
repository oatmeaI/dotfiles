local vim = vim
local M = {}

-- TODO: persist across launches? -> Might not make sense with QF list
-- TODO: breaks if you close buffer with mark...-> Might not be fixable while using QF list
-- TODO: sign in sign column if marked

M.marks = {}

local function _updateQfList()
	-- Update the QF list
	local qf_list = {}
	for idx = 1, #M.marks do
		qf_list[idx] = {
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
	local bufname = vim.api.nvim_buf_get_name(0)
	local pos = vim.api.nvim_win_get_cursor(0)
	local removed = false

	-- If mark already exists at this line in this file, remove it
	for idx = 1, #M.marks do
		local m_filename = M.marks[idx].filename
		local m_lnum = M.marks[idx].lnum
		if m_filename == bufname and m_lnum == pos[1] then
			table.remove(M.marks, idx)
			removed = true
			break
		end
	end

	-- If we didn't remove a mark, that means we should add one instead
	if removed ~= true then
		table.insert(M.marks, { filename = bufname, lnum = pos[1], col = pos[2] })
	end

	_updateQfList()
end

-- Setup dd mapping in quickfix list to remove mark
vim.cmd([[autocmd FileType qf map <buffer> dd :lua require('utils/quickmarks').removeMark()<cr>]])
vim.cmd([[au FileType qf setlocal nonumber]])

-- TODO: Telescope picker for quickmarks?
-- local pickers = require("telescope.pickers")
-- local finders = require("telescope.finders")
-- local conf = require("telescope.config").values
--
-- function M.quickmarkPicker(opts)
-- 	opts = opts or {}
-- 	pickers
-- 		.new(opts, {
-- 			prompt_title = "colors",
-- 			finder = finders.new_table({
-- 				results = M.marks,
-- 			}),
-- 			sorter = conf.generic_sorter(opts),
-- 		})
-- 		:find()
-- end

return M
