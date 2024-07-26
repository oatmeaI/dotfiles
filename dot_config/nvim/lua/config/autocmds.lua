-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
function autocommand(trigger, opts)
  vim.api.nvim_create_autocmd(trigger, opts)
end
autocommand("FocusLost", { command = "lua pcall(vim.cmd('wall'))" })
