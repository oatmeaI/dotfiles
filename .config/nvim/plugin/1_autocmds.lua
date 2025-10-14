-- Save all when focus lost
AutoCmd("FocusLost", { command = "lua pcall(vim.cmd('wall'))" })

-- Create / save the session when quitting
AutoCmd("VimLeavePre", {
    callback = function()
        WriteSession()
    end,
})
