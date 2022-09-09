local nvim_lsp = require('lspconfig')
local coq = require "coq"
local lsp = vim.lsp
local handlers = lsp.handlers
local filetypes = {
    "*.ts",
    "*.tsx",
    "*.js",
    "*.jsx"
}
local pop_opts = { border = "rounded", max_width = 120 }
handlers["textDocument/hover"] = lsp.with(handlers.hover, pop_opts)
 
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = 'always',
    max_width = 240,
    header = '',
    prefix = '',
  },
})

 
nvim_lsp.tsserver.setup (coq.lsp_ensure_capabilities({
    init_options = {
        preferences = {
			importModuleSpecifierPreference = "relative",
		}
    },
    on_attach = function(client)
        require("aerial").on_attach(client, bufnr)
    end,
}))
