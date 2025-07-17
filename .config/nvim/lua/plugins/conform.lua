return {
  'stevearc/conform.nvim',
  event = 'LspAttach',
  opts = {
    quiet = true,
    formatters_by_ft = {
    },
  },
  config = function(_, opts)
    local conform = require('conform')
    conform.setup(opts)
  end,
}
