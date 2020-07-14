" vim core settings

" general options {{
set autoindent                                       " new lines inherit the indentation of previous lines
set autoread                                         " automatically re-read files if unmodified inside vim
set autowrite                                        " automatically write file if buffer is changed
set backspace=2                                      " allow backspacing of autoindent, line breaks and inserts
set belloff=all                                      " disable ascii bell
set cmdheight=2                                      " number of screen lines to use for command line
set colorcolumn=81                                   " indicate long lines
set cursorline                                       " highlight current line
set diffopt=horizontal,context:6,filler              " options for displaying diffs
set display+=lastline,msgsep,uhex                    " text rendering options
set expandtab                                        " convert tabs to spaces
set fileencodings=utf-8,gbk,ucs-bom,cp936            " character encodings considered when reading a file
set fileformats=unix,dos                             " controls eol character in the file
set fillchars=stl:\ ,stlnc:\ ,eob:~                  " set statusline filler characters to spaces
set foldclose=all                                    " auto-fold when cursor is away from fold and foldlevel is lower
set foldcolumn=0                                     " disable column folding
set foldenable                                       " enable folding
set foldlevel=0                                      " automatically fold all levels
set foldmethod=marker                                " markers are used to identify folds
set formatoptions+=j                                 " delete comments when joining lines
set grepformat=%f:%l:%c:%m                           " format to display grep results
set grepprg=ag\ --nogroup\ --nocolor\ --column       " set grep program to ag
set history=2000                                     " keep commands in history
set hlsearch                                         " highlight all search matches
set incsearch                                        " incremental search that shows partial matches
set keywordprg=                                      " diable keyword program
set laststatus=2                                     " always display the statusline
set lazyredraw                                       " disable screen updating during macro and script execution
set modeline                                         " respect modeline if one exists
set mouse=a                                          " enable mouse support in all modes
set mousehide                                        " hide mouse cursor when typing
set nobackup                                         " disable backup file
set noerrorbells                                     " disable bell character on errors
set nofileignorecase                                 " file and path names are case sensitive
set nofsync                                          " disable os fsync on file close
set noruler                                          " disable ruler
set noshowmode                                       " disable showing mode under statusline
set noswapfile                                       " disable swap file
set novisualbell                                     " disable flashing screen on bell character
set nowrap                                           " disable text wrapping of long lines
set nowritebackup                                    " disable backup file
set number                                           " show line numbers
set path+=**                                         " wildcard include directories
set pumheight=15                                     " use a maximum of 15 rows for completion menu
set regexpengine=2                                   " use nfa regex engine always
set relativenumber                                   " show line numbers relative to current line
set scrolloff=3                                      " always keep three lines of context around current line
set shiftround                                       " round indent to multiple of shiftwidth
set shiftwidth=4                                     " number of spaces to use for indent
set shortmess=aFc                                    " abbreviate some messages
set showbreak=↪                                      " string displayed at the beginning of wrapped lines
set showcmd                                          " show partial commands in the bottom right
set showtabline=1                                    " only show tabline if there are more than two tabs
set sidescrolloff=7                                  " always keep seven columns of context around current column
set signcolumn=auto:2                                " show maximum of two signs in signcolumn
set smartcase                                        " enable smart searching of text by case
set smartindent                                      " enable auto-indenting after certain characters
set smarttab                                         " tab characters insert spaces
set splitright                                       " new split windows appear on the right
set tabpagemax=10                                    " maximum number of tabs allowed
set tabstop=4                                        " indent using four spaces
set tags=./tags;,tags;                               " files to read as tags
set termguicolors                                    " enable 24 bit rgb colors in the terminal
set updatetime=100                                   " update time in milliseconds
set whichwrap=b,s,h,l,<,>,[,]                        " backspace and cursor keys also wrap
set wildignore+=*.so,*~,*/.git/*,*/.DS_Store,*/tmp/* " ignored files in wildmenu
set wildignorecase                                   " ignore case in wildmenu
set wildmenu                                         " enable wildmenu
set wildmode=longest,full                            " improve wildmenu completion
" }}

" variables {{
" ctrlp
let g:ctrlp_user_command      = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_use_caching       = 0

" tagbar
let g:tagbar_show_linenumbers = 1
let g:tagbar_autoshowtag      = 1
let g:tagbar_sort             = 0
let g:tagbar_compact          = 1
" }}

" vim: set sw=2 ts=2 sts=2 et tw=78 fmr={{,}} fdm=marker fdl=0:
