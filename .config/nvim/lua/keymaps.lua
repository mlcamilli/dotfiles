local map = vim.api.nvim_set_keymap

-- Visually wrap long lines
-- noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
-- noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

-- Better pane management
map('n', '<C-h>', '<C-w>h', {})
map('n', '<C-j>', '<C-w>j', {})
map('n', '<C-k>', '<C-w>k', {})
map('n', '<C-l>', '<C-w>l', {})

-- map <C-m> <plug>NERDCommenterInvert

options = { noremap = true }
-- More sane line movement
map('', 'J', 'G', options)
map('', 'K', '1G', options)
map('', 'H', '^', options)
map('', 'L', '$', options)
map('v', 'L', 'g_', options)
map('n', 'D', 'd$', options)

-- Set jj to esc
map('i', 'jj', '<Esc>', {})

map('n', '<C-n>', ':NvimTreeToggle<CR>', options)
map('n', '<leader>r', ':NvimTreeRefresh<CR>', options)
map('n', '<leader>n', ':NvimTreeFindFile<CR>', options)

-- Spellcheck toggle
-- map <F5> :setlocal spell! spelllang=en_us<CR>
-- nmap <F7> :set rnu! nu!<CR>

-- Paste mode
map('n', '<F6>', ':set paste!<cr>', options)

-- Semi colon to colon
map('n', ';', ':', options)

-- Telescope Bindings
map('n', '<C-p>', '<cmd>Telescope find_files<cr>', options)
map('n', '<C-f>', '<cmd>Telescope live_grep<cr>', options)
map('n', '<C-b>', '<cmd>Telescope buffers<cr>', options)

-- Make tab autocomplete
-- map('i', '<expr> <TAB>', 'pumvisible() ? "\<C-y>" : "\<C-g>u\<TAB>"', options)

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
map('n', '<silent> [g', '<Plug>(coc-diagnostic-prev)', {})
map('n', '<silent> ]g', '<Plug>(coc-diagnostic-next)', {})

-- GoTo code navigation.
map('n', '<silent> gd', '<Plug>(coc-definition)', {})
map('n', '<silent> gy', '<Plug>(coc-type-definition)', {})
map('n', '<silent> gi', '<Plug>(coc-implementation)', {})
map('n', '<silent> gr', '<Plug>(coc-references)', {})

-- Use K to show documentation in preview window.
-- map('n', '<silent> <c-K>', ':call <SID>show_documentation()<CR>', options)
