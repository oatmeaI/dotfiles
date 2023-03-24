local vim = vim
-- Set colorscheme
vim.cmd([[colorscheme catppuccin]])
vim.g.catppuccin_flavour = "macchiato"

-- Clean up fold highlights
vim.cmd([[hi! Folded guibg=NONE gui=nocombine]])

-- Make floating windows look like telescope
vim.cmd([[hi! link FloatBorder TelescopeBorder]])
vim.cmd([[hi! link NormalFloat TelescopeNormal]])

-- Nicer borders between windows
vim.cmd([[hi! link VertSplit SignColumn]])

-- Nicer diagnostic signs
local signs = {
	Error = " ",
	Warn = " ",
	Hint = " ",
	Info = " ",
}
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
