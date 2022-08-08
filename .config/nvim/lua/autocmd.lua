local cmd = vim.cmd


cmd([[
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
]])

-- Delte trailing white space
cmd([[autocmd BufWritePre * :%s/\s\+$//e]])
