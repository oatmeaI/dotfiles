local vim = vim

-- Make floating windows look like telescope
vim.cmd([[hi! link FloatermBorder TelescopeBorder]])
vim.cmd([[hi! link Floaterm TelescopeNormal]])

-- Make Floatterm use ZSH
vim.g.floaterm_shell = "zsh"
-- Make Floatterm look like Telescope
vim.g.floaterm_borderchars = "─│─│╭╮╯╰"
-- If Floatterm opens a file, open it in a split
vim.g.floaterm_opener = "split"
