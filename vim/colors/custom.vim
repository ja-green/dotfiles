" Vim color file

" This is the default color scheme.  It doesn't define the Normal
" highlighting, it uses whatever the colors used to be.

" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
hi clear Normal
set bg&

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let colors_name = "custom"

highlight Pmenu     ctermbg=gray      ctermfg=white guibg=gray
highlight PmenuSel  ctermbg=darkgreen ctermfg=black guibg=green

highlight VertSplit cterm=NONE

" vim: sw=2
