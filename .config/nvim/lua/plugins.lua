local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('packer').startup(function()
    -- Package management
    -- https://github.com/wbthomason/packer.nvim
    use 'wbthomason/packer.nvim'

    -- General Icons
    -- https://github.com/mg979/vim-visual-multi
    use 'kyazdani42/nvim-web-devicons'

    -- Base16 Theme Framework
    -- https://github.com/rrethy/nvim-base16
    use 'rrethy/nvim-base16'

    -- General Util Library
    -- https://github.com/nvim-lua/plenary.nvim
    use 'nvim-lua/plenary.nvim'

    -- Lots of modules
    -- https://github.com/echasnovski/mini.nvim
    use {
        'echasnovski/mini.nvim',
        branch = 'stable',
        config = function()
            require('mini.surround').setup()
            require('mini.completion').setup()
        end
    }

    -- Autosave
    -- https://github.com/Pocco81/auto-save.nvim
    use {
	    "Pocco81/auto-save.nvim",
	    config = function()
	    	 require("auto-save").setup()
	    end
    }

    use {
        'akinsho/git-conflict.nvim',
        tag = "*",
        config = function()
            require('git-conflict').setup()
        end
    }

    --  Treesitter-based Syntax Text Objects
    --  https://github.com/RRethy/nvim-treesitter-textsubjects
    use {
        'RRethy/nvim-treesitter-textsubjects',
        config = function()
            require('nvim-treesitter.configs').setup {
                textsubjects = {
                    enable = true,
                    prev_selection = ',', -- (Optional) keymap to select the previous selection
                    keymaps = {
                        ['.'] = 'textsubjects-smart',
                        [';'] = 'textsubjects-container-outer',
                        ['i;'] = 'textsubjects-container-inner',
                    },
                },
            }
        end
    }

    -- Color highligher
    -- https://github.com/brenoprata10/nvim-highlight-colors
    use {
        'brenoprata10/nvim-highlight-colors',
        config = function() require('nvim-highlight-colors').setup {} end
    }

    -- Trailing whitespace manager
    -- https://github.com/zakharykaplan/nvim-retrail
    use {
        "zakharykaplan/nvim-retrail",
        config = function()
            require("retrail").setup({
                filetype = {
                    exclude = {"vim", "aerial"}
                },
                trim = {
                    whitespace = false,
                    blanklines = false,
                }
            })
        end
    }

    -- Indent Guides
    -- https://github.com/lukas-reineke/indent-blankline.nvim
    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup {
                show_current_context = true,
            }
        end
    }

    -- Commands Cheatsheet
    -- https://github.com/sudormrfbin/cheatsheet.nvim
    use {
        'sudormrfbin/cheatsheet.nvim',
        cmd = 'Cheatsheet'
    }

    -- Close buffers without closing windows
    -- https://github.com/famiu/bufdelete.nvim
    use 'famiu/bufdelete.nvim'

    -- Completion plugin + precompiled artifacts
    -- https://github.com/ms-jpq/coq_nvim
    -- use {
    --     'ms-jpq/coq_nvim',
    --     branch = 'coq',
    --     config = function()
    --         vim.cmd([[ino <silent><expr> <space>    pumvisible() ? (complete_info().selected == -1 ? "\<C-e><space>" : "\<C-y><space>") : "\<space>"]])
    --     end
    -- }
    -- use { 'ms-jpq/coq.artifacts', branch = 'artifacts'}

    -- Quick buffer navigation
    -- https://github.com/ggandor/leap.nvim
    use {
        'ggandor/leap.nvim',
        config = function() require('leap').set_default_keymaps() end
    }

    -- Symbols outline sidebar
    -- https://github.com/stevearc/aerial.nvim
    use {
        'stevearc/aerial.nvim',
        config = function() require('aerial').setup() end,
    }

    -- NNN Picker & Sidebar (deciding if it's nicer than Netrw)
    -- https://github.com/luukvbaal/nnn.nvim
    use {
        "luukvbaal/nnn.nvim",
        config = function() require("nnn").setup() end
    }

    -- Git blame provider
    -- https://github.com/f-person/git-blame.nvim
    use 'f-person/git-blame.nvim'

    -- Statusline
    -- https://github.com/nvim-lualine/lualine.nvim
    use {
        'nvim-lualine/lualine.nvim',
        config = function() require('lualine-config') end
    }

    -- Command palette
    -- https://github.com/nvim-telescope/telescope.nvim
    use {
        'nvim-telescope/telescope.nvim',
        config = function ()
            require('telescope').setup{ pickers = { lsp_references = { initial_mode = "normal" }, lsp_definitions = { initial_mode = "normal" }, buffers = { initial_mode = "normal" } }, defaults = { file_ignore_patterns = {"node_modules"} } }
            require('telescope').load_extension('fzf')
            require('telescope').load_extension('neoclip')
        end,
    }

    -- Sorting plugin for Telescope
    -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
    }

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

    -- Pretty notifications
    -- https://github.com/rcarriga/nvim-notify
    use 'rcarriga/nvim-notify'

    -- Speed up plugin loading
    -- https://github.com/lewis6991/impatient.nvim
    use 'lewis6991/impatient.nvim'

    -- Prettier select UI
    -- https://github.com/stevearc/dressing.nvim
    use 'stevearc/dressing.nvim'

    -- LSP server for doing formatting & linting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim
    use {
        'jose-elias-alvarez/null-ls.nvim',
        run = 'brew install fsouza/prettierd/prettierd',
        config = function() require('null-ls-config') end
    }

     -- Pretty LSP diagnostic display
    -- https://github.com/folke/trouble.nvim
    use {
        'folke/trouble.nvim',
        requires = "kyazdani42/nvim-web-devicons",
        config = function() require("trouble").setup({ height = 5 }) end
    }

    -- LSP diagnostic colors for themes that don't have them
    -- https://github.com/folke/lsp-colors.nvim
    use 'folke/lsp-colors.nvim'

    -- Floating terminal
    -- https://github.com/voldikss/vim-floaterm
    use {
        'voldikss/vim-floaterm',
        cmd = 'FloatermToggle'
    }

    -- Register (clipboard) manager
    -- https://github.com/AckslD/nvim-neoclip.lua
    use {
        'AckslD/nvim-neoclip.lua',
        config = function() require('neoclip').setup() end
    }

    -- LSP status spinner
    -- https://github.com/j-hui/fidget.nvim
    use {
        'j-hui/fidget.nvim',
        config = function() require('fidget').setup() end
    }

    -- Prettier folds
    -- https://github.com/anuvyklack/pretty-fold.nvim
    use 'anuvyklack/pretty-fold.nvim'

    -- Preview folds
    -- https://github.com/anuvyklack/fold-preview.nvim
    use {
        'anuvyklack/fold-preview.nvim',
        requires = { 'anuvyklack/keymap-amend.nvim' },
        config = function() require('fold-preview-config') end
    }

    -- Project-wide search & replace
    -- https://github.com/nvim-pack/nvim-spectre
    use {
        'windwp/nvim-spectre',
        run = 'brew install gnu-sed'
    }

    -- Markdown preview
    -- https://github.com/ellisonleao/glow.nvim
    use {
        'ellisonleao/glow.nvim',
        cmd = 'Glow'
    }

    -- Code minimap
    -- https://github.com/wfxr/minimap.vim
    use {
        'wfxr/minimap.vim',
        run = 'brew install code-minimap'
    }

    -- Smart pairs in TSX
    -- https://github.com/windwp/nvim-ts-autotag
    use {
        'windwp/nvim-ts-autotag',
        config = function() require('nvim-ts-autotag').setup() end
    }

    ---- Disabled ----
    -- Tabline
    -- https://github.com/noib3/nvim-cokeline
    -- use {
    --     'noib3/nvim-cokeline',
    --     config = function() require('cokeline-config') end
    -- }

   -- Disabling because I never use it
    -- Start page
    -- https://github.com/goolord/alpha-nvim
    -- use {
    --     'goolord/alpha-nvim',
    --     config = function() require('alpha-config') end
    -- }

    -- Disabling because I don't use it
    -- Session manager
    -- https://github.com/Shatur/neovim-session-manager
    -- use {
    --     'Shatur/neovim-session-manager',
    --     config = function() require('sessions-config') end
    -- }

   -- Disabling in order to train myself to get better with macros
    -- Sublime-esque multi-cursor
    -- https://github.com/mg979/vim-visual-multi
    -- use {
    --     'mg979/vim-visual-multi',
    --     branch = 'master'
    -- }

    -- File browser sidebar
    -- https://github.com/kyazdani42/nvim-tree.lua
    -- use {
    --     'kyazdani42/nvim-tree.lua',
    --     config = function() require('nvim-tree-config') end
    -- }

    -- Disabling because I don't use it
    -- Fancy marks for navigation etc
    -- https://github.com/ThePrimeagen/harpoon
    -- use {
    --     'ThePrimeagen/harpoon',
    -- }

    if packer_bootstrap then
        require('packer').sync()
    end
end)
