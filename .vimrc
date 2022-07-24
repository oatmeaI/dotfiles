set termguicolors
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch
set expandtab                                           " Use spaces for tabs
set tabstop=4                                           " Tabs are 4 spaces
set softtabstop=4                                       " More tabs = 4 spaces config
set shiftwidth=4                                        " Ditto
set mouse=a
set foldmethod=syntax
set cursorline
set modifiable
set noshowmode
set hidden
set nofoldenable
syntax on
set background=dark
hi clear SignColumn

noremap <silent><Tab> <C-w><C-w>|                       " Cycle focused pane
nnoremap <silent><space>; :noh<CR>|                     " Get rid of find highlighting
vnoremap <silent><space>yy "*y|                         " Copy to system clipboard
vnoremap <silent><space>pp "*p|                         " Paste from system clipboard
nnoremap <silent><space>k :w<CR>|                       " Save
nnoremap <silent><space>q :Bdelete<CR>|                 " Close buffer
nnoremap <silent><space>p o<esc>p|                      " Shortcut to paste something on a new line
nnoremap <silent><space>dd "_dd|                        " Shortcut to delete without yanking
imap jj <esc>|                                          " Quick exit from insert mode

