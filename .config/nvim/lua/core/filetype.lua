local cmd = vim.cmd -- execute Vim commands
--- Probably not needed`" File Specific Spacing
cmd([[
autocmd Filetype python setlocal ts=4 sts=4 sw=4 colorcolumn=120
autocmd Filetype lua setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
]])


--- Set Markdown Format for .md files
cmd([[
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.template set filetype=html
au BufRead,BufNewFile *.astro set filetype=astro
au BufRead,BufNewFile *.yml set filetype=yaml
au BufRead,BufNewFile *.yml* set filetype=yaml
]])
