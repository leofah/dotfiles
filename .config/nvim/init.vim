"
" Leo's vimrc
"
" (c) 2021 -2022 Leo Fahrbach


" ==============================
"           General
" ==============================

syntax on
scriptencoding utf-8
set encoding=utf-8
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
set mouse=a
set endofline
" set clipboard+=unnamedplus
" Is overwritten by treesitter if used
set foldmethod=indent
set conceallevel=2
set concealcursor=nc
set completeopt=menu,menuone


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

" File Brower + Git
source ~/.config/nvim/plugins/telescope.vim
source ~/.config/nvim/plugins/nerdtree.vim
source ~/.config/nvim/plugins/gitsigns.vim
source ~/.config/nvim/plugins/fugitive.vim

" Look and Feel
source ~/.config/nvim/plugins/vim-airline.vim
source ~/.config/nvim/plugins/vim-devicons.vim
source ~/.config/nvim/plugins/nvim-treesitter.vim
source ~/.config/nvim/plugins/colorscheme.vim
source ~/.config/nvim/plugins/indentLine.vim

" Writing Code
source ~/.config/nvim/plugins/commentary.vim
source ~/.config/nvim/plugins/luasnip.vim
source ~/.config/nvim/plugins/nvim-cmp.vim
source ~/.config/nvim/plugins/nvim-autopairs.vim
" source ~/.config/nvim/plugins/nvim-lspconfig.vim

" Plugins I want to look in to
"source ~/.config/nvim/plugins/python-black.vim
" neoformat
" source ~/.config/nvim/plugins/ycm.vim
" toggleterm

call plug#end()

" callback command to setup plugins after plug#end()
doautocmd User PlugLoaded
