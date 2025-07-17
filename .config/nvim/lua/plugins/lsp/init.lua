require('plugins.lsp.icons')
local config = require('plugins.lsp.config')
return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = {
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗"
            }
          }
        }
      },
      {
        "neovim/nvim-lspconfig",
        config = function()
          -- Setup native LSP configuration after lspconfig is loaded
          config.setup()
        end
      },
    },
  }
}
