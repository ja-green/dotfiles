" vim custom commands

" commands {{
command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 OR     :call CocAction('runCommand', 'editor.action.organizeImport')
command! -nargs=? Fold   :call CocAction('fold', <f-args>)
" }}

" vim: set sw=2 ts=2 sts=2 et tw=78 fmr={{,}} fdm=marker fdl=0:
