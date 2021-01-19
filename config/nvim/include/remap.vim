" key remappings

" leader key
let mapleader = ','

" easier buffer navigation
nnoremap <Tab>   :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" easy system clipboard access
nnoremap Y "+y
nnoremap P "+p

" enable cr in normal mode
nnoremap <S-Enter> O<Esc>
nnoremap <CR> o<Esc>

" fast write buffer
nnoremap ss :write<CR>

" insert single character
nnoremap <leader>i i_<Esc>r

" disable search highlighting
nnoremap <leader><leader> :noh<CR>:<backspace>

" coc - format selected region
xnoremap <leader>f <Plug>(coc-format-selected)
nnoremap <leader>f <Plug>(coc-format-selected)

" coc jump between errors
nmap <silent> <C-[> <Plug>(coc-diagnostic-prev)
nmap <silent> <C-]> <Plug>(coc-diagnostic-next)

" coc perform code action
vmap <silent> <C-A> <Plug>(coc-codeaction-selected)
nmap <silent> <C-A> <Plug>(coc-codeaction-selected)

" coc - show documentation in preview window
nnoremap <silent> <C-D> :call <SID>__show_documentation()<CR>

" fzf search files / lines
nnoremap <C-f> :Files<CR>
nnoremap <C-l> :Lines<CR>

" nerdtree - toggle open
nnoremap <C-n> :NERDTreeToggle<CR>

function! s:__show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction
