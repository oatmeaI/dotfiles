local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('packer').startup(function()
    --======================Dependencies===========================
    -- Package management
    -- https://github.com/wbthomason/packer.nvim
    use 'wbthomason/packer.nvim'

    -- General Icons
    -- https://github.com/kyazdani42/nvim-web-devicons
    use 'kyazdani42/nvim-web-devicons'

    -- General Util Library
    -- https://github.com/nvim-lua/plenary.nvim
    use 'nvim-lua/plenary.nvim'

    -- Plugin Caching Etc.
    -- https://github.com/lewis6991/impatient.nvim
    use 'lewis6991/impatient.nvim'
    --=============================================================


    --======================IDE Essentials=========================
    -- Setup native treesitter
    -- https://github.com/nvim-treesitter/nvim-treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function() require('treesitter-config') end
    }

    -- Setup native LSP
    -- https://github.com/neovim/nvim-lspconfig
    use {
        'neovim/nvim-lspconfig',
        config = function() require('lsp-config') end
    }

    -- LSP server for doing formatting & linting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim
    use {
        'jose-elias-alvarez/null-ls.nvim',
        run = 'brew install fsouza/prettierd/prettierd jsonlint && npm install -g eslint_d',
        config = function() require('null-ls-config') end
    }
    --=============================================================



    --======================UI/UX Features & Tweaks ===============
    -- Lots of modules
    -- https://github.com/echasnovski/mini.nvim
    use {
        'echasnovski/mini.nvim',
        branch = 'stable',
        config = function()
            -- TODO - Update cheatsheet
            require('mini.surround').setup()
            require('mini.completion').setup()
            vim.api.nvim_set_keymap('i', '<Tab>',   [[pumvisible() ? "\<C-n>" : "\<Tab>"]],   { noremap = true, expr = true })
            vim.api.nvim_set_keymap('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { noremap = true, expr = true })
            require('mini.jump2d').setup()
            require('mini.cursorword').setup()
            require('mini.pairs').setup()
            require('mini.trailspace').setup()
            require('mini.ai').setup()
            require('mini.bufremove').setup()
            require('mini.fuzzy').setup()
            require('mini.comment').setup()
            require('mini.sessions').setup()
        end
    }

    -- Command palette
    -- https://github.com/nvim-telescope/telescope.nvim
    use {
        'nvim-telescope/telescope.nvim',
        config = function ()
            require('telescope').setup{
                defaults = {
                    generic_sorter = require('mini.fuzzy').get_telescope_sorter,
                    file_ignore_patterns = {"node_modules"}
                },
                pickers = {
                    lsp_references = { initial_mode = "normal" },
                    lsp_definitions = { initial_mode = "normal" },
                    buffers = { initial_mode = "normal" }
                },
            }
            -- require('telescope').load_extension('neoclip')
        end,
    }

    -- Catppuccin Theme for NeoVim
    -- https://github.com/catppuccin/nvim
    use {
        "catppuccin/nvim",
        as = "catppuccin",
        config = function ()
            vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
            require("catppuccin").setup()
        end
    }

    -- Dim unfocused buffers
    -- https://github.com/sunjon/Shade.nvim
    use {
        'sunjon/shade.nvim',
        config = function () require'shade'.setup({
            overlay_opacity = 65,
            opacity_step = 1,
            keys = {
                    brightness_up    = '<C-Up>',
                    brightness_down  = '<C-Down>',
                    toggle           = '<Leader>s',
                }
            })
        end
    }

    -- Autosave
    -- https://github.com/Pocco81/auto-save.nvim
    use {
        "Pocco81/auto-save.nvim",
        config = function() require("auto-save").setup({trigger_events = {"FocusLost"}, write_all_buffers = true}) end
    }

    -- Better QuickFix List
    -- https://gitlab.com/yorickpeterse/nvim-pqf
    use {
        'https://gitlab.com/yorickpeterse/nvim-pqf.git',
        config = function () require('pqf').setup() end
    }

    -- Git Conflict Helper
    -- https://github.com/akinsho/git-conflict.nvim
    use {
        'akinsho/git-conflict.nvim',
        tag = "*",
        config = function() require('git-conflict').setup() end
    }

    -- Color highligher
    -- https://github.com/brenoprata10/nvim-highlight-colors
    use {
        'brenoprata10/nvim-highlight-colors',
        config = function() require('nvim-highlight-colors').setup() end
    }

    -- Project-wide search & replace
    -- https://github.com/nvim-pack/nvim-spectre
    use {
        'windwp/nvim-spectre',
        run = 'brew install gnu-sed'
    }

    -- Better select ui
    -- https://github.com/stevearc/dressing.nvim
    use {
        'stevearc/dressing.nvim',
        config = function() require('dressing').setup() end
    }

    -- Statusline
    -- https://github.com/nvim-lualine/lualine.nvim
    use {
        'nvim-lualine/lualine.nvim',
        config = function() require('lualine-config') end
    }

    -- Symbols outline sidebar
    -- https://github.com/stevearc/aerial.nvim
    use {
        'stevearc/aerial.nvim',
        config = function() require('aerial').setup() end
    }

    -- Stop buffers from loading into Aerial window, etc
    -- https://github.com/stevearc/stickybuf.nvim
    use {
        'stevearc/stickybuf.nvim',
        config = function() require('stickybuf').setup() end
    }

    -- Floating terminal
    -- https://github.com/voldikss/vim-floaterm
    use {
        'voldikss/vim-floaterm',
        cmd = 'FloatermToggle'
    }

    -- Pretty LSP diagnostic display
    -- https://github.com/folke/trouble.nvim
    use {
        'folke/trouble.nvim',
        requires = "kyazdani42/nvim-web-devicons",
        config = function() require("trouble").setup({ height = 5 }) end,
        cmd = "TroubleToggle"
    }

    -- Git Diff / Conflict Viewer & Editor
    -- NOTE: Didn't have trme to learn to use this, but I think when I have a minute, it would be nicer to use than the git conflict plugin I already have. Need to figure out how to show unified diff, mainly.
    -- https://github.com/sindrets/diffview.nvim
    -- use {
    --     'sindrets/diffview.nvim',
    --     requires = 'nvim-lua/plenary.nvim',
    --     config = function ()
    --         require("diffview").setup()
    --     end
    -- }

    -- Indent Guides
    -- https://github.com/lukas-reineke/indent-blankline.nvim
    -- use {
    --     "lukas-reineke/indent-blankline.nvim",
    --     config = function() require("indent_blankline").setup { show_current_context = true } end
    -- }

    -- Commands Cheatsheet
    -- https://github.com/sudormrfbin/cheatsheet.nvim
    -- use {
    --     'sudormrfbin/cheatsheet.nvim',
    --     cmd = 'Cheatsheet'
    -- }

    -- Git blame provider
    -- https://github.com/f-person/git-blame.nvim
    -- use 'f-person/git-blame.nvim'

    -- LSP diagnostic colors for themes that don't have them
    -- https://github.com/folke/lsp-colors.nvim
    -- use 'folke/lsp-colors.nvim'

    -- Register (clipboard) manager
    -- https://github.com/AckslD/nvim-neoclip.lua
    -- use {
    --     'AckslD/nvim-neoclip.lua',
    --     config = function() require('neoclip').setup() end
    -- }

    -- LSP status spinner
    -- https://github.com/j-hui/fidget.nvim
    -- use {
    --     'j-hui/fidget.nvim',
    --     config = function() require('fidget').setup() end
    -- }

    -- Prettier folds
    -- https://github.com/anuvyklack/pretty-fold.nvim
    -- use 'anuvyklack/pretty-fold.nvim'

    -- Preview folds
    -- https://github.com/anuvyklack/fold-preview.nvim
    -- use {
    --     'anuvyklack/fold-preview.nvim',
    --     requires = { 'anuvyklack/keymap-amend.nvim' },
    --     config = function() require('fold-preview').setup({ border = "rounded" }) end
    -- }
    --=============================================================

    if packer_bootstrap then
        require('packer').sync()
    end
end)
