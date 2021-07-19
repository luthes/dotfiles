" ~/.config/nvim
if empty(glob('~/.config/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/local/share/nvim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'godlygeek/tabular'
Plug 'hashivim/vim-terraform'
Plug 'dracula/vim', {'as':'dracula'}
Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'google/yapf'
Plug 'dense-analysis/ale'
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()
" Make sure the pretty colors are loaded first
" set t_Co=256
" set background=dark
let g:dracula_colorterm=0
colorscheme dracula


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

" Status Line
let g:airline_powerline_fonts=1
let g:airline_theme='dracula'

" Open NerdTree
map <silent> <C-n> :NERDTreeFocus<CR>

" This might not be necessary with airline
" Status Line Linter
function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '✨ all good ✨' : printf(
        \   '😞 %dW %dE',
        \   all_non_errors,
        \   all_errors
        \)
endfunction

" Ale stuff
let g:ale_linters = {
      \   'python': ['flake8', 'pylint'],
      \}

let g:ale_fixers = {
      \    'python': ['yapf'],
      \    'terraform': ['terraform'],
      \    'json': ['jq'],
      \    'yaml': ['yamlfix'],
      \}

nmap <F10> :ALEFix<CR>
nmap <F11> :Pydocstring<CR>
let g:ale_fix_on_save = 0

" End Python Stuff

"Set split options to open on the bottom right.
set splitbelow
set splitright
syntax on
set colorcolumn=80
set ruler
set number
set scrolloff=15

set expandtab
set tabstop=8
set shiftwidth=2
