autocmd FileType java setlocal omnifunc=javacomplete#Complete

let g:JavaComplete_AutoStartServer = 1

nnoremap <C-I> <Plug>(JavaComplete-Imports-RemoveUnused)

nnoremap <leader><i><o> <Plug>(JavaComplete-Imports-RemoveUnused)
nnoremap <leader><i><a> <Plug>(JavaComplete-Imports-AddSmart)
nnoremap <leader><i><s> <Plug>(JavaComplete-Imports-AddMissing)
