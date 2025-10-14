-- Formatter plugin. The format_on_save option creates an autocommand.

Pack({
    source = "stevearc/conform.nvim",
    name = "conform",
    setup = true,
    config = {
        formatters_by_ft = {
            typescript = { "prettierd", "prettier", stop_after_first = true },
            typescriptreact = { "prettierd", "prettier", stop_after_first = true },
            javascript = { "prettierd", "prettier", stop_after_first = true },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
        },
    },
})
