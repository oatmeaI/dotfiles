local nvim_lsp = require('lspconfig')
local lsp = vim.lsp
local filetypes = {
    "*.ts",
    "*.tsx",
    "*.js",
    "*.jsx"
}
local pop_opts = { border = "rounded", max_width = 120 }

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


nvim_lsp.tsserver.setup ({
    init_options = {
        preferences = {
			importModuleSpecifierPreference = "relative",
		}
    },
    on_attach = function(client)
        -- require("aerial").on_attach(client, bufnr)
    end,
})
