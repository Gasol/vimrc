autocmd BufNewFile,BufRead *.php set keywordprg="help"
autocmd BufNewFile,BufRead *.phpt set ft=php
autocmd FileType php set omnifunc=phpcomplete
