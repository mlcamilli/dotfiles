local cmd = vim.cmd
local api = vim.api


cmd([[
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
]])

-- Delte trailing white space
cmd([[autocmd BufWritePre * :%s/\s\+$//e]])


api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
        vim.lsp.buf.format({async = False})
        vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
    end,
})
