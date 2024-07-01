require('plugins.lsp.icons')
local mason = require('plugins.lsp.mason')
local lspconfig = require('plugins.lsp.lspconfig')


return {
  mason.setup(),
  lspconfig.setup(),
}
