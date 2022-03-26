Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers

let g:airline_powerline_fonts = 1
let g:airline_theme = 'onedark'

"Plug 'bling/vim-bufferline'
"let g:bufferline_echo = 0
"let g:bufferline_fname_mod = ':t'
"autocmd VimEnter *
"  \ let &statusline='%{bufferline#refresh_status()}'
"    \ .bufferline#get_status_string()
