Pack({
    source = "ibhagwan/fzf-lua",
    setup = true,
    callback = function()
        FzfLua.register_ui_select()
    end,
    config = {
        marks = {
            marks = "^%a$", -- omit special marks from the picker
        },
    },
})
