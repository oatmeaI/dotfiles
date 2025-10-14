-- A nice colorscheme

Pack({
    source = "catppuccin/nvim",
    name = "catppuccin",
    callback = function()
        vim.cmd.colorscheme("catppuccin-macchiato")
    end,
})
