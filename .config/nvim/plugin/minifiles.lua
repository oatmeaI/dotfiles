local files = require("mini.files")
local config = files.config
config.mappings.close = "<esc>"
config.mappings.go_in_plus = "<cr>"
-- config.windows.preview = true
-- config.windows.width_preview = 50
require("mini.files").setup(config)
