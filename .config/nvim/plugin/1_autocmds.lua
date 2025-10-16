-- Save all when focus lost
AutoCmd("FocusLost", { command = "lua pcall(vim.cmd('wall'))" })

-- Highlight yanked text
AutoCmd("TextYankPost", {
    callback = function()
        vim.hl.on_yank({ higroup = "Visual", timeout = 300 })
    end,
})
