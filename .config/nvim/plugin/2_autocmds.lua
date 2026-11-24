-- Save all when focus lost
AutoCmd("FocusLost", { command = "lua pcall(vim.cmd('wall'))" })

-- Save all when quitting
AutoCmd("VimLeavePre", { command = "lua pcall(vim.cmd('wall'))" })

-- Load .session.vim if it exists in the current dir on startup
AutoCmd("VimEnter", {
    callback = function()
        local file = vim.fn.getcwd() .. "/.session.vim"
        if vim.uv.fs_stat(file) then
            -- Defer allows the main loop to start up so that syntax highlighting, etc, works
            vim.defer_fn(function()
                vim.cmd("source " .. file)
            end, 0)
        end
    end,
})

-- Save .session.vim in the current dir on quit, overwriting anything that exists already (with !)
-- This might get annoying in git repos, but I'm gonna try it out.
AutoCmd("QuitPre", {
    callback = function()
        vim.cmd("mksession! " .. vim.fn.getcwd() .. "/.session.vim")
    end,
})

AutoCmd("CursorHold", {
    callback = function()
        vim.cmd("mksession! " .. vim.fn.getcwd() .. "/.session.vim")
    end,
})

-- Even out splits when resized (b/c tmux)
AutoCmd("VimResized", { command = "wincmd =" })

-- Highlight yanked text
AutoCmd("TextYankPost", {
    callback = function()
        vim.hl.on_yank({ higroup = "Visual", timeout = 300 })
    end,
})
