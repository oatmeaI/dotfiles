local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.prettierd, -- Prettier
		--null_ls.builtins.diagnostics.eslint_d, -- ESLint
		null_ls.builtins.diagnostics.jsonlint, -- JSON Lint

		null_ls.builtins.diagnostics.markdownlint, -- Markdown linter
		null_ls.builtins.diagnostics.stylelint, -- CSS, etc. linter

		null_ls.builtins.formatting.stylua, -- Lua formatting
		null_ls.builtins.diagnostics.luacheck, -- Lua linting
	},
})
