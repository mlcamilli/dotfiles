local null_ls = require('null-ls')

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
    debug = true,
    sources = {
        null_ls.builtins.formatting.isort.with({
            extra_args = {'--profile=black'}
        }),
        null_ls.builtins.formatting.black.with({
            extra_args = {'--line-length', '120'}
        }),
    },
   on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    vim.lsp.buf.format({bufnr = bufnr})
                end,
            })
        end
    end,
})
