
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync
endif


if &compatible
  set nocompatible
endif


call plug#begin('~/.config/nvim/autoload')
--- Add or remove your Bundles here:
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'flazz/vim-colorschemes'
Plug 'mg979/vim-visual-multi'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'qpkorr/vim-bufkill'
Plug 'Shougo/vimshell', { 'rev' : '3787e5' }
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'hashivim/vim-terraform'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
call plug#end()

let g:coc_global_extensions = ['coc-json', 'coc-yaml', 'coc-css', 'coc-eslint', 'coc-prettier', 'coc-tsserver', 'coc-pyright', 'coc-tailwindcss']

set listchars=space:·,precedes:«,extends:»,eol:↲,tab:▸\
set list



---Tab Settings---
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent

--- Undo Settings
set undofile
set undolevels=1000
set undoreload=10000

--- Search Highlighting
set ignorecase
set smartcase

--- Current line highlighting
set cursorline

---Color---
let g:dracula_colorterm = 0
colorscheme dracula
set bg=dark
set termguicolors

---LineWrap---
set wrap
set formatoptions=qrn1
set nu
set relativenumber

---Swap settings
set backup
set noswapfile

set undodir=~/.vim/nvim/tmp/undo/
set backupdir=~/.vim/nvim/tmp/backup/
set directory=~/.vim/nvim/tmp/swap/

---Terraform Settings
let g:terraform_fmt_on_save = 1
let g:terraform_align = 1

---Ctrl - P Settings
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,/node_modules/*


--- Copy/Paste
set clipboard=unnamedplus
vnoremap  <leader>y  ---+y
nnoremap  <leader>Y  ---+yg_
nnoremap  <leader>y  ---+y
nnoremap <leader>p ---+p
nnoremap <leader>P ---+P
vnoremap <leader>p ---+p
vnoremap <leader>P ---+P


--- Only color up to the first 512 characters
set synmaxcol=1000

if executable('rg')
  set grepprg=rg
endif



 ---Vim Multiline Bindings
let g:VM_maps = {}
let g:VM_default_mappings = 0
let g:VM_maps['Find Under']         = '<C-d>'
let g:VM_maps['Find Subword Under'] = '<C-d>'
---let g:VM_maps[---Select Cursor Down---] = '<M-C-Down>'
---let g:VM_maps[---Select Cursor Up---]   = '<M-C-Up>'



--- Json Format Command
command! -range -nargs=0 -bar Jsonformat <line1>,<line2>!python -m json.tool
