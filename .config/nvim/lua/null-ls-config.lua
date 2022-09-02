local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

require("null-ls").setup({
    should_attach = function(bufnr)
        return not vim.api.nvim_buf_get_name(bufnr):match("NvimTree")
    end,
    sources = {
        require("null-ls").builtins.code_actions.eslint_d,
        require("null-ls").builtins.formatting.prettier,
        require("null-ls").builtins.completion.spell,
    },
})
