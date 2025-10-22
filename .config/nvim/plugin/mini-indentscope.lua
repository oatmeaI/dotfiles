MiniDeps.later(function()
    require("mini.indentscope").setup({
        symbol = "│",
        draw = {
            animation = require("mini.indentscope").gen_animation.quadratic({ unit = "total", duration = 100 }),
            delay = 50,
        },
    })
end)
