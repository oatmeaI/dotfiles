Pack({
    source = "ibhagwan/fzf-lua",
    setup = true,
    callback = function()
        FzfLua.register_ui_select()
    end,
})
