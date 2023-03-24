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

local capabilities = require("cmp_nvim_lsp").default_capabilities()

nvim_lsp.eslint.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = true
	end,
})

nvim_lsp["jsonls"].setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = false -- Don't use TS server to format, since we will use null_ls
	end,
})

-- TODO: LSP completion will only work for typescript & lua right now
nvim_lsp.tsserver.setup({
	capabilities = capabilities,
	init_options = {
		preferences = {
			importModuleSpecifierPreference = "relative",
		},
	},
	on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = false -- Don't use TS server to format, since we will use null_ls
	end,
})

nvim_lsp.lua_ls.setup({
	capabilities = capabilities,
	on_attach = function(client)
		client.server_capabilities.documentFormattingProvider = false -- Don't use TS server to format, since we will use null_ls
	end,
})
