-- Save all when focus lost
AutoCmd("FocusLost", { command = "lua pcall(vim.cmd('wall'))" })

-- Save all when quitting
AutoCmd("VimLeavePre", { command = "lua pcall(vim.cmd('wall'))" })

-- Save session when quitting
AutoCmd("QuitPre", { callback = SaveSession })

-- Highlight yanked text
AutoCmd("TextYankPost", {
    callback = function()
        vim.hl.on_yank({ higroup = "Visual", timeout = 300 })
    end,
})
