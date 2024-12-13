"
" Leo's vimrc
"
" (c) 2021 -2024 Leo Fahrbach


" ==============================
"           General
" ==============================

syntax on
scriptencoding utf-8
set nocp
set encoding=utf-8
set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set ignorecase
set smartcase
set hlsearch
set incsearch
set nowrapscan
set list
set listchars=tab:\|->,trail:·
set nowrap
set scrolloff=8
set sidescrolloff=8
set mouse=a
set endofline
set completeopt=menu,menuone
set title


" ==============================
"           KeyMaps
" ==============================

let mapleader = "\<space>"

nmap <leader>ve :edit $MYVIMRC<cr>
nmap <leader>vr :source $MYVIMRC<cr>
"autocmd BufWritePost $MYVIMRC source %

nmap <leader>h :nohlsearch<cr>

" Allow gf to open non-existent files
map gf :edit <cfile><cr>

nmap <leader>x :!rifle %<cr><cr>


" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" use w!! to save files with sudo does not work in nvim
"cnoremap w!! execute 'silent write !sudo tee % >/dev/null' <bar> edit!

" control-backspace and control-delete for backward and forward word removal
imap <C-BS> <C-w>
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <leader>b :bnext<cr>
nnoremap <leader>v :bNext<cr>


