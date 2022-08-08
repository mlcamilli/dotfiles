local cmd = vim.cmd


-- Highlight the symbol and its references when holding the cursor.
cmd([[
autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd BufRead,BufEnter *.astro set filetype=astro
]])

-- autocmd BufWritePre *.py :call CocAction('format')
-- autocmd BufWritePre *.py :CocCommand python.sortImports

cmd([[
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
]])

-- Delte trailing white space
cmd([[autocmd BufWritePre * :%s/\s\+$//e]])
