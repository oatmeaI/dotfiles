require("neoscroll").setup()
local t = {}
-- Syntax: t[keys] = {function, {function arguments}}
t["<s-j>"] = { "scroll", { "vim.wo.scroll", "true", "150" } }
t["<s-k>"] = { "scroll", { "-vim.wo.scroll", "true", "150" } }
require("neoscroll.config").set_mappings(t)

