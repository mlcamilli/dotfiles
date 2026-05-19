return {
  on_init = function(client)
    local path = vim.fn.getcwd()
    if string.find(path, 'rhythm%-app') then
      ---@diagnostic disable-next-line: undefined-field
      client.config.settings.ty.configuration.rules['unresolved-import'] = 'ignore'
      ---@diagnostic disable-next-line: param-type-mismatch
      client.notify('workspace/didChangeConfiguration', { settings = client.config.settings })
    end
  end,
  capabilities = (function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
    return capabilities
  end)(),
  settings = {
    ty = {
      diagnosticMode = 'workspace',
      configuration = {
        rules = {},
      },
    },
  },
}
