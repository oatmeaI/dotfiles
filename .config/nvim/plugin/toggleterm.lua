Pack({
    source = "akinsho/toggleterm.nvim",
    setup = true,
    config = {
        -- TODO: Don't know why I need to config this manually but whatever
        highlights = { FloatBorder = { guifg = "#8aadf4" } },
        direction = "float",
        float_opts = {
            border = "rounded",
            winblend = 5,
        },
    },
})
