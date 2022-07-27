source ~/.config/nvim/keys.vim

lua require('impatient')
lua require('plugins')

" ---------- General Settings
set termguicolors
set backspace=indent,eol,start
set ruler
set number
set incsearch
set expandtab                                           " Use spaces for tabs
set tabstop=4                                           " Tabs are 4 spaces
set softtabstop=4                                       " More tabs = 4 spaces config
set updatetime=500
set shiftwidth=4                                        " Ditto
set mouse=a
set foldmethod=expr                                     " Use treesitter for code folding
set relativenumber
set foldexpr=nvim_treesitter#foldexpr()
set cursorline
set modifiable
set noshowmode
set hidden
set nofoldenable
syntax on
" colorscheme sonokai                                     " So far this theme seems to have the best highlighting for Typescript
set background=dark
hi clear SignColumn
hi FloatBorder guifg=#646e82
hi NormalFloat guibg=clear
hi! link VertSplit Comment
set noic

" ---------- Autocommands
" Refresh syntax highlighting on buffer enter (it gets stuck sometimes)
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart 
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" Show fold preview on hover
autocmd CursorHold * :lua require('fold-preview').show_preview()

" Autoreload Packer when config changes
augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end

" ---------- Floaterm config
let g:floaterm_shell = 'zsh'
let g:floaterm_borderchars='─│─│╭╮╯╰'
hi FloatermBorder guibg=clear guifg=#646e82

" ---------- Git Blame config
let g:gitblame_message_template = '<author>, <date>'
let g:gitblame_display_virtual_text = 0
let g:gitblame_date_format = '%r'

" ---------- COQ config
let g:coq_settings = { 'auto_start': 'shut-up' } " In lua file??

" ---------- Minimap config
let g:minimap_auto_start = 0
let g:minimap_highlight_range = 1
let g:minimap_highlight_search = 1

" This doesn't seem to be working for some reason
set splitright

