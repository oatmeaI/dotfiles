" ---------- Raw Keymappings
nnoremap <silent>gd :Telescope lsp_definitions<cr>|                                 " Go to definition
nnoremap <silent>gr :Telescope lsp_references<cr>|                                  " Peek references
nnoremap <silent>qq :Cheatsheet<cr>|                                                " Show cheatsheet
nnoremap <silent>do :lua vim.lsp.buf.code_action()<cr>|                             " Show codeaction dropdown
tnoremap <silent><esc> <cmd>FloatermHide!<cr>|                                      " Close floating terminal (while in terminal mode)
noremap <silent><tab> <c-w><c-w>|                                                   " Cycle focused pane
noremap <silent><s-tab> <c-w><c-h>|                                                 " Cycle focused pane backwards
noremap <silent><s-j> 10j
noremap <silent><s-k> 10k

" ----------- <space> Keymappings
" ----- Home Row (Most Used Shortcuts)
function ToggleExplore()
    if &ft == "netrw"
        if exists("w:netrw_rexlocal")
            Rexplore
        else
            if exists("w:netrw_rexfile")
                exec 'e ' . w:netrw_rexfile
            endif
        endif
    else
        Explore
    endif
endfun
nnoremap <silent><space>a :Telescope neoclip<cr>|                                   " Open palette: list register contents
nnoremap <silent><space>s :Telescope live_grep<cr>|                                 " Open palette: Search code
nnoremap <silent><space>d :AerialToggle<cr>|                                        " Toggle symbols sidebar
nnoremap <silent><space>f :Telescope find_files<cr>|                                " Open palette: Find files
nnoremap <silent><space>j :call ToggleExplore()<cr>|                                " Toggle file explorer
nnoremap <silent><space>h :NnnPicker<cr>|                                           " Launch NNN picker - I might end up deleting this.
nnoremap <silent><space>k :w<cr>|                                                   " Save
nnoremap <silent><space>l :FloatermToggle<cr>|                                      " Open floating terminal
nnoremap <silent><space>; :noh<cr>|                                                 " Get rid of find highlighting
nnoremap <silent><space>g <cmd>lua vim.lsp.buf.formatting()<cr>|                    " Format document   

" ----- Other Handy Shortcuts
vnoremap <silent><space>yy "*y|                                                     " Copy to system clipboard
nnoremap <silent><space>pp "*p|                                                     " Paste from system clipboard
nnoremap <silent><space>o :TroubleToggle document_diagnostics<cr>|                  " Display diagnostics in lower pane
nnoremap <silent><space>r :lua vim.lsp.buf.rename()<cr>|                            " Rename symbol
nnoremap <silent><space>p o<esc>p|                                                  " Shortcut to paste something on a new line
nnoremap <silent><space>xd "_dd|                                                    " Shortcut to delete without yanking
nnoremap <silent><space>rs :so $MYVIMRC<cr>|                                        " Quick reload shortcut
nnoremap <silent><space>q :Bdelete<cr>|                                             " Close buffer
nnoremap <silent><space>w <c-w>q|                                                   " Close window
nnoremap <silent><space><space> :Telescope buffers<cr>|                             " Open palette: open buffers
nnoremap <silent><space>e :MinimapToggle<cr>|                                       " Toggle minimap (for when it gets jacked up)
nnoremap <silent><space>u :lua vim.lsp.buf.hover({focusable = false})<cr>|          " Show hover doc
nnoremap <silent><space>i :lua vim.diagnostic.open_float({focusable = false})<cr>|  " Show hover diagnostic
nnoremap <silent><space>rl :LspRestart<cr>                                          " Restart LSP

"----------- <ctrl> Keymappings
nnoremap <silent><c-f> <cmd>lua require('spectre').open()<cr>|                      " Project wide find & replace

" ---------- COQ Keybindings
ino <silent><expr> <space>    pumvisible() ? (complete_info().selected == -1 ? "\<C-e><space>" : "\<C-y>") : "\<space>"
