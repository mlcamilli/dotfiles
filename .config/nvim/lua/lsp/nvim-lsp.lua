
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

-- Unicode Does not Render in Windows Terminal for whatever fucking reason
-- local border = {
--       {"🭽", "FloatBorder"},
--       {"▔", "FloatBorder"},
--       {"🭾", "FloatBorder"},
--       {"▕", "FloatBorder"},
--       {"🭿", "FloatBorder"},
--       {"▁", "FloatBorder"},
--       {"🭼", "FloatBorder"},
--       {"▏", "FloatBorder"},
-- }
--
-- local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
-- function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
--   opts = opts or {}
--   -- opts.border = opts.border or border
--   opts.border = border
--   return orig_util_open_floating_preview(contents, syntax, opts, ...)
-- end



-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gK', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end
local icons = _G.icons

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = {
    pyright = {
        on_init = function(client)
            local path = vim.fn.getcwd()
            -- Project specific overrides can go here, % to escape any characters
            if string.find(path, 'rhythm%-app') then
                client.config.settings.python.analysis.diagnosticSeverityOverrides = {reportMissingImports = "none"}
                client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
            end
            return true
        end,
        settings = {
            python = {
                analysis = {
                    diagnosticSeverityOverrides = {
                    }
                }
            }
        }
    },
    tsserver = {},
    rust_analyzer = {},
    sumneko_lua =  {
        settings = {
            Lua = {
                diagnostics = {
                    globals = {'vim'}
                },
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                },
            }
        }
    },
    astro = {},
    cmake = {},
    tailwindcss = {},
    terraformls = {}
}

local lsp_config = require('lspconfig')
for name, user_opts in pairs(servers) do
	local lsp_opts = {
		on_attach = on_attach,
		capabilities = capabilities,
	}

	lsp_opts = vim.tbl_deep_extend("force", lsp_opts, user_opts)
	lsp_config[name].setup(lsp_opts)
end

vim.fn.sign_define('DiagnosticSignError',
    { text = icons.Error, texthl = 'DiagnosticSignError' }
)
vim.fn.sign_define('DiagnosticSignWarn',
    { text = icons.Warning, texthl = 'DiagnosticSignWarn' }
)
vim.fn.sign_define('DiagnosticSignInfo',
    { text = icons.Info, texthl = 'DiagnosticSignInfo' }
)
vim.fn.sign_define('DiagnosticSignHint',
    { text = icons.Hint, texthl = 'DiagnosticSignHint' }
)
vim.diagnostic.config({
    virtual_text = false,
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})
