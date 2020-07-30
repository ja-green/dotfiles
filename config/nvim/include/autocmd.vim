" vim autocmds and matches

" highlight {{
hi ExtraWhitespace guifg=#dadada guibg=#966575 guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
" }}

" autocmd {{
" tagbar
autocmd VimEnter    * nested :TagbarOpen

" match unwanted whitespace characters
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
" }}

" match {{
match ExtraWhitespace /\s\+$/
" }}

" vim: set sw=2 ts=2 sts=2 et tw=78 fmr={{,}} fdm=marker fdl=0:
