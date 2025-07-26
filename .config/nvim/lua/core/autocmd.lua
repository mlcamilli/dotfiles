local cmd = vim.cmd
local api = vim.api

-- Automatically open quickfix
cmd([[
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
]])

--
-- Delte trailing white space
cmd([[autocmd BufWritePre * :%s/\s\+$//e]])


api.nvim_create_autocmd("BufWritePre", {
  callback = function(args)
    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
    -- vim.lsp.buf.format({async = False})
    require("conform").format({ bufnr = args.buf, lsp_fallback = true })
    -- On python files call organize imports on save
    if vim.bo[args.buf].filetype == 'python' then
      vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
    end
  end,
})

api.nvim_create_autocmd("CursorHold", {
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
api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup('lsp_attach_disable_ruff_hover', { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client == nil then
      return
    end
    if client.name == 'ruff' then
      -- Disable hover in favor of Pyright
      client.server_capabilities.hoverProvider = false
    end
  end,
  desc = 'LSP: Disable hover capability from Ruff',
})
