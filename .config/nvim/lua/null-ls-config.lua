require("null-ls").setup({
    sources = {
        require("null-ls").builtins.code_actions.eslint_d,
        require("null-ls").builtins.formatting.prettierd,
        require("null-ls").builtins.completion.spell,
    },
})
