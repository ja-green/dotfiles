" vim plug
"
call plug#begin('~/.local/share/nvim/plugged')

Plug 'ensime/ensime-vim', { 'do': ':UpdateRemotePlugins' }
Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'djoshea/vim-autoread'
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'gre/play2vim'
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'

" code completion with deoplete - enabled by ensime
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
        
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources={} 
let g:deoplete#sources._=['buffer', 'member', 'tag', 'file', 'omni', 'ultisnips'] 
let g:deoplete#omni#input_patterns={} 
let g:deoplete#omni#input_patterns.scala = '[^. *\t]\.\w*'
let g:deoplete#omni#input_patterns.java  = '[^. *\t]\.\w*'

" initialize plugin system
call plug#end()

set laststatus=0
set statusline=%<%f\ %h%m%r%=%-20.(line=%l,col=%c%V,totlin=%L%)\%h%m%r%=%-40(,bytval=0x%B,%n%Y%)\%P

let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0

set tags=./tags;,tags;
let g:tagbar_autoshowtag = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1
autocmd VimEnter * nested :TagbarOpen

let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"

" remap escape
imap jk <Esc>

map <C-n> :NERDTreeToggle<CR>

" easy clipboard access
nnoremap Y "+y
nnoremap P "+p

" easier buffer navigation
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" tab completion for pmenu
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

autocmd BufWritePost,InsertLeave,TextChanged,InsertEnter *.scala silent :EnTypeCheck

nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" leader key
let mapleader = ","

"  local replace
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>
" global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>

" insert single character
nnoremap <Space> i_<Esc>r

" disable search highlighting
nnoremap <leader><leader> :noh<CR>:<backspace>

nnoremap ss :write<CR>

set updatetime=100
set background=dark
set t_Co=256

colorscheme custom

set number
set relativenumber
set lazyredraw
set cursorline
set wildmenu
set showcmd
set showmatch
set title
set autoread
set ignorecase
set smartcase
set visualbell
set noerrorbells
set nobackup
set noswapfile

filetype plugin indent on

" show existing tab with 4 spaces width
set tabstop=2
" when indenting with '>', use 4 spaces width
set shiftwidth=2
" On pressing tab, insert 4 spaces
set expandtab

" search settings
set incsearch
set hlsearch
set smartcase

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --hidden
  let g:ctrlp_user_command = 'ag -l --nocolor -g "" %s'
  let g:ctrlp_use_caching = 0
endif

command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

nnoremap <leader><space> :CtrlP<CR>
