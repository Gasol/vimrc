" Gasol Wu <gasol.wu@gmail.com>
" https://github.com/gasol/vimrc

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

execute 'source ' . fnamemodify(expand('<sfile>'), ':p:h') . '/rc/vimrc'
