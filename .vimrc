"Pathogen Settings"
execute pathogen#infect()
execute pathogen#helptags()
syntax enable
set t_Co=256
filetype plugin indent on

"Tab Settings"
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent

"Search Highlighting"
set hlsearch

"Color"
colorscheme monokai

"LineWrap"
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=80
set nu
"set relativenumber
"autocmd vimenter * NERDTree

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

"Delte trailing white space
autocmd BufWritePre * :%s/\s\+$//e

"Ctrl - P Settings
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,/node_modules/*
let g:ctrlp_custom_ignore = {
    \ 'dir':  'node_modules\|\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|^log\|public\/system\|tmp|node_modules$',
    \ 'file': '\.exe$\|\.so$\|\.dat|\.pyc$'
    \ }


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

" Auto pep8
autocmd BufWritePost *.py call Flake8()


" More sane line movement
noremap H ^
noremap L $
vnoremap L g_
nnoremap D d$

" Set Markdown Format for .md files
au BufRead,BufNewFile *.md set filetype=markdown
" Set HTML format for .template files
au BufRead,BufNewFile *.template set filetype=html

" Set jj to esc
imap jj <Esc>

" Spellcheck toggle
map <F5> :setlocal spell! spelllang=en_us<CR>

" Paste mode
nnoremap <F6> :set paste!<cr>

" Search All
fu! Vimgrep(filename, pattern)
    exe "vimgrep /".a:pattern."/j ".a:filename."| cw"
endfu

" Semi colon to colon
nnoremap ; :
" Only color up to the first 512 characters
set synmaxcol=512


" Vim Multiline Bindings
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-i>'
let g:multi_cursor_prev_key='<C-u>'
let g:multi_cursor_skip_key='<C-o>'
let g:multi_cursor_quit_key='<Esc>'

if &term =~ '256color'
    " disable Background Color Erase (BCE)
    set t_ut=
 endif
