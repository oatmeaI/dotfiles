-- Formatter plugin. The format_on_save option creates an autocommand.

Pack({
    source = "stevearc/conform.nvim",
    name = "conform",
    setup = true,
    config = {
        formatters_by_ft = {
            typescript = { "eslint_d", "prettier", stop_after_first = true },
            typescriptreact = { "eslint_d", "prettier", stop_after_first = true },
            javascript = { "eslint_d", "prettier", stop_after_first = true },
            lua = { "stylua", stop_after_first = true },
        },
        format_on_save = {
            timeout_ms = 5000,
            lsp_format = "fallback",
        },
    },
})
