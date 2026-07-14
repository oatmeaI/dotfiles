Pack({
    source = "monaqa/dial.nvim",
    setup = false,
    callback = function()
        local augend = require("dial.augend")
        require("dial.config").augends:register_group({
            default = {
                augend.integer.alias.decimal,
                augend.integer.alias.decimal_int,
                augend.integer.alias.hex,
                augend.constant.alias.bool,
                augend.semver.alias.semver,
                augend.date.alias["%m/%d/%Y"],
                augend.constant.new({
                    elements = { "and", "or" },
                    word = true, -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
                    cyclic = true, -- "or" is incremented into "and".
                }),
                augend.constant.new({
                    elements = { "&&", "||", "??" },
                    word = true, -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
                    cyclic = true, -- "or" is incremented into "and".
                }),
                augend.constant.new({
                    elements = { "top", "bottom" },
                    word = true,
                    cyclic = true,
                }),
                augend.constant.new({
                    elements = { "left", "right" },
                    word = true,
                    cyclic = true,
                }),
                augend.constant.new({
                    elements = { "start", "end" },
                    word = true,
                    cyclic = true,
                }),
            },
        })
        vim.keymap.set("n", "<C-a>", function()
            require("dial.map").manipulate("increment", "normal")
        end)
        vim.keymap.set("n", "<C-x>", function()
            require("dial.map").manipulate("decrement", "normal")
        end)
        vim.keymap.set("n", "g<C-a>", function()
            require("dial.map").manipulate("increment", "gnormal")
        end)
        vim.keymap.set("n", "g<C-x>", function()
            require("dial.map").manipulate("decrement", "gnormal")
        end)
        vim.keymap.set("x", "<C-a>", function()
            require("dial.map").manipulate("increment", "visual")
        end)
        vim.keymap.set("x", "<C-x>", function()
            require("dial.map").manipulate("decrement", "visual")
        end)
        vim.keymap.set("x", "g<C-a>", function()
            require("dial.map").manipulate("increment", "gvisual")
        end)
        vim.keymap.set("x", "g<C-x>", function()
            require("dial.map").manipulate("decrement", "gvisual")
        end)
    end,
})
