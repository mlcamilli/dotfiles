return {
  'stevearc/conform.nvim',
  event = 'LspAttach',
  opts = {
    quiet = true,
    formatters_by_ft = {
      typescript = { 'prettier' },
      typescriptreact = { 'prettier' },
      javascript = { 'prettier' },
      javascriptreact = { 'prettier' },
      html = { 'prettier' },
      css = { 'prettier' },
      scss = { 'prettier' },
    },
  },
  config = function(_, opts)
    local conform = require('conform')
    conform.setup(opts)

    -- Customize prettier args
    require('conform.formatters.prettier').args = function(self, ctx)
      local prettier_roots = { '.prettierrc', '.prettierrc.json', 'prettier.config.js' }
      local args = { '--stdin-filepath', '$FILENAME' }

      local localPrettierConfig = vim.fs.find(prettier_roots, {
        upward = true,
        path = ctx.dirname,
        type = 'file'
      })[1]
      local globalPrettierConfig = vim.fs.find(prettier_roots, {
        path = vim.fn.stdpath('config'),
        type = 'file'
      })[1]
      local disableGlobalPrettierConfig = os.getenv('DISABLE_GLOBAL_PRETTIER_CONFIG')

      -- Project config takes precedence over global config
      if localPrettierConfig then
        vim.list_extend(args, { '--config', localPrettierConfig })
      elseif globalPrettierConfig and not disableGlobalPrettierConfig then
        vim.list_extend(args, { '--config', globalPrettierConfig })
      end

      return args
    end
  end,
}
