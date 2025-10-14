-- TODO: enable this vim.oion once it's available in neovim
-- vim.o.pumborder = "rounded"

-- stylua: ignore start
vim.g.mapleader         = " "           -- Use <space> as leader key
vim.o.shell             = "fish"        -- use fish
vim.o.tabstop           = 4             -- 1 tab (\t) = 4 spaces
vim.o.softtabstop       = 4             -- 1 tab keypress = 4 spaces
vim.o.shiftwidth        = 4             -- 1 indent = 4 spaces
vim.o.sidescrolloff     = 0             -- Don't scroll sideways
vim.o.timeoutlen        = 250           -- Quicker timeout for which-key etc
vim.o.updatetime        = 250           -- Quicker timeout during key combos etc
vim.o.showtabline       = 2             -- Always show the tabline
vim.o.foldmethod        = "expr"        -- This + line below: use Treesitter for folding
vim.o.foldexpr          = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldlevel         = 999           -- Folds start open
vim.o.winborder         = "rounded"     -- Rounded borders everywhere
vim.o.switchbuf         = 'usetab'      -- Use already open buffers when switching
vim.o.undofile          = true          -- Persisent undo
vim.o.mouse             = 'a'           -- Enable mouse
vim.o.number            = true          -- Show line numbers
vim.o.relativenumber    = true          -- Show relative line numbers. Because `number` is enabled above, we will get "hybrid" numbers
vim.o.wrap              = true          -- Wrap long lines by default

-- From here on is lifted from MiniMax
vim.o.breakindent       = true          -- Indent wrapped lines to match line start
vim.o.breakindentopt    = 'list:-1'     -- Add padding for lists (if 'wrap' is set)
vim.o.cursorline        = true          -- Enable current line highlighting
vim.o.linebreak         = true          -- Wrap lines at 'breakat' (if 'wrap' is set)
vim.o.list              = true          -- Show helpful text indicators
vim.o.pumheight         = 10            -- Make popup menu smaller
vim.o.ruler             = false         -- Don't show cursor coordinates
vim.o.shortmess         = 'CFOSWaco'    -- Disable some built-in completion messages
vim.o.showmode          = false         -- Don't show mode in command line
vim.o.signcolumn        = 'yes'         -- Always show signcolumn (less flicker)
vim.o.splitbelow        = true          -- Horizontal splits will be below
vim.o.splitkeep         = 'screen'      -- Reduce scroll during window split
vim.o.splitright        = true          -- Vertical splits will be to the right
-- Special UI symbols. More is set via 'mini.basics' later.
vim.o.fillchars         = 'eob: ,fold:╌'
vim.o.listchars         = 'extends:…,nbsp:␣,precedes:…,tab:> '
vim.o.autoindent        = true          -- Use auto indent
vim.o.expandtab         = true          -- Convert tabs to spaces
vim.o.formatoptions     = 'rqnl1j'      -- Improve comment editing
vim.o.ignorecase        = true          -- Ignore case during search
vim.o.incsearch         = true          -- Show search matches while typing
vim.o.infercase         = true          -- Infer case in built-in completion
vim.o.smartcase         = true          -- Respect case if search pattern has upper case
vim.o.smartindent       = true          -- Make indenting smart
vim.o.spelloptions      = 'camel'       -- Treat camelCase word parts as separate words
vim.o.virtualedit       = 'block'       -- Allow going past end of line in blockwise mode
vim.o.iskeyword         = '@,48-57,_,192-255,-' -- Treat dash as `word` textobject part
-- Pattern for a start of numbered list (used in `gw`). This reads as
-- "Start of list item is: at least one special character (digit, -, +, *)
-- possibly followed by punctuation (. or `)`) followed by at least one space".
vim.o.formatlistpat     = [[^\s*[0-9\-\+\*]\+[\.\)]*\s\+]]
-- Built-in completion
vim.o.complete          = '.,w,b,kspell'                  -- Use less sources
vim.o.completeopt       = 'menuone,noselect,fuzzy,nosort' -- Use custom behavior
