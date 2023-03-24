local vim = vim -- Just to get rid of the annoying warnings

-- Allow mouse interaction
vim.o.mouse = "a"
-- Use undofile for tracking undo history
vim.o.undofile = true
-- Don't use swapfile
vim.o.swapfile = false
-- Indent wrapped lines for clearer reading
vim.o.breakindent = true
-- Ignore case in search, etc by default
vim.o.ignorecase = true
-- Don't ignore case if search contains mixed case
vim.o.smartcase = true
-- Quicker timeout during key combos etc
vim.o.updatetime = 250
-- Use GUI colors (more color options)
vim.o.termguicolors = true
-- Highlight the current line
vim.o.cursorline = true
-- Statusline spans entire application, instead of windows
vim.o.laststatus = 3
-- Always open new splits to the right
vim.o.splitright = true
-- Default to inserting spaces instead of tabs
vim.o.expandtab = true
-- 1 tab (\t) = 4 spaces
vim.o.tabstop = 4
-- 1 tab keypress = 4 spaces
vim.o.softtabstop = 4
-- 1 indent = 4 spaces
vim.o.shiftwidth = 4
-- Column on the side for showing icons etc (might not need this)
vim.o.signcolumn = "yes"
-- Show linenumber
vim.o.number = true
-- Fold based on indents (can use LSP for this, but indent seems to work just fine)
vim.o.foldmethod = "indent"
-- Start without folds turned on
vim.o.foldenable = false
-- Always show the tabline
vim.o.showtabline = 2
-- Use relative linenumbers
vim.o.relativenumber = true
-- Hide Markdown stuff
vim.o.conceallevel = 3
-- Keep cursor from hitting absolute top or bottom of window
vim.o.scrolloff = 4
-- Insert indents automatically
vim.o.smartindent = true
-- Don't show the help banner on file browser
vim.g.netrw_banner = false
-- Don't hide files in Netrw
vim.g.netrw_hide = 0
