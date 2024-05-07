local map = vim.api.nvim_set_keymap

-- Visually wrap long lines
-- noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
-- noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

-- Better pane management
map('n', '<C-h>', '<C-w>h', {})
map('n', '<C-j>', '<C-w>j', {})
map('n', '<C-k>', '<C-w>k', {})
map('n', '<C-l>', '<C-w>l', {})

local options = { noremap = true }
local silent_options = { noremap = true, silent = true }

-- More sane line movement
map('', 'J', 'G', options)
map('', 'K', '1G', options)
map('', 'H', '^', options)
map('', 'L', '$', options)
map('v', 'L', 'g_', options)
map('n', 'D', 'd$', options)



map("n", "<A-h>", ":BufferLineCyclePrev<CR>", silent_options)
map("n", "<A-l>", ":BufferLineCycleNext<CR>", silent_options)

-- Set jj to esc
map('i', 'jj', '<Esc>', {})

-- NVIM Tree
map('n', '<C-n>', ':NvimTreeToggle<CR>', silent_options)
map('n', '<leader>r', ':NvimTreeRefresh<CR>', options)
map('n', '<leader>n', ':NvimTreeFindFile<CR>', options)

-- Paste mode
map('n', '<F6>', ':set paste!<cr>', options)
map('v', 'Y', '"+y', options)
map('n', 'Y', '"+y', options)

-- Semi colon to colon
map('n', ';', ':', options)

-- Telescope Bindings
map('n', '<C-p>', '<cmd>Telescope find_files<cr>', options)
map('n', '<C-f>', '<cmd>Telescope live_grep<cr>', options)
map('n', '<C-b>', '<cmd>Telescope buffers<cr>', options)

-- Trouble Bindings
map('n', '<C-v>', ':TroubleToggle document_diagnostics<cr>', options)

-- Comment Bindings
map('n', '<CR>', '<Plug>(comment_toggle_linewise_current)', {})
map('x', '<CR>', '<Plug>(comment_toggle_linewise_visual)', {})
