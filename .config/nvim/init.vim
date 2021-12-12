syntax on


" ==============================
"           General
" ==============================

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

" ==============================
"           KeyMaps
" ==============================

let mapleader = "\<space>"

nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>vr :source ~/.config/nvim/init.vim<cr>

nmap <leader>h :nohlsearch<cr>

" Allow gf to open non-existent files
map gf :edit <cfile><cr>

nmap <leader>x :!rifle %<cr><cr>


" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

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

