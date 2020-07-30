" vim color scheme

set background=dark

if version > 580
  hi clear

  if exists("syntax_on")
    syntax reset
  endif
endif

set t_Co=256
let g:colors_name = "custom"

" general highlight {{
hi Boolean                   guifg=#A1A6A8 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi Character                 guifg=#A1A6A8 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi ColorColumn               guifg=NONE    guibg=#3a3f4d guisp=#3a3f4d gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi Comment                   guifg=#707070 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi Conditional               guifg=#657596 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi Constant                  guifg=#b294bb guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi Cursor                    guifg=#192224 guibg=#dadada guisp=#dadada gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi CursorColumn              guifg=#dadada guibg=#3a3f4d guisp=#3a3f4d gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi CursorIM                  guifg=#192224 guibg=#536991 guisp=#536991 gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi CursorLine                guifg=NONE    guibg=#3a3f4d guisp=#3a3f4d gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi CursorLineNr              guifg=#dadada guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi Debug                     guifg=#e0be80 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi Define                    guifg=#e0be80 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi Delimiter                 guifg=#e0be80 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi DiffAdd                   guifg=#000000 guibg=#8ba870 guisp=#8ba870 gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi DiffChange                guifg=#dadada guibg=#657596 guisp=#657596 gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi DiffDelete                guifg=#dadada guibg=#966575 guisp=#966575 gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi DiffText                  guifg=#dadada guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi Directory                 guifg=#657596 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi Error                     guifg=#dadada guibg=#966575 guisp=#966575 gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi ErrorMsg                  guifg=#dadada guibg=#966575 guisp=#966575 gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi Exception                 guifg=#657596 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi Float                     guifg=#dadada guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi FoldColumn                guifg=#dadada guibg=#3a3f4d guisp=#A1A6A8 gui=italic    ctermfg=NONE ctermbg=NONE cterm=NONE
hi Folded                    guifg=#dadada guibg=#3a3f4d guisp=#A1A6A8 gui=italic    ctermfg=NONE ctermbg=NONE cterm=NONE
hi Function                  guifg=#dadada guibg=NONE    guisp=NONE    gui=bold      ctermfg=NONE ctermbg=NONE cterm=NONE
hi Identifier                guifg=#dadada guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi IncSearch                 guifg=#000000 guibg=#e0be80 guisp=#e0be80 gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi Include                   guifg=#e0be80 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi Keyword                   guifg=#b294bb guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi Label                     guifg=#e0be80 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi LineNr                    guifg=#dadada guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi Macro                     guifg=#b294bb guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi MatchParen                guifg=#e0be80 guibg=NONE    guisp=NONE    gui=bold      ctermfg=NONE ctermbg=NONE cterm=NONE
hi ModeMsg                   guifg=#dadada guibg=#404552 guisp=#404552 gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi MoreMsg                   guifg=#dadada guibg=#404552 guisp=#404552 gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi NonText                   guifg=#5e8d87 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi Normal                    guifg=#dadada guibg=#404552 guisp=#404552 gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi Number                    guifg=#968665 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi Operator                  guifg=#dadada guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi PMenu                     guifg=#dadada guibg=#3a3f4d guisp=#3a3f4d gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi PMenuSbar                 guifg=#dadada guibg=#3a3f4d guisp=#3a3f4d gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi PMenuSel                  guifg=#000000 guibg=#8ba870 guisp=#8ba870 gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi PMenuThumb                guifg=#dadada guibg=#dadada guisp=#dadada gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi PreCondit                 guifg=#e0be80 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi PreProc                   guifg=#966894 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi Question                  guifg=#dadada guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi Repeat                    guifg=#657596 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi Search                    guifg=#000000 guibg=#e0be80 guisp=#e0be80 gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi SignColumn                guifg=#dadada guibg=#404552 guisp=#536991 gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi Special                   guifg=#b294bb guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi SpecialChar               guifg=#e0be80 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi SpecialComment            guifg=#e0be80 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi SpecialKey                guifg=#e0be80 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi SpellBad                  guifg=#dadada guibg=#966894 guisp=#192224 gui=underline ctermfg=NONE ctermbg=NONE cterm=NONE
hi SpellCap                  guifg=#F9F9FF guibg=#192224 guisp=#192224 gui=underline ctermfg=NONE ctermbg=NONE cterm=NONE
hi SpellLocal                guifg=#F9F9FF guibg=#192224 guisp=#192224 gui=underline ctermfg=NONE ctermbg=NONE cterm=NONE
hi SpellRare                 guifg=#F9F9FF guibg=#192224 guisp=#192224 gui=underline ctermfg=NONE ctermbg=NONE cterm=NONE
hi Statement                 guifg=#657596 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi StatusLine                guifg=#dadada guibg=#3a3f4d guisp=#3a3f4d gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi StatusLineNC              guifg=#dadada guibg=#3a3f4d guisp=#3a3f4e gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi StorageClass              guifg=#536991 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi String                    guifg=#8ba870 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi Structure                 guifg=#536991 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi TabLine                   guifg=#dadada guibg=#3a3f4d guisp=#3a3f4d gui=bold      ctermfg=NONE ctermbg=NONE cterm=NONE
hi TabLineFill               guifg=#dadada guibg=#3a3f4d guisp=#3a3f4d gui=bold      ctermfg=NONE ctermbg=NONE cterm=NONE
hi TabLineSel                guifg=#000000 guibg=#8ba870 guisp=#8ba870 gui=bold      ctermfg=NONE ctermbg=NONE cterm=NONE
hi Tag                       guifg=#657596 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi Title                     guifg=#dadada guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi Todo                      guifg=#000000 guibg=#e0be80 guisp=#e0be80 gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi Type                      guifg=#657596 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi Typedef                   guifg=#657596 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi Underlined                guifg=#dadada guibg=#404552 guisp=#404552 gui=underline ctermfg=NONE ctermbg=NONE cterm=NONE
hi VertSplit                 guifg=#dadada guibg=#404552 guisp=#404552 gui=bold      ctermfg=NONE ctermbg=NONE cterm=NONE
hi Visual                    guifg=#192224 guibg=#dadada guisp=#dadada gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi VisualNOS                 guifg=#192224 guibg=#dadada guisp=#dadada gui=underline ctermfg=NONE ctermbg=NONE cterm=NONE
hi WarningMsg                guifg=#dadada guibg=#966575 guisp=#966575 gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi WildMenu                  guifg=#dadada guibg=#3a3f4d guisp=#3a3f4d gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
" }}

