local M = {}

M.setup = function()
  return {
    {
      "williamboman/mason.nvim",
      config = function()
        require("mason").setup({
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗"
            }
          }
        })
      end
    },
    {
      'williamboman/mason-lspconfig.nvim',
      config = function()
        require("mason-lspconfig").setup({
          automatic_installation = true
        })
      end
    }
  }
end

return M
