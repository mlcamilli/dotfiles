return {
  on_init = function(client)
    local path = vim.fn.getcwd()
    if string.find(path, 'rhythm%-app') then
      ---@diagnostic disable-next-line: undefined-field
      client.config.settings.python.analysis.diagnosticSeverityOverrides = { reportMissingImports = "none" }
      ---@diagnostic disable-next-line: param-type-mismatch
      client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
    end
  end,
  capabilities = (function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
    return capabilities
  end)(),
  settings = {
    disableOrganizeImports = true,
    python = {
      analysis = {
        diagnosticSeverityOverrides = {},
        -- Ignore all files for analysis to exclusively use Ruff for linting
        ignore = { '*' },
      }
    }
  }
}
