-- This file just bootstraps mini.deps & loads the `util` module.
-- Everything else is auto-loaded (in alphabetical order) from the `plugin` directory.
require("bootstrap")
require("util")

---------------------------------------------------
-- Cool stuff for later / maybe
-- TODO: reconsider mini.basics (lots of stuff is done in options.lua now)
-- TODO: look through minimax for other good keymaps
-- TODO: find & replace solution
-- TODO: don't try to open explorer on files dir if we're on the start screen / other non-file places
-- TODO: not sure if the eslint lsp is working
-- TODO: scrolling is kinda janky
-- TODO: quick / auto way to run MiniDeps.update
-- TODO: how to make visual block + shift + I more usable?
-- TODO: MiniGit
-- TODO: some way to delete sessions from picker
-- TODO: dial.nvim
-- TODO: minimisc.zoom
-- TODO: nvim-treesitter-context - yes
-- TODO: replace miniclue with which-key?
-- TODO: mini-diff?
-- TODO: mini-keymap might be cool
-- TODO: lots more picker stuff that could be useful
