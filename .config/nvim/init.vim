"
" Leo's vimrc
"
" (c) 2021 Leo Fahrbach


" ==============================
"           General
" ==============================

syntax on
set relativenumber
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
set list
set listchars=tab:\|->,trail:·
set nowrap
set scrolloff=8
set sidescrolloff=8
"set mouse=a
set endofline


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

" use w!! to save files with sudo
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" control-backspace and control-delete for backward and forward word removal
imap <C-BS> <C-w>
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>


" ==============================
"       Plugin loading
" ==============================

" Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugins')

source ~/.config/nvim/plugins/nerdtree.vim
source ~/.config/nvim/plugins/nvim-lspconfig.vim

call plug#end()

" call back functions to setup plugins after plug#end()
doautocmd User PlugLoaded

