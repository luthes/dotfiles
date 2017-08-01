" Use Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'

call vundle#end()            " required
filetype plugin indent on    " required
" End Vundle

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
