" ~/.config/nvim
if empty(glob('~/.config/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/local/share/nvim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'godlygeek/tabular'
Plug 'hashivim/vim-terraform'
Plug 'dracula/vim'
Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go'
call plug#end()

" Set encoding for the listchars
set encoding=utf-8
scriptencoding utf-8

" Minimal Configuration
let mapleader = ";"
set nocompatible
syntax on
filetype plugin indent on

autocmd FileType crontab setlocal nowritebackup


" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

" set leader
let mapleader = ";"

" use files directory as path
autocmd BufEnter * lcd %:p:h

" Copy and paste to system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P


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

" Spaces as dots
set list
set listchars=
set listchars+=space:·
set listchars+=trail:·
set listchars+=extends:»
set listchars+=precedes:«
set listchars+=tab:»»

" Clipboard Commands
" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

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
