null_ls = require("null-ls")

require("null-ls").setup({
	sources = {
		null_ls.builtins.formatting.prettierd, -- Prettier
		null_ls.builtins.diagnostics.eslint_d, -- ESLint
		null_ls.builtins.diagnostics.jsonlint, -- JSON Lint

		-- null_ls.builtins.diagnostics.write_good,        -- Prose
		null_ls.builtins.completion.spell, -- Spelling
		null_ls.builtins.diagnostics.codespell, -- More spelling

		--null_ls.builtins.diagnostics.markdownlint, -- Markdown linter
		null_ls.builtins.diagnostics.stylelint, -- CSS, etc. linter

		null_ls.builtins.formatting.stylua, -- Lua formatting
		null_ls.builtins.diagnostics.luacheck, -- Lua linting

		null_ls.builtins.formatting.shellharden, -- Shell linting
		null_ls.builtins.diagnostics.zsh, -- ZSH diagnostics

		null_ls.builtins.diagnostics.todo_comments, -- Points out TODO comments
	},
})