" extension highlight {{
" coc
hi CocErrorSign              guifg=#966575 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi CocHintSign               guifg=#e0be80 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi CocInfoSign               guifg=#657596 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi CocWarningSign            guifg=#966575 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE

" tagbar
hi TagbarComment             guifg=#707070 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi TagbarFoldIcon            guifg=#dadada guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi TagbarHighlight           guifg=NONE    guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi TagbarKind                guifg=#e0be80 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi TagbarNestedKind          guifg=#e0be80 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi TagbarPseudoID            guifg=#dadada guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi TagbarScope               guifg=#657596 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi TagbarSignature           guifg=#dadada guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi TagbarType                guifg=#b294bb guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi TagbarVisibilityPrivate   guifg=#966575 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi TagbarVisibilityProtected guifg=#5e8d87 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi TagbarVisibilityPublic    guifg=#8ba870 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE

" ctrlp
hi CtrlPBookmark             guifg=#dadada guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi CtrlPBufName              guifg=#dadada guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi CtrlPLinePre              guifg=#000000 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi CtrlPMatch                guifg=#000000 guibg=#e0be80 guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi CtrlPMode1                guifg=#dadada guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi CtrlPMode2                guifg=#dadada guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi CtrlPNoEntries            guifg=#966575 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi CtrlPPrtBase              guifg=#dadada guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi CtrlPPrtCursor            guifg=#dadada guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi CtrlPPrtText              guifg=#dadada guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi CtrlPStats                guifg=#dadada guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi CtrlPTabExtra             guifg=#dadada guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi CtrlPTagKind              guifg=#dadada guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi CtrlPUndoBr               guifg=#dadada guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi CtrlPUndoNr               guifg=#dadada guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi CtrlPUndoPo               guifg=#dadada guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi CtrlPUndoSv               guifg=#dadada guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi CtrlPUndoT                guifg=#dadada guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi CtrlPqfLineCol            guifg=#dadada guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE

" gitgutter
hi GitGutterAdd              guifg=#8ba870 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi GitGutterChange           guifg=#657596 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi GitGutterDelete           guifg=#966575 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi GitGutterChangeDelete     guifg=#5e8d87 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
" }}

" vim: set sw=2 ts=2 sts=2 et tw=78 fmr={{,}} fdm=marker fdl=0:
