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

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

" Spellcheck toggle
map <F5> :setlocal spell! spelllang=en_us<CR>
nmap <F7> :set rnu! nu!<CR>

" Paste mode
nnoremap <F6> :set paste!<cr>

" Semi colon to colon
nnoremap ; :

" Telescope Bindings
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <C-f> <cmd>Telescope live_grep<cr>
nnoremap <C-b> <cmd>Telescope buffers<cr>

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
