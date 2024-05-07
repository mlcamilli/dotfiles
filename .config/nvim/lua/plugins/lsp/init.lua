require('plugins.lsp.icons')
local mason = require('plugins.lsp.mason')
local cmp = require('plugins.lsp.cmp')
local lspconfig = require('plugins.lsp.lspconfig')


return {
  mason.setup(),
  lspconfig.setup(),
  cmp.setup()
}
