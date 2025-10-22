local now, later = MiniDeps.now, MiniDeps.later

-- stylua: ignore start
now(function() require("mini.icons").setup() end)
now(function() require("mini.notify").setup() end)

later(function() require("mini.extra").setup() end)
later(function() require("mini.surround").setup() end)
later(function() require("mini.ai").setup() end)
later(function() require("mini.misc").setup() end)

later(MiniIcons.mock_nvim_web_devicons)
later(MiniIcons.tweak_lsp_kind)
