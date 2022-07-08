" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd BufRead,BufEnter *.astro set filetype=astro

"autocmd BufWritePre *.py :call CocAction('format')
"autocmd BufWritePre *.py :CocCommand python.sortImports

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" ES6 HTML Highlighting
autocmd FileType javascript JsPreTmpl html

"Delte trailing white space
autocmd BufWritePre * :%s/\s\+$//e
