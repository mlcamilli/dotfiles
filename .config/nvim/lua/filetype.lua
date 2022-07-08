--- Probably not needed`" File Specific Spacing
autocmd Filetype python setlocal ts=4 sts=4 sw=4 colorcolumn=120
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab


--- Set Markdown Format for .md files
au BufRead,BufNewFile *.md set filetype=markdown
--- Set HTML format for .template files
au BufRead,BufNewFile *.template set filetype=html
au BufRead,BufNewFile *.astro set filetype=astro
