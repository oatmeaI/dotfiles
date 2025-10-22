-- Helper functions used in various config files
U = {}

local map = function(mode, trigger, effect, description, _options)
    local options = _options or {}
    options.desc = description
    vim.keymap.set(mode, trigger, effect, options)
end

-- Map in normal mode
U.nmap = function(trigger, effect, description, options)
    map("n", trigger, effect, description, options)
end
--
-- Map in terminal mode
U.tmap = function(trigger, effect, description, options)
    map("t", trigger, effect, description, options)
end

-- Map to normal and visual
U.vmap = function(trigger, effect, description, options)
    map({ "n", "x" }, trigger, effect, description, options)
end

-- Map in normal mode with leader key
U.lmap = function(trigger, effect, description, options)
    map("n", "<leader>" .. trigger, effect, description, options)
end

-- Map in insert mode as expression
U.imap_expr = function(trigger, effect)
    map("i", trigger, effect, "", { expr = true })
end
