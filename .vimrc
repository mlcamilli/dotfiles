syntax enable
set t_Co=256

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


if &compatible
  set nocompatible               " Be iMproved
endif




call plug#begin('~/.vim/plugged')
" Add or remove your Bundles here:
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'flazz/vim-colorschemes'
Plug 'terryma/vim-multiple-cursors'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'mgee/lightline-bufferline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'qpkorr/vim-bufkill'
Plug 'Shougo/vimshell', { 'rev' : '3787e5' }
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

let g:coc_global_extensions = ['coc-json', 'coc-yaml', 'coc-css', 'coc-eslint', 'coc-prettier', 'coc-tsserver', 'coc-python']

set encoding=UTF-8

set listchars=space:·,precedes:«,extends:»,eol:↲,tab:▸\
set list

" Required:
filetype plugin indent on

" Set Markdown Format for .md files
au BufRead,BufNewFile *.md set filetype=markdown
" Set HTML format for .template files
au BufRead,BufNewFile *.template set filetype=html

set backspace=indent,eol,start
"Tab Settings"
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent

" History Settings
set history=1000

" Undo Settings
set undofile
set undolevels=1000
set undoreload=10000

" File Specific Spacing
autocmd Filetype python setlocal ts=4 sts=4 sw=4 colorcolumn=120
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

"Search Highlighting"
set hlsearch

"Color"
let g:dracula_colorterm = 0
colorscheme dracula
set bg=dark
set termguicolors

"LineWrap"
set wrap
set formatoptions=qrn1
set nu
set relativenumber

"Ignore pycs
let NERDTreeIgnore = ['\.pyc$', '.git', '.gitignore']

"Swap settings
set backup
set noswapfile

set undodir=~/.vim/tmp/undo/
set backupdir=~/.vim/tmp/backup/
set directory=~/.vim/tmp/swap/

"NerdTree Settings
function! NERDTreeToggleInCurDir()
	" If NERDTree is open in the current buffer
	if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
		exe ":NERDTreeClose"
	else
		if (expand("%:t") != '')
 			exe ":NERDTreeFind"
		else
 			exe ":NERDTreeToggle"
		endif
	endif
endfunction
map <C-n> :call NERDTreeToggleInCurDir()<CR>
"map <C-n> :NERDTreeToggle %<CR>
let NERDTreeHijackNetrw=1

"Delte trailing white space
autocmd BufWritePre * :%s/\s\+$//e

"Ctrl - P Settings
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,/node_modules/*

" Visually wrap long lines
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

"Autoclose NERDTree if it's the only window left open.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" }}}

" Better pane management
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Nerd Commentor Binding
map <C-m> <plug>NERDCommenterInvert

" More sane line movement
noremap J G
noremap K 1G
noremap H ^
noremap L $
vnoremap L g_
nnoremap D d$

" Set jj to esc
imap jj <Esc>

" Spellcheck toggle
map <F5> :setlocal spell! spelllang=en_us<CR>
nmap <F7> :set rnu! nu!<CR>

" Search settings
set ignorecase
set smartcase

" search characters as they're entered
set incsearch

" Paste mode
nnoremap <F6> :set paste!<cr>

" Semi colon to colon
nnoremap ; :
" Only color up to the first 512 characters
set synmaxcol=1000

"" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

endif
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>


" Ale Settings
"let g:ale_lint_delay = 500
"let g:ale_cache_executable_check_failures = 1
"let g:ale_disable_lsp = 1
"let g:ale_open_list = 1
"let g:ale_sign_error = "\uf00d"
"let g:ale_sign_warning = "\uf12a"
"let g:ale_python_flake8_options="--ignore=E501"
"hi ALEWarningSign ctermbg=DarkMagenta
"hi ALEWarningSign ctermfg=White

" Black Settings
"let g:ale_python_black_options = '--line-length 120'
"let g:ale_fixers = {
"\    'python': ['black'],
"\    'javascript': ['prettier']
"\}
"let g:ale_linters= {
"\    'python': ['flake8', "mypy"],
"\    'javascript': ['eslint', 'stylelint'],
"\    'jsx': ['eslint', 'stylelint']
"\}
"let g:ale_fix_on_save = 1


function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction


" Lightline Settings
set showtabline=2
set noshowmode
let g:lightline = {
      \ 'tabline': {
      \   'left': [['buffers']],
      \   'right': [[]]
      \ },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ],
      \   'right': [['ale']]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ 'component_expand': {
      \   'ale': 'LinterStatus',
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel',
      \   'ale': 'error'
      \ },
      \ }

let g:lightline#bufferline#show_number = 2
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

" Bind FZF to ctrl + P
"nmap <C-p> :FZF<CR>
nnoremap <silent> <expr> <C-p> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":FZF\<cr>"
let NERDTreeShowHidden=1
" Bind \ + ` to search open buffers
nmap <Leader>` :Buffers<CR>
" Bind \ + - to remove current buffer
nmap <Leader>- :BD<CR>

let g:lightline#bufferline#filename_modifier=":t"
 "Vim Multiline Bindings
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-i>'
let g:multi_cursor_prev_key='<C-u>'
let g:multi_cursor_skip_key='<C-o>'
let g:multi_cursor_quit_key='<Esc>'

" ES6 HTML Highlighting
autocmd FileType javascript JsPreTmpl html

" Json Format Command
"command! -range=% Jsonformat %!python -m json.tool
"command -range=% Jsonformat !python -m json.tool
command! -range -nargs=0 -bar Jsonformat <line1>,<line2>!python -m json.tool

if &term =~ '256color'
    " disable Background Color Erase (BCE)
    set t_ut=
endif

autocmd BufWritePre *.py :CocCommand python.sortImports
