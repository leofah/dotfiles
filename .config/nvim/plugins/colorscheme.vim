Plug 'LunarVim/Colorschemes'

" good lunar vim schemes
" all lunar schemes (and no others) work nice with gitsigns
let g:theme_name = 'system76'
" let g:theme_name = 'aurora'
" let g:theme_name = 'codemonkey'
" let g:theme_name = 'darkplus'
" let g:theme_name = 'lunar'
" let g:theme_name = 'onedarker'
" let g:theme_name = 'system76'

let g:transparent_background  = 'true'       " transparent background(Default: false)
let g:italic_comments = 'true'               " italic comments(Default: true)
let g:italic_keywords = 'true'               " italic keywords(Default: true)
let g:italic_functions = 'true'              " italic functions(Default: false)
let g:italic_variables = 'true'              " italic variables(Default: false)

set termguicolors

" somehow cant unset the color of the SignColumn
highlight SignColumn guibg=0

autocmd User PlugLoaded exec 'colorscheme '. g:theme_name
