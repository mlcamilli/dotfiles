-- Better pane management
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- More sane line movement
vim.keymap.set('', 'J', 'G')
vim.keymap.set('', 'K', '1G')
vim.keymap.set('', 'H', '^')
vim.keymap.set('', 'L', '$')
vim.keymap.set('v', 'L', 'g_')
vim.keymap.set('n', 'D', 'd$')

-- Buffer navigation
vim.keymap.set("n", "<A-h>", ":BufferLineCyclePrev<CR>", { silent = true })
vim.keymap.set("n", "<A-l>", ":BufferLineCycleNext<CR>", { silent = true })

-- Set jj to esc
vim.keymap.set('i', 'jj', '<Esc>')

-- NVIM Tree
-- vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { silent = true })
vim.keymap.set('n', '<leader>r', ':NvimTreeRefresh<CR>')
vim.keymap.set('n', '<leader>n', ':NvimTreeFindFile<CR>')

-- Paste mode
vim.keymap.set('n', '<F6>', ':set paste!<cr>')
vim.keymap.set('v', 'Y', '"+y')
vim.keymap.set('n', 'Y', '"+y')

-- Semi colon to colon
vim.keymap.set('n', ';', ':')

-- Telescope Bindings
vim.keymap.set('n', '<C-p>', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<C-f>', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<C-b>', '<cmd>Telescope buffers<cr>')



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
vim.keymap.set('n', '<C-n>', minifiles_toggle, { silent = true })

-- LSP Keybinds
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'gK', vim.lsp.buf.hover)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
vim.keymap.set('n', 'gr', vim.lsp.buf.references)
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help)
