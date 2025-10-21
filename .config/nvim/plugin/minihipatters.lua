MiniDeps.later(function()
    require("mini.hipatterns").setup({
        highlighters = {
            fixme = { pattern = "FIXME:?", group = "MiniHipatternsFixme" },
            hack = { pattern = "HACK:?", group = "MiniHipatternsHack" },
            todo = { pattern = "TODO:?", group = "MiniHipatternsTodo" },
            note = { pattern = "NOTE:?", group = "MiniHipatternsNote" },
            later = { pattern = "LATER:?", group = "MiniHipatternsNote" },
        },
    })
end)
