" vim custom commands

" commands {{
command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 OR     :call CocAction('runCommand', 'editor.action.organizeImport')
command! -nargs=? Fold   :call CocAction('fold', <f-args>)

command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--border=sharp', '--preview-window=right:sharp:nowrap', '--info=inline']}), <bang>0)
" }}

" variables {{
" fzf
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_colors =
    \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Label'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Label'],
      \ 'info':    ['fg', 'NonText'],
      \ 'gutter':  ['bg', 'Normal'],
      \ 'border':  ['fg', 'Normal'],
      \ 'prompt':  ['fg', 'NonText'],
      \ 'pointer': ['fg', 'NonText'],
      \ 'marker':  ['fg', 'NonText'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }
" }}

" vim: set sw=2 ts=2 sts=2 et tw=78 fmr={{,}} fdm=marker fdl=0:
