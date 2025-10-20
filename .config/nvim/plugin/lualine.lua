-- Handles the statusline, bufferline and tabline.

Pack({
    source = "nvim-lualine/lualine.nvim",
    name = "lualine",
    setup = true,
    config = {
        options = {
            globalstatus = true,
        },
        tabline = {
            lualine_a = { { "filename" } },
            lualine_b = { "diagnostics", { sources = { "nvim_lsp" } } },
            lualine_y = { "tabs" },
            lualine_z = {},
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { { "filename", path = 1 } },
            lualine_c = {},
            lualine_x = { "branch" },
            lualine_y = { "filetype" },
            lualine_z = {},
        },
    },
})
