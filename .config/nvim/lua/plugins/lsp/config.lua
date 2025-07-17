local M = {}

M.setup = function()
  -- Native Neovim 0.11+ LSP configuration
  local function setup_lsp()
    vim.o.updatetime = 250
    vim.api.nvim_create_autocmd("CursorHold", {
      -- buffer = bufnr,
      callback = function()
        local opts = {
          focusable = false,
          close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
          border = 'rounded',
          source = 'always',
          prefix = ' ',
          scope = 'line',
        }
        vim.diagnostic.open_float(nil, opts)
      end
    })

    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(client, bufnr)
      client.server_capabilities.semanticTokensProvider = nil
      -- Mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local bufopts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
      vim.keymap.set('n', 'gK', vim.lsp.buf.hover, bufopts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    end

    local icons = _G.icons

    -- Configure global LSP settings for all servers
    vim.lsp.config('*', {
      on_attach = on_attach
    })

    -- Configure lua_ls with custom settings
    vim.lsp.config.lua_ls = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          },
          runtime = {
            version = 'LuaJIT'
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false
          }
        }
      }
    }

    vim.lsp.config.pyright = {
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
            diagnosticSeverityOverrides = {}
          }
        }
      }
    }

    vim.diagnostic.config({
      virtual_text = false,
      update_in_insert = true,
      underline = true,
      severity_sort = true,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = icons.Error,
          [vim.diagnostic.severity.WARN] = icons.Warning,
          [vim.diagnostic.severity.INFO] = icons.Info,
          [vim.diagnostic.severity.HINT] = icons.Hint,
        },
      },
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = true,
        header = "",
        prefix = "",
      },
    })
  end

  -- Call the setup function
  setup_lsp()
end

return M
