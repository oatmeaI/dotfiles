-- Load plugins
require("vimrc/plugins")

-- Set vim builtin settings
require("vimrc/vim-settings")

-- Colorscheme, highlight and other small UI tweaks
require("vimrc/ui")

-- Set up keymaps
require("vimrc/keys")

-- Define custom editor commands
require("vimrc/commands")

-- Set up autocommands
require("vimrc/autocommands")

-- TODOs:
-- Git & diagnostic mappings could be more ergonomic maybe? Consider
-- <space>y and <space>p are empty
-- Better LSP config for more langauges (basically only TS and Lua are set up right now)
-- Mini.surround: can I make this better?
-- Move Nvim-Cmp keymaps to keys.lua
