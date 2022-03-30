" Comment one or multiple lines with keys <gcc> or <gbc>
" Integrates with treesitter to determine the langue (eg. the lua in this vim file)

Plug 'numToStr/Comment.nvim'
Plug 'JoosepAlviste/nvim-ts-context-commentstring' " enable treesitter support for more languages like jsx,...

function CommentSetup()
lua << EOF
require('Comment').setup {
  -- hook to integrate nvim-ts-context-commentstring
  pre_hook = function(ctx)
    local U = require('Comment.utils')

    local location = nil
    if ctx.ctype == U.ctype.block then
      location = require('ts_context_commentstring.utils').get_cursor_location()
    elseif ctx.motion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
      location = require('ts_context_commentstring.utils').get_visual_start_location()
    end

    return require('ts_context_commentstring.internal').calculate_commentstring {
      key = ctx.ctype == U.ctype.line and '__default' or '__multiline',
      location = location,
    }
  end,

  -- go to next line after one line comment
  post_hook = function(ctx)
    -- TODO: dont update the postion after <gc{o,O,A}>
    -- start and end row are the same -> only one line
    if ctx.range.srow == ctx.range.erow then
      local erow = ctx.range.erow + 1
      vim.api.nvim_win_set_cursor(0, { erow, ctx.range.ecol })
    end
  end,
}
EOF
endfunction

augroup CommentSetup
    autocmd!
    autocmd User PlugLoaded call CommentSetup()
augroup end
