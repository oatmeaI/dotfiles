local vim = vim -- Just to get rid of the annoying warnings

local M = {}

function M.ensure_packer()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

function config(packageName)
	pcall(function()
		require(packageName).setup()
	end)
	pcall(require, packageName .. "-config")
end

function M.install(use, packages)
	for _, package in ipairs(packages) do
		use({
			package.repo,
			config = config(package.name),
			run = package.run,
			as = package.as,
		})
	end
end

function M.autocommand(trigger, opts)
	vim.api.nvim_create_autocmd(trigger, opts)
end

function M.map(mode, key, command, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, key, command, options)
end

function M.packup(packages)
	local packer_bootstrap = M.ensure_packer()
	require("packer").startup(function(use)
		M.install(use, packages)

		if packer_bootstrap then
			require("packer").sync()
		end
	end)
end

function M.getSessionName()
	return vim.fn.fnamemodify(vim.fn.getcwd(), ":t:s?\\.??")
end

function M.sessionExists()
	local name = M.getSessionName()
	local sessions = MiniSessions.detected
	for _, session in pairs(sessions) do
		if session.name == name then
			return true
		end
	end
end

function M.loadSession()
	local name = M.getSessionName()
	if M.sessionExists() then
		local timer = vim.loop.new_timer()
		-- This is hacky
		timer:start(
			0,
			0,
			vim.schedule_wrap(function()
				MiniSessions.read(name, { force = true })
				timer:close()
			end)
		)
	end
end

return M
