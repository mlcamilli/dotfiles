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

-- Snacks Bindings
vim.keymap.set('n', '<C-p>', function() require('snacks').picker.files() end)
vim.keymap.set('n', '<C-f>', function()
  require('snacks').picker.grep({
    cwd = true,
    hidden = true,
    follow = true,
    respect_gitignore = true,
    live = true,
  })
end)
vim.keymap.set('n', '<C-b>', function() require('snacks').picker.buffers() end)
vim.keymap.set('n', '<C-t>', function()
  require('snacks').picker.recent({
    filter = { cwd = true } -- Only show files from current working directory
  })
end)



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
vim.keymap.set('n', '<C-n>', function() require('snacks').explorer.open() end, { silent = true })

-- LSP Keybinds
vim.keymap.set('n', 'gD', function() require('snacks').picker.lsp_declarations() end, { desc = "Goto Declaration" })
vim.keymap.set('n', 'gd', function() require('snacks').picker.lsp_definitions() end, { desc = "Goto Definition" })
vim.keymap.set('n', 'gK', vim.lsp.buf.hover)
vim.keymap.set('n', 'gi', function() require('snacks').picker.lsp_implementations() end, { desc = "Goto Implementation" })
vim.keymap.set('n', 'gr', function() require('snacks').picker.lsp_references() end,
  { nowait = true, desc = "References" })
vim.keymap.set('n', 'gy', function() require('snacks').picker.lsp_type_definitions() end,
  { desc = "Goto T[y]pe Definition" })
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help)
