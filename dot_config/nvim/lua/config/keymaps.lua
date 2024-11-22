-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local vim = vim
local map = vim.keymap.set

-- vim.keymap.del("n", "<space>e")
vim.keymap.del("n", "<space>xx")
vim.keymap.del("n", "<space>xX")

-- Shift + J/K to scroll fast
map("n", "<down>", "10j")
map("n", "<up>", "10k")
map("n", "<s-j>", "10j")
map("n", "<s-k>", "10k")

-- Shift + J/K for visual mode too
map("v", "<down>", "10j")
map("v", "<up>", "10k")

-- Tab & Shift-Tab to navigate windows
map("n", "<s-tab>", "<c-w>h", { desc = "Focus west window" })
map("n", "<tab>", "<c-w>l", { desc = "Focus east window" })

map("n", "<space>k", ":w<cr>", { desc = "Write buffer" })

-- Floating terminal
map("n", "<space>l", function()
  Snacks.terminal.toggle(nil, { win = { position = "float" } })
end, { desc = "Terminal (cwd)" })
map("t", "<esc>", function()
  vim.cmd("stopinsert")
  vim.cmd("hide")
end, { desc = "Hide Terminal" })

-- Ctrl+P goes forward
map("n", "<c-p>", "<c-i>", { desc = "Jump forward" })

-->> Window navigation <<--
-- Alt + j
map("n", "∆", "<c-w>j", {
  desc = "Focus south window",
})

-- Alt + h
map("n", "˙", "<c-w>h", { desc = "Focus west window" })

-- Alt + k
map("n", "˚", "<c-w>k", { desc = "Focus north window" })

-- Alt + l
map("n", "¬", "<c-w>l", { desc = "Focus east window" })

-- Floating file / buffer explorer
map("n", "<space>j", ":Neotree position=current toggle=true reveal=true<cr>", { desc = "Show file explorer" })
map("n", "<space>h", ":Neotree position=current source=buffers<cr>", { desc = "Show buffer list" })

-- Resume previous search
map("n", "<space>e", ":FzfLua resume<cr>", { desc = "Resume previous search" })

-- Jump using flash via Enter
map("n", "<cr>", function()
  require("flash").jump({ continue = false })
end, { desc = "Flash" })

-- LSP Hover
map("n", "<space>ci", function()
  vim.lsp.buf.hover()
end, { desc = "Show LSP hover" })

map("n", "<space>xx", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" })
map("n", "<space>xX", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })

map(
  "n",
  "gds",
  "<cmd>vs<cr><cmd>FzfLua lsp_definitions jump_to_single_result=true ignore_current_line=true<cr>",
  { desc = "Go to def in new split" }
)
