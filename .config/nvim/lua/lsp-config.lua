local vim = vim
local nvim_lsp = require("lspconfig")

vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	severity_sort = true,
	float = {
		border = "rounded",
		source = "always",
		max_width = 240,
		header = "",
		prefix = "",
	},
})

nvim_lsp.eslint.setup({})

nvim_lsp.tsserver.setup({
	init_options = {
		preferences = {
			importModuleSpecifierPreference = "relative",
		},
	},
	on_attach = function(client)
		client.server_capabilities.documentFormattingProvider = false -- Don't use TS server to format, since we will use null_ls
	end,
})

nvim_lsp.sumneko_lua.setup({
	on_attach = function(client)
		client.server_capabilities.documentFormattingProvider = false -- Don't use TS server to format, since we will use null_ls
	end,
})
