-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

opt.shell = "fish" -- use fish
opt.tabstop = 4 -- 1 tab (\t) = 4 spaces
opt.softtabstop = 4 -- 1 tab keypress = 4 spaces
opt.shiftwidth = 4 -- 1 indent = 4 spaces
opt.sidescrolloff = 0 -- Don't scroll sideways
opt.timeoutlen = 250 -- Quicker timeout for which-key etc
-- Always show the tabline
vim.o.showtabline = 2
