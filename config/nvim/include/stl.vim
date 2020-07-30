" vim statusline

" reset statusline
set statusline=

" highlights {{
hi ModeNormal        guifg=#000000 guibg=#657596 guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi ModeNormalOP      guifg=#dadada guibg=#000000 guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi ModeVisual        guifg=#000000 guibg=#5e8d87 guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi ModeVisualLine    guifg=#dadada guibg=#000000 guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi ModeVisualBlock   guifg=#dadada guibg=#000000 guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi ModeSelect        guifg=#dadada guibg=#000000 guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi ModeSelectLine    guifg=#dadada guibg=#000000 guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi ModeSelectBlock   guifg=#dadada guibg=#000000 guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi ModeInsert        guifg=#000000 guibg=#8ba870 guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi ModeReplace       guifg=#dadada guibg=#000000 guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi ModeVisualReplace guifg=#dadada guibg=#000000 guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi ModeCommand       guifg=#000000 guibg=#968665 guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi ModeVimEx         guifg=#dadada guibg=#000000 guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi ModeEx            guifg=#dadada guibg=#000000 guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi ModePrompt        guifg=#dadada guibg=#000000 guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi ModeMore          guifg=#dadada guibg=#000000 guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi ModeConfirm       guifg=#dadada guibg=#000000 guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi ModeShell         guifg=#dadada guibg=#000000 guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi ModeTerm          guifg=#dadada guibg=#000000 guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
" }}

" functions {{
function! GitRef()
  let ref = fugitive#head(6)

  if ref != ''
    return ' │ ' . ref
  else
    return ''
  endif
endfunction

function! GitInfo()
  let b       = fugitive#head(6)
  let [a,m,r] = GitGutterGetHunkSummary()

  if b != ''
    return printf(' │ %s │ +%d ~%d -%d', b, a, m, r)
  else
    return ''
  endif
endfunction
" }}
"
" statusline {{
set statusline+=\ %n                                                          " buffer number
set statusline+=%{GitInfo()}                                                  " current git ref
" set statusline+=%{GitStatus()}                                              " git diff of current file
set statusline+=\ │                                                           " separator
set statusline+=\ %<%t%m%r%h%w                                                " file name, modified, readonly, helpfile, preview
set statusline+=\ │                                                           " separator
set statusline+=\ %Y                                                          " file type
set statusline+=\ │                                                           " separator
set statusline+=\ %{''.(&fenc!=''?&fenc:&enc).''}                             " encoding
set statusline+=\ (%{&ff})                                                    " fileFormat (dos / unix)
set statusline+=\ │                                                           " separator
set statusline+=\ %b,0x%B                                                     " current char

set statusline+=%=                                                            " right hand side

set statusline+=%02l/%L\ (%1p%%)\                                             " line number / total lines, percentage of file
set statusline+=%#ModeNormal#%{(mode()==#'n')?'\ \ NORMAL\ \ ':''}            " normal mode indicator
set statusline+=%#ModeVisual#%{(mode()==#'v')?'\ \ VISUAL\ \ ':''}            " visual mode indicator
set statusline+=%#ModeVisualLine#%{(mode()==#'V')?'\ \ V·LINE\ \ ':''}        " visual line mode indicator
set statusline+=%#ModeVisualBlock#%{(mode()==#'')?'\ \ V·BLOCK\ \ ':''}      " visual block mode indicator
set statusline+=%#ModeSelect#%{(mode()==#'s')?'\ \ SELECT\ \ ':''}            " select mode indicator
set statusline+=%#ModeSelectLine#%{(mode()==#'S')?'\ \ S·LINE\ \ ':''}        " select line mode indicator
set statusline+=%#ModeSelectBlock#%{(mode()==#'')?'\ \ S·BLOCK\ \ ':''}      " select block mode indicator
set statusline+=%#ModeInsert#%{(mode()==#'i')?'\ \ INSERT\ \ ':''}            " insert mode indicator
set statusline+=%#ModeReplace#%{(mode()==#'R')?'\ \ REPLACE\ \ ':''}          " replace mode indicator
set statusline+=%#ModeVisualReplace#%{(mode()==#'Rv')?'\ \ V·REPLACE\ \ ':''} " visual replace mode indicator
set statusline+=%#ModeCommand#%{(mode()==#'c')?'\ \ COMMAND\ \ ':''}          " command mode indicator
set statusline+=%#ModeVimEx#%{(mode()==#'cv')?'\ \ VIM\ EX\ \ ':''}           " vim ex mode indicator
set statusline+=%#ModeEx#%{(mode()==#'ce')?'\ \ EX\ \ ':''}                   " ex mode indicator
set statusline+=%#ModePrompt#%{(mode()==#'r')?'\ \ PROMPT\ \ ':''}            " prompt mode indicator
set statusline+=%#ModeMore#%{(mode()==#'rm')?'\ \ MORE\ \ ':''}               " more mode indicator
set statusline+=%#ModeConfirm#%{(mode()==#'r?')?'\ \ CONFIRM\ \ ':''}         " confirm mode indicator
set statusline+=%#ModeShell#%{(mode()==#'!')?'\ \ SHELL\ \ ':''}              " shell mode indicator
set statusline+=%#ModeTerm#%{(mode()==#'t')?'\ \ TERM\ \ ':''}                " terminal mode indicator
set statusline+=%*                                                            " reset statusline color
" }}

" tagbar statusline {{
function! CustomTagbarStatusFunc(current, sort, fname, flags, ...) abort
  let colour = a:current ? '%#StatusLine#' : '%#StatusLineNC#'
  return colour . 'tags'
endfunction

let g:tagbar_status_func = 'CustomTagbarStatusFunc'
" }}

" vim: set sw=2 ts=2 sts=2 et tw=78 fmr={{,}} fdm=marker fdl=0:
