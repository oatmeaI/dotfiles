-- This file just bootstraps mini.deps & loads the `util` module.
-- Everything else is auto-loaded (in alphabetical order) from the `plugin` directory.
require("bootstrap")
require("util")

---------------------------------------------------
-- Cool stuff for later / maybe
-- TODO: show file path somewhere
-- TODO: find & replace solution
-- TODO: don't try to open explorer on files dir if we're on the start screen / other non-file places
-- TODO: I don't like the red underline highlight
-- TODO: something annoying about esc not exiting insert when complete is happening
-- TODO: do I need to do the mini.completion omnifunc thing?
-- TODO: setup neoscroll
--
--
-- TODO: FzfLua colors
-- TODO: when yanking a block and putting it, put it below
-- TODO: replace todo-comment with mini
-- TODO: not sure if the eslint lsp is working
-- TODO: work on mini.clue setup
-- TODO: understand mini.ai better
-- TODO: organize options.lua into sections
-- TODO: clue hints on text objects
-- TODO: mouse scrolling is kinda janky
-- TODO: quick / auto way to run MiniDeps.update
-- TODO: how to make visual block + shift + I more usable?
-- TODO: mini-git
-- TODO: some way to delete sessions from picker
-- TODO: dial.nvim
-- TODO: mini.operators might be useful
-- TODO: mini.surround is probably useful
-- TODO: mini.trailspace is not huge but could be nice
-- TODO: mini.misc.zoom
-- TODO: nvim-treesitter-context
-- TODO: treesitter-textobjects
-- TODO: mini-diff
-- TODO: set up DAP?
-- TODO: what kind of stuff can be done without a plugin?
-- TODO: mini-keymap might be cool
-- TODO: better typing / completing experience in commandline
-- TODO: lots more picker stuff that could be useful:
-- -- -- `colorschemes`, `commands`, `explorer`, `hipatterns`, `keymaps`, `marks`,
-- -- -- `list scope=quickfix|jump|location|change`, `oldfiles`, `options`

-- Detect tabstop and shiftwidth automatically
-- NMAC427/guess-indent.nvim

-- vim api autocomplete etc
-- folke/lazydev.nvim

-- different picker, symbols nav, etc
-- bassamsdata/namu.nvim

-- find & replace
-- thomasschafer/scooter

-- Useful status updates for LSP.
-- j-hui/fidget.nvim
