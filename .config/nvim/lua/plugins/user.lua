return {

    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                vtsls = {
                    settings = {
                        typescript = {
                            preferences = {
                                includeCompletionsForModuleExports = true,
                                includeCompletionsForImportStatements = true,
                                importModuleSpecifier = "relative",
                            },
                        },
                    },
                },
            },
        },
    },
    {
        "folke/snacks.nvim",
        lazy = false,
        opts = {
            styles = {
                terminal = {
                    keys = {
                        q = "hide",
                        gf = function(self)
                            local f = vim.fn.findfile(vim.fn.expand("<cfile>"), "**")
                            if f == "" then
                                Snacks.notify.warn("No file under cursor")
                            else
                                self:hide()
                                vim.schedule(function()
                                    vim.cmd("e " .. f)
                                end)
                            end
                        end,
                        term_normal = {
                            "<esc>",
                            function(self)
                                vim.cmd("stopinsert")
                            end,
                            mode = "t",
                            expr = true,
                            desc = "Double escape to normal mode",
                        },
                    },
                },
            },
        },
    },
    {
        "akinsho/bufferline.nvim",
        enabled = false,
    },
    {
        "chrisgrieser/nvim-early-retirement",
        config = true,
        event = "VeryLazy",
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            incremental_selection = {
                keymaps = {
                    init_selection = "\\",
                    node_incremental = "\\",
                },
            },
        },
    },
    {
        "folke/flash.nvim",
        continue = false,
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            inlay_hints = { enabled = false },
            codelens = { enabled = true },
            diagnostics = { virtual_text = false },
        },
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "catppuccin-macchiato",
        },
    },
    { "0xstepit/flow.nvim" },
    { "rose-pine/neovim" },
    {
        "folke/which-key.nvim",
        opts = {
            preset = "modern",
        },
    },
    {
        "nvim-lualine/lualine.nvim",
        opts = {
            options = {
                globalstatus = true,
            },
            tabline = {
                lualine_a = { "filename" },
                lualine_b = { "diagnostics", { sources = { "nvim_lsp" } } },
                lualine_y = { "tabs" },
                lualine_z = { "branch" },
            },
        },
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        keys = {
            { "<leader>e", false },
        },
        opts = {
            window = {
                mappings = {
                    ["-"] = "navigate_up",
                },
            },
            filesystem = {
                hijack_netrw_behavior = "open_current",
                filtered_items = {
                    visible = true,
                },
            },
        },
    },
    {
        "Julian/vim-textobj-variable-segment",
        dependencies = { "kana/vim-textobj-user" },
    },
    { "willothy/flatten.nvim", config = true, lazy = false, priority = 1001 },
    {
        "linux-cultist/venv-selector.nvim",
        dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
        opts = {
            -- Your options go here
            -- name = "venv",
            -- auto_refresh = false
        },
        event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
        keys = {
            -- Keymap to open VenvSelector to pick a venv.
            { "<leader>vs", "<cmd>VenvSelect<cr>" },
            -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
            { "<leader>vc", "<cmd>VenvSelectCached<cr>" },
        },
    },
}
