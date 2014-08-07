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

"Solarized"
set background=dark
colorscheme solarized

"LineWrap"
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=80
set nu
autocmd vimenter * NERDTree

"Pymode Settings
let g:pymode_folding = 0
autocmd CursorMovedI *  if pumvisible() == 0|silent! pclose|endif
autocmd InsertLeave * if pumvisible() == 0|silent! pclose|endif

"Swap settings
set backup
set noswapfile

set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//

"NerdTree Settings
map <C-n> :NERDTreeToggle<CR>

"Ctrl - P Settings
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,/node_modules/* 
let g:ctrlp_custom_ignore = {
    \ 'dir':  'node_modules\|\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\/system\|log\|tmp|node_modules$',
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

" Set Markdown Format for .md files
au BufRead,BufNewFile *.md set filetype=markdown

" Set jj to esc
imap jj <Esc>

" Spellcheck toggle
map <F5> :setlocal spell! spelllang=en_us<CR>

" Paste mode
nnoremap <F6> :set paste!<cr>
