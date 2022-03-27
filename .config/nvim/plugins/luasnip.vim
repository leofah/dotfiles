Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'

function LuaSnipSetup()

lua <<EOF
  require('luasnip')
  require('luasnip.loaders.from_vscode').lazy_load()
EOF

endfunction

augroup LuaSnipSetup
    autocmd!
    autocmd User PlugLoaded call LuaSnipSetup()
augroup end
