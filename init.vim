
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync
endif


if &compatible
  set nocompatible               " Be iMproved
endif


call plug#begin('~/.config/nvim/autoload')
" Add or remove your Bundles here:
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

" Undo Settings
set undofile
set undolevels=1000
set undoreload=10000

" File Specific Spacing
autocmd Filetype python setlocal ts=4 sts=4 sw=4 colorcolumn=120
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" Search Highlighting
set ignorecase
set smartcase

" Current line highlighting
set cursorline

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

"Swap settings
set backup
set noswapfile

set undodir=~/.vim/nvim/tmp/undo/
set backupdir=~/.vim/nvim/tmp/backup/
set directory=~/.vim/nvim/tmp/swap/

"Terraform Settings
let g:terraform_fmt_on_save = 1
let g:terraform_align = 1

lua << END
-- Telescope setup
require('telescope').setup {
    defaults = {
        file_ignore_patterns = {
            ".git",
            "node_modules",
            "__pycache__",
            "coverage",
            ".mypy_cache"
        },
    },
    pickers = {
        find_files = {
            hidden=true,
            theme = "dropdown",
        }
    },
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
        }
    }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
-- Treesitter Config
require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "all",

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  ignore_install = {},

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    disable = {},

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
}
--  NVIM tree Setup
require'nvim-tree'.setup {
  disable_netrw        = true,
  hijack_netrw         = true,
  open_on_setup        = false,
  ignore_ft_on_setup   = {},
  auto_reload_on_write = true,
  open_on_tab          = false,
  hijack_cursor        = false,
  update_cwd           = false,
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    mappings = {
      custom_only = false,
      list = {}
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes"
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  },
  actions = {
    change_dir = {
      global = false,
    },
    open_file = {
      quit_on_open = false,
    }
  }
}
-- Lualine Setup
 require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'dracula',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {lualine_a = {'buffers'},lualine_z = {'tabs'}},
  extensions = {}
}
END



nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

"Delte trailing white space
autocmd BufWritePre * :%s/\s\+$//e

"Ctrl - P Settings
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,/node_modules/*

" Visually wrap long lines
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

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

" Copy/Paste
set clipboard=unnamedplus
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Spellcheck toggle
map <F5> :setlocal spell! spelllang=en_us<CR>
nmap <F7> :set rnu! nu!<CR>

" Paste mode
nnoremap <F6> :set paste!<cr>

" Semi colon to colon
nnoremap ; :
" Only color up to the first 512 characters
set synmaxcol=1000

"" The Silver Searcher
if executable('rg')
  " Use ag over grep
  set grepprg=rg
endif

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" Telescope Bindings
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <C-f> <cmd>Telescope live_grep<cr>
nnoremap <C-b> <cmd>Telescope buffers<cr>
"nnoremap <silent> <expr> <C-p> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":FZF\<cr>"
" Bind \ + ` to search open buffers
nmap <Leader>` :Buffers<CR>
" Bind \ + - to remove current buffer
nmap <Leader>- :BD<CR>

 "Vim Multiline Bindings
let g:VM_maps = {}
let g:VM_default_mappings = 0
let g:VM_maps['Find Under']         = '<C-d>'
let g:VM_maps['Find Subword Under'] = '<C-d>'
"let g:VM_maps["Select Cursor Down"] = '<M-C-Down>'
"let g:VM_maps["Select Cursor Up"]   = '<M-C-Up>'

" ES6 HTML Highlighting
autocmd FileType javascript JsPreTmpl html

" Json Format Command
command! -range -nargs=0 -bar Jsonformat <line1>,<line2>!python -m json.tool

"autocmd BufWritePre *.py :call CocAction('format')
"autocmd BufWritePre *.py :CocCommand python.sortImports
" Make tab autocomplete
" inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<C-g>u\<TAB>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> <c-K> :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd BufRead,BufEnter *.astro set filetype=astro
