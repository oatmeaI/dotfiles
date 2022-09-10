lua require('impatient')

" ==========General Settings==============================================
set number                                                              " Show line numbers
set termguicolors                                                       " Use gui colors in terminal (ex. guifg instead of ctermfg)
set cursorline                                                          " Highlight the line the cursor is on
set mouse=a                                                             " Turn on mouse integration (tbh I needed for scrolling in Floaterm)
set laststatus=3                                                        " Unified status bar (instead of per window)
set nofoldenable                                                        " Start with folds turned off
set foldmethod=expr                                                     " Use treesitter for code folding
set foldexpr=nvim_treesitter#foldexpr()                                 " Use treesitter for code folding
set ignorecase                                                          " Case insensitive search
set incsearch                                                           " Incremental search
set splitright                                                          " Always split to the right
set noswapfile                                                          " Don't use swapfiles...
set undofile                                                            " ...use undofiles instead (undo history persists across instances)
set expandtab                                                           " Tab => 4Spaces: Use spaces for tabs
set tabstop=4                                                           " Tab => 4Spaces: Tab character (\t) is worth 4 spaces
set softtabstop=4                                                       " Tab => 4Spaces: Tab keypress is worth 4 spaces
set shiftwidth=4                                                        " Tab => 4Spaces: Indentation level is worth 4 spaces
set fillchars=eob:\                                                     " Don't fill line numbers with ~ past the end of the buffer
let g:netrw_liststyle=3                                                 " Use tree style browsing in Netrw
" ========================================================================


" ==========Colors========================================================
colorscheme catppuccin
" exec 'hi VertSplit guifg=' . synIDattr(hlID('TabLineFill'),'bg')|     " Make the split borders less obtrusive
" exec 'hi VertSplit guibg=' . synIDattr(hlID('TabLineFill'),'bg')|       " Make the split borders less obtrusive

hi! link FloatBorder TelescopeBorder                                    " Make all the floating windows look the same
hi! link NormalFloat TelescopeNormal                                    " Make all the floating windows look the same
hi! link FloatermBorder TelescopeBorder                                 " Make all the floating windows look the same
hi! link Floaterm TelescopeNormal                                       " Make all the floating windows look the same
hi! link MiniCursorWord Search                                          " Nicer highlight on cursor word
hi! MiniCursorwordCurrent gui=nocombine guifg=NONE guibg=NONE           " Don't highlight word under cursor
" ========================================================================


" ==========Autocommands==================================================
augroup packer_user_config                                              " Autoreload Packer when config changes
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile|
augroup end

augroup on_save                                                         " Auto trim whitespace, trim final whitespace lines, and format on save
    autocmd BufWritePre * lua MiniTrailspace.trim()
    autocmd BufWritePre * lua MiniTrailspace.trim_last_lines()
    autocmd BufWritePre * lua vim.lsp.buf.formatting()
augroup end
" ========================================================================


" ==========Floaterm config===============================================
let g:floaterm_shell = 'zsh'
let g:floaterm_borderchars='─│─│╭╮╯╰'
" ========================================================================


" ==========Git Blame config==============================================
let g:gitblame_message_template = '<author>, <date>'
let g:gitblame_display_virtual_text = 0
let g:gitblame_date_format = '%r'
" ========================================================================


" ==========Startup=======================================================
lua require('plugins')
source ~/.config/nvim/keys.vim
" ========================================================================
