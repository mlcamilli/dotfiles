return {
  'echasnovski/mini.files',
  version = false,
  dependencies = { 'nvim-tree/nvim-web-devicons', },
  event = "VeryLazy",
  config = function()
    local files = require('mini.files')
    local silent_options = { noremap = true, silent = true }
    local minifiles_toggle = function()
      if not files.close() then files.open(vim.api.nvim_buf_get_name(0)) end
    end
    local mappings = {
      go_in      = 'L',
      go_in_plus = 'l',
    }
    files.setup({ mappings = mappings })
    vim.keymap.set('n', '<C-n>', minifiles_toggle, silent_options)
  end
}
