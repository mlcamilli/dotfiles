"Pathogen Settings"
"execute pathogen#infect()
"execute pathogen#helptags()
syntax enable
set t_Co=256


"NeoBundle Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/boos3y/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('/home/boos3y/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'isRuslan/vim-es6'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-surround'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'hynek/vim-python-pep8-indent'
NeoBundle 'vim-syntastic/syntastic.git'
NeoBundle 'ConradIrwin/vim-bracketed-paste'
NeoBundle 'Quramy/vim-js-pretty-template'
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
NeoBundle 'itchyny/lightline.vim'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------



" Set Markdown Format for .md files
au BufRead,BufNewFile *.md set filetype=markdown
" Set HTML format for .template files
au BufRead,BufNewFile *.template set filetype=html

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
colorscheme monokai

"LineWrap"
set wrap
set formatoptions=qrn1
set nu
set relativenumber

"Ignore pycs
let NERDTreeIgnore = ['\.pyc$']

"Swap settings
set backup
set noswapfile

set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//

"NerdTree Settings
map <C-n> :NERDTreeToggle<CR>
let NERDTreeHijackNetrw=1

"Delte trailing white space
autocmd BufWritePre * :%s/\s\+$//e

"Ctrl - P Settings
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,/node_modules/*
let g:ctrlp_custom_ignore = {
    \ 'dir':  'node_modules\|\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|^log\|public\/system\|tmp|node_modules$',
    \ 'file': '\.exe$\|\.so$\|\.dat|\.pyc$'
    \ }

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

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_checkers = ['flake8']

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_python_flake8_args='--ignore=E501'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_error_symbol = '❌ '

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
