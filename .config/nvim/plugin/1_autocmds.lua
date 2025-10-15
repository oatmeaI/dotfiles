-- Save all when focus lost
AutoCmd("FocusLost", { command = "lua pcall(vim.cmd('wall'))" })
