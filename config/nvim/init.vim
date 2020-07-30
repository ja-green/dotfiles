" nvim configuration file

" plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'djoshea/vim-autoread'
Plug 'junegunn/vim-easy-align'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'preservim/nerdtree'

call plug#end()

colorscheme custom

filetype plugin indent on

" load additional config
for s:path in split(glob('~/.config/nvim/include/*.vim'), "\n")
    exe 'source ' . s:path
endfor
