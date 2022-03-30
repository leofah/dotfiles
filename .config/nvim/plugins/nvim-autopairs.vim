" Automatically close opened brackets
" Integrates with cmp and treesitter

Plug 'windwp/nvim-autopairs'

function AutoPairsSetup()
lua << EOF
-- https://github.com/LunarVim/Neovim-from-scratch/blob/master/lua/user/autopairs.lua
require('nvim-autopairs').setup {
  fast_wrap = {
    map = '<M-e>',
    chars = { '{', '[', '(', '"', "'" },
    pattern = string.gsub([[ [%'%'%)%>%]%)%}%,] ]], '%s+', ''),
    offset = 0, -- Offset from pattern match
    end_key = '$',
    keys = 'qwertyuiopzxcvbnmasdfghjkl',
    check_comma = true,
    highlight = 'PmenuSel',
    highlight_grey = 'LineNr',
  },
  -- ts = treesitter
  check_ts = true,
  ts_config = {
    lua = { 'string', 'source' },
    javascript = { 'string', 'template_string' },
    -- java = false,
  },
}
-- cmp
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
  return
end
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done { map_char = { tex = '' } }) 
EOF

endfunction
augroup AutoPairsSetup
    autocmd!
    autocmd User PlugLoaded call AutoPairsSetup()
augroup end
