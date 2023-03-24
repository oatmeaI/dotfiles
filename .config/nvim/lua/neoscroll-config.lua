require("neoscroll").setup()
local t = {}
-- Syntax: t[keys] = {function, {function arguments}}
-- TODO: Move to keys.lua
t["<s-j>"] = { "scroll", { "vim.wo.scroll", "true", "150" } }
t["<s-k>"] = { "scroll", { "-vim.wo.scroll", "true", "150" } }
require("neoscroll.config").set_mappings(t)
