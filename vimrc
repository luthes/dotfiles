" Testing out Vim Options... "
" Move between Tabs
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Set split options to open on the bottom right.
set splitbelow
set splitright
syntax on
highlight ColorColumn ctermbg=Darkred
set colorcolumn=80
if $TERM == "xterm-256color"
  set t_Co=256
endif
colorscheme desert
set so=15
