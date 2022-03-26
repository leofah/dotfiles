Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" git plugin only works if vim is in a working directory of the git repo

nnoremap <expr> <leader>n g:NERDTree.IsOpen() ? ':NERDTreeClose<CR>' : @% == '' ? ':NERDTree<CR>' : ':NERDTreeFind<CR>'
nmap <leader>N :NERDTreeFind<CR>

let g:NERDTreeGitStatusUseNerdFonts = 1
