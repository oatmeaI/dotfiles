-- Session handling. Persistence.nvim automatically saves sessions; I have an autocommand that
-- autoloads the session for the current directory if present

Pack({ source = "folke/persistence.nvim", setup = true })
