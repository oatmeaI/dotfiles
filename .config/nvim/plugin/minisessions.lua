-- Session persistence and loading.
-- Note that there's an autocommand set up in autocmds.lua to write the session on quit

require("mini.sessions").setup({
    autoread = true,
    autowrite = true,
})
