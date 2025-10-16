local vim = vim

-- TODO: enable this vim.oion once it's available in neovim
-- vim.o.pumborder = "rounded"

-- stylua: ignore start
vim.cmd("filetype plugin indent on")                -- Enable filetype detection + filetype specific plugins + filetype specific indentation.
vim.cmd("packadd nohlsearch")                       -- Plugin that automatically turns off hlsearch (highlighting last search term) after `updatetime`

vim.g.mapleader         = " "                       -- Use <space> as leader key
vim.o.shell             = "fish"                    -- use fish
vim.o.tabstop           = 4                         -- 1 tab (\t) = 4 spaces
vim.o.softtabstop       = 4                         -- 1 tab keypress = 4 spaces
vim.o.shiftwidth        = 4                         -- 1 indent = 4 spaces
vim.o.expandtab         = true                      -- Convert tabs to spaces
vim.o.wrap              = false                     -- Don't wrap long lines
vim.o.sidescrolloff     = 10                        -- Keeps the cursor near the horizontal center of the screen on long lines
vim.o.scrolloff         = 999                       -- Keeps the cursor from hitting the bottom or top of the screen
vim.o.timeoutlen        = 250                       -- Quicker timeout for key combos
vim.o.updatetime        = 250                       -- Quicker timeout for everything else (ie. hlsearch getting turned off)
vim.o.showtabline       = 2                         -- Always show the tabline
vim.o.confirm           = true                      -- Show confirmation dialog instead of failing if (for example) `q` is run with unsaved files.
vim.o.foldmethod        = "expr"                    -- This + line below: use Treesitter for folding
vim.o.foldexpr          = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldlevel         = 999                       -- Folds start open
vim.o.winborder         = "rounded"                 -- Rounded borders everywhere
vim.o.switchbuf         = 'usetab'                  -- Use already open buffers when switching
vim.o.undofile          = true                      -- Persisent undo history across sessions
vim.o.mouse             = 'a'                       -- Enable mouse in all modes
vim.o.number            = true                      -- Show line numbers
vim.o.relativenumber    = true                      -- Use relative line numbers. With `number` above, we get "hybrid" numbers
vim.o.formatoptions     = 'tcrqnj'                  -- Improve some editing stuff. See :h fo-table 
vim.o.textwidth         = 90                        -- Set max line width
vim.o.autoindent        = true                      -- When adding a new line, match indent of line above
vim.o.breakindent       = true                      -- Same as above, but for when a line breaks automatically (ie, we're past the `textwidth`)
vim.o.cursorline        = true                      -- Highlight the line the cursor is on
vim.o.virtualedit       = 'block'                   -- Allow going past end of line in Visual block mode
vim.o.pumheight         = 20                        -- Configure popupmenu height - if left unset, it'll take the whole screen
vim.o.pumblend          = 5                         -- Make the popupmenu a little bit transparent
vim.o.winblend          = 5                         -- Make floating windows a little bit transparent
vim.o.shortmess         = 'CFOWaoA'                 -- Disable some built-in messages. See :h shortmess
vim.o.showmode          = false                     -- Don't show mode in command line
vim.o.signcolumn        = 'yes'                     -- Always show signcolumn for less flicker
vim.o.splitbelow        = true                      -- Horizontal splits open below current window
vim.o.splitright        = true                      -- Vertical splits open to the right of current window
vim.o.ignorecase        = true                      -- Ignore case in search string
vim.o.smartcase         = true                      -- Override `ignorecase` if the search string has uppercase characters
vim.o.smartindent       = true                      -- Syntax-aware auto-indentation (ie. for the next line after if () {)
vim.o.incsearch         = true                      -- Show search matches while typing the search pattern
vim.o.infercase         = true                      -- Try to infer case during built-in completion
vim.o.fillchars         = 'eob: '                   -- Special characters; currently just replaces the end of buffer with empty spaces. See :h fillchars for more - might want to add stuff in the future.
vim.o.complete          = '.,w,b,kspell'            -- Sources to use for built-in completion; see :h complete
vim.o.list              = true                      -- Shows text indicators defined below; see :h listchars. For example, '...' when text is truncated.
vim.o.listchars         = 'extends:…,nbsp:␣,precedes:…,tab:> '
vim.o.completeopt       = 'menuone,noselect,fuzzy,nosort'   -- Configure auto-complete behavior; see :h completeopts 
vim.o.formatlistpat     = [[^\s*[0-9\-\+\*]\+[\.\)]*\s\+]]  -- Consider any of digit, -, +, *, maybe followed by punctuation, followed by space, as the start of a list

-- stylua: ignore end
-- Configure LSP diagnostics. Mostly for the icons.
-- I'll probably play around with the other settings a bit.
-- See :h vim.diagnostic.opts
vim.diagnostic.config({
    virtual_text = false,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
        border = "rounded",
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "",
            [vim.diagnostic.severity.INFO] = "",
        },
    },
})
