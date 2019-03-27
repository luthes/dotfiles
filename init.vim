" ~/.config/nvim
call plug#begin('~/local/share/nvim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'pearofducks/ansible-vim'
Plug 'vimwiki/vimwiki'
Plug 'godlygeek/tabular'
Plug 'vim-syntastic/syntastic'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'hashivim/vim-terraform'
Plug 'Shougo/deoplete.nvim'
Plug 'neomake/neomake'
Plug 'dracula/vim'
Plug 'nvie/vim-flake8'
Plug 'scrooloose/nerdtree'
Plug 'b4b4r07/vim-ansible-vault'
call plug#end()

" Set encoding for the listchars
set encoding=utf-8
scriptencoding utf-8

" Minimal Configuration
set nocompatible
syntax on
filetype plugin indent on

autocmd FileType crontab setlocal nowritebackup

let g:python3_host_prog = '/usr/bin/python3'
autocmd VimEnter * NERDTree

" Status Line
set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

" Syntastic Config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=4

let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.terraform = '[^ *\t"{=$]\w*'
let g:deoplete#enable_at_startup = 1

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" call deoplete#initialize()

" Testing out Vim Options... "
" Move between Tabs
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" Spaces as dots
set list
set listchars=
set listchars+=space:·
set listchars+=trail:·
set listchars+=extends:»
set listchars+=precedes:«

" Vimwiki Options
let g:vimwiki_list = [{
  \ 'path': '$HOME/vimwiki',
  \ 'template_path': '$HOME/vimwiki/templates',
  \ 'template_default': 'index',
  \ 'template_ext': '.html',
  \ 'auto_toc': 1,
  \ 'auto_export': 1}]
"let g:vimwiki_list = [{'path': '~/markdown/',
"                     \ 'syntax': 'markdown', 'ext': '.md'}]

" Really Nice Colors
set termguicolors

let @r = 'dwxwxxi=hli wwxg$xx0dwiaws_secret kb_access_key j0dwxwxxi=kb =wxg$$xx0dwiaws_sesikbsskbion_token j0dwdd0dwxdwxiaws_access_key_id ülr=llxg$xj'

"Set split options to open on the bottom right.
set splitbelow
set splitright
syntax on
highlight ColorColumn ctermbg=Darkred
set colorcolumn=80
if $TERM == "xterm-256color"
  set t_Co=256
endif
set ruler
set number
highlight LineNr ctermfg=46
set scrolloff=15
colorscheme dracula

set expandtab
set tabstop=2
set shiftwidth=2