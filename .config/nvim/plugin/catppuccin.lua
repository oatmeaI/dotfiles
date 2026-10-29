-- A nice colorscheme

Pack({
    source = "catppuccin/nvim",
    name = "catppuccin",
    setup = true,
    config = {
        transparent_background = true,
        float = {
            transparent = true, -- enable transparent floating windows
            solid = true, -- use solid styling for floating windows, see |winborder|
        },
        integrations = {
            fzf = true,
            mini = {
                enabled = true,
            },
        },
    },
    callback = function()
        vim.cmd.colorscheme("catppuccin-macchiato")
    end,
})
