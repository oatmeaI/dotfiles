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
" ========================================================================


" ==========Autocommands==================================================
augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile|      " Autoreload Packer when config changes
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


" ========== Disabled = check back later and delete if I don't miss them
" set relativenumber                                                     " Not sure I want to keep this one, should also help performance when off
" set updatetime=500                                                     " Not sure what this was for, disabling for now"
" set backspace=indent,eol,start                                         " Not sure what this does, disabling for now
" autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart             " Disable for now = not sure if I need it // Refresh syntax highlighting on buffer enter (it gets stuck sometimes)
" autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear                 " Disable for now = not sure if I need it // Refresh syntax highlighting on buffer enter (it gets stuck sometimes)
" autocmd CursorHold * :lua require('fold=preview').show_preview()|     " Disable for now = not sure if I like it // Show fold preview on hover
" hi clear SignColumn                                                    " Not sure what this is for, disable for now
