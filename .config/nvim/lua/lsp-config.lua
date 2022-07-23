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
        client.resolved_capabilities.document_formatting = false
        require("aerial").on_attach(client, bufnr)
        if client.resolved_capabilities.document_highlight then
            vim.cmd [[
                hi! LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
                hi! LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
                hi! LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
            ]]
            vim.api.nvim_create_augroup('lsp_document_highlight', {
              clear = false
            }) 
            vim.api.nvim_clear_autocmds({
              buffer = bufnr,
              group = 'lsp_document_highlight',
            }) 
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              group = 'lsp_document_highlight',
              pattern = filetypes,
              buffer = bufnr,
              callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd('CursorMoved', {
              group = 'lsp_document_highlight',
              buffer = bufnr,
              pattern = filetypes,
              callback = vim.lsp.buf.clear_references,
            })
        end
    end,
}))
