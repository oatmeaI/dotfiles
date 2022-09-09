" ---------- General Settings
set termguicolors
set laststatus=3
set backspace=indent,eol,start
set ruler
set number
set incsearch
set expandtab                                           " Use spaces for tabs
set tabstop=4                                           " Tabs are 4 spaces
set softtabstop=4                                       " More tabs = 4 spaces config
set updatetime=500
set shiftwidth=4                                        " Ditto
set foldmethod=expr                                     " Use treesitter for code folding
"set relativenumber
set foldexpr=nvim_treesitter#foldexpr()
set cursorline
set modifiable
set noshowmode
set fillchars=eob:\ 
set mouse=a
set hidden
set nofoldenable
syntax on
set background=dark
hi clear SignColumn
set noic
set ignorecase
set splitright
set noswapfile
set undofile
let g:netrw_liststyle=3

colorscheme base16-snazzy

" Make the split borders less obtrusive
exec 'hi VertSplit guifg=' . synIDattr(hlID('TabLineFill'),'bg')
exec 'hi VertSplit guibg=' . synIDattr(hlID('TabLineFill'),'bg')

" Make all the floating windows look the same
hi! link FloatBorder TelescopeBorder
hi! link NormalFloat TelescopeNormal
hi! link FloatermBorder TelescopeBorder
hi! link Floaterm TelescopeNormal

" ---------- Autocommands
" Refresh syntax highlighting on buffer enter (it gets stuck sometimes)
" autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
" autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

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

" ---------- Git Blame config
let g:gitblame_message_template = '<author>, <date>'
let g:gitblame_display_virtual_text = 0
let g:gitblame_date_format = '%r'

lua require('plugins')
source ~/.config/nvim/keys.vim
