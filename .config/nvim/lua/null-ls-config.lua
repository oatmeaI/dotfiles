require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.prettierd,
        require("null-ls").builtins.completion.spell,
    },
})
