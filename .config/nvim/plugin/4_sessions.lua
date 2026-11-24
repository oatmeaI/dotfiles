-- Session handling
-- There's an autocommand later that sets up auto save

Pack({
    source = "gennaro-tedesco/nvim-possession",
    setup = true,
    config = {
        autosave = true,
        sessions = { sessions_icon = "", sessions_prompt = "> " },
        fzf_hls = {
            border = "FloatBorder",
            preview_border = "FloatBorder",
        },
        fzf_winopts = {
            title = " sessions",
            preview = {
                hidden = "hidden",
            },
        },
    },
})
