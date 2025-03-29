local map = vim.api.nvim_set_keymap


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
-- map('n', '<C-n>', ':NvimTreeToggle<CR>', silent_options)
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



-- Completion Keybinds
local keycode = vim.keycode or function(x)
  return vim.api.nvim_replace_termcodes(x, true, true, true)
end
local keys = {
  ['cr']        = keycode('<CR>'),
  ['ctrl-y']    = keycode('<C-y>'),
  ['ctrl-y_cr'] = keycode('<C-y><CR>'),
}

_G.cr_action = function()
  if vim.fn.pumvisible() ~= 0 then
    -- If popup is visible, confirm selected item or add new line otherwise
    local item_selected = vim.fn.complete_info()['selected'] ~= -1
    return item_selected and keys['ctrl-y'] or keys['ctrl-y_cr']
  else
    -- If popup is not visible, use plain `<CR>`. You might want to customize
    -- according to other plugins. For example, to use 'mini.pairs', replace
    -- next line with `return require('mini.pairs').cr()`
    -- else should be keys['cr']
    return require('mini.pairs').cr()
  end
end

vim.keymap.set('i', '<CR>', 'v:lua._G.cr_action()', { expr = true })


local imap_expr = function(lhs, rhs)
  vim.keymap.set('i', lhs, rhs, { expr = true })
end
imap_expr('<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
imap_expr('<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])


-- Mini Files Keybind
local minifiles_toggle = function()
  local files = require('mini.files')
  if not files.close() then files.open(vim.api.nvim_buf_get_name(0)) end
end


-- File Explorer Keybind
vim.keymap.set('n', '<C-n>', minifiles_toggle, silent_options)
