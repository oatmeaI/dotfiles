-- Currently only using the terminal plugin from this, but I may use more in the future.

Pack({
    source = "folke/snacks.nvim",
    name = "snacks",
    setup = true,
    config = {
        styles = {
            float = {
                border = "rounded",
            },
        },
        terminal = {
            shell = "fish",
            keys = {
                term_normal = {
                    "<esc>",
                    function(self)
                        vim.cmd("stopinsert")
                    end,
                    mode = "t",
                    expr = true,
                    desc = "Double escape to normal mode",
                },
            },
        },
        -- require("terminal"),
    },
})
