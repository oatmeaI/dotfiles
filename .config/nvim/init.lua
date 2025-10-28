-- This file just bootstraps mini.deps & loads the `util` module.
-- Everything else is auto-loaded from the `plugin` directory.
-- Autoloading happens in alphabetical order, which is why some filenames start with a number
require("bootstrap")
require("lib")

---------------------------------------------------
-- Cool stuff for later / maybe
---------------------------------------------------
-- TODO: find & replace solution
-- TODO: mini.diff
-- TODO: create sessions dir if not present
-- LATER: better typing / completing experience in commandline
-- LATER: mini.operators might be useful (sort, eval)
-- LATER: set up DAP?
-- LATER: I don't like the red underline highlight
-- LATER: how to make visual block + shift + I more usable?
-- LATER: organize options.lua into sections
-- LATER: quick / auto way to run MiniDeps.update (`DepsUpdate`)
-- LATER: some way to delete sessions
-- LATER: mini-keymap might be cool
-- LATER: Key hints on textobjects - can't do this with clue, maybe switch to which-key
-- LATER: I'm not even using much of persistence.nvim; maybe just rewrite the whole thing myself

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
