-- Config for the dashboard included in mini.nvim.

local starter = require("mini.starter")
starter.setup({
    query_updaters = "",
    footer = "",
    items = {
        function()
            local items = {}
            local sessions = ListSessions()
            for _, sess in ipairs(sessions) do
                table.insert(items, {
                    name = sess.name,
                    section = "sessions",
                    action = function()
                        vim.cmd.source(sess.path)
                        vim.g.sessions = vim.fs.basename(sess.path)
                    end,
                })
            end
            return items
        end,
    },
})
