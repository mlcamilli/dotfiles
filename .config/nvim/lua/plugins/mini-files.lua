return {
  'echasnovski/mini.files',
  version = false,
  dependencies = { 'nvim-tree/nvim-web-devicons', },
  event = "VeryLazy",
  config = function()
    local files = require('mini.files')
    local mappings = {
      go_in      = 'L',
      go_in_plus = 'l',
    }
    files.setup({ mappings = mappings })
  end
}
