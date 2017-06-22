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
set ruler
set number
highlight LineNr ctermfg=46
set scrolloff=15

" Vim-plug
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'scrooloose/nerdtree'
call plug#end() 
