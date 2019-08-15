let g:test#strategy = 'dispatch' " To use quickfix
let g:test#php#phpunit#options = {
  \ 'nearest': '--no-coverage',
  \ 'file':    '--no-coverage',
  \}

augroup Test
  autocmd!
  autocmd BufNewFile,BufRead *Test.php :compiler phpunit
augroup END

let g:dispatch_compilers = {
  \ './bin/phpunit': 'phpunit',
  \ './vendor/bin/phpunit': 'phpunit',
  \}
