local files = require("mini.files")
local config = files.config
config.mappings.close = "<esc>"
config.mappings.go_in_plus = "<cr>"
require("mini.files").setup(config)
