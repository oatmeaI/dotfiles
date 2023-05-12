local vim = vim
local autocommand = require("utils/helpers").autocommand

local function resizeSplits()
	vim.cmd("tabdo wincmd =")
end

local function goToLastLoc()
	local mark = vim.api.nvim_buf_get_mark(0, '"')
	local lcount = vim.api.nvim_buf_line_count(0)
	if mark[1] > 0 and mark[1] <= lcount then
		pcall(vim.api.nvim_win_set_cursor, 0, mark)
	end
end

-- Format on write
autocommand("BufWritePre", { command = "lua if vim.lsp.buf.server_ready() then vim.lsp.buf.format() end" })
-- Trim trailing whitespace on write
autocommand("BufWritePre", { command = "lua MiniTrailspace.trim()" })
-- Run ESLint on write
autocommand("BufWritePre", { command = ":EslintFixAll", pattern = "*.tsx,*.ts,*.jsx,*.js" })
-- Trim trailing whitespace lines on write
autocommand("BufWritePre", { command = "lua MiniTrailspace.trim_last_lines()" })
-- Write all files when going away from Neovim
autocommand("FocusLost", { command = "lua pcall(vim.cmd('wall'))" })
-- Write a session when exiting Neovim
autocommand("VimLeave", { command = "lua MiniSessions.write(nil, {force = true})" })
-- Close Quickfix window on exit (it's annoying when reopening)
autocommand("VimLeavePre", { command = ":cclose" })
-- Load session if one exists when starting Neovim
autocommand("VimEnter", { command = "lua require('utils/helpers').loadSession()" })
-- Check if we need to reload the file when it changed
autocommand({ "FocusGained", "TermClose", "TermLeave" }, { command = "checktime" })
-- Resize splits if window got resized
autocommand({ "VimResized" }, { callback = resizeSplits })
-- Go to last loc when opening a buffer
autocommand("BufReadPost", { callback = goToLastLoc })
