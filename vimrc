" Gasol Wu <gasol.wu@gmail.com>
" https://github.com/gasol/vimrc

set nocompatible

set t_Co=256
set history=50
set number
set ruler

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,big5,gb2312

set modeline
set background=dark
set backspace=indent,eol,start
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

set incsearch
set hlsearch

syntax on

filetype off

set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-haml'
Bundle 'msanders/snipmate.vim'
Bundle '2072/PHP-Indenting-for-VIm'
Bundle 'millermedeiros/vim-statline'
Bundle 'tpope/vim-fugitive'
Bundle 'taglist.vim'
Bundle 'sukima/xmledit'
Bundle 'majutsushi/tagbar'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'Gasol/vim-php'
set wildignore+=*/vim-php/doc/*
Bundle 'jnwhiteh/vim-golang'
Bundle 'stephpy/vim-php-cs-fixer'
Bundle 'gnuchangelog'

filetype plugin indent on

" python syntax highlight
let python_highlight_all = 1
let python_sync_slow = 1

" autocomplete
autocmd FileType py set omnifunc=pythoncomplete
autocmd FileType python syntax keyword pythonDecorator True None False self
autocmd FileType css set omnifunc=csscomplete
autocmd BufNewFile,BufRead *.go set filetype=go sw=4 ts=4
autocmd BufNewFile,BufRead *.mako set filetype=mako
autocmd BufNewFile,BufRead *.gradle set filetype=groovy
autocmd BufNewFile,BufRead *.thrift if &ft == 'conf' | set filetype=thrift
autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufNewFile,BufRead *.md set filetype=markdown

map th :tabprev<CR>
map tl :tabnext<CR>
nnoremap <silent> <F12> :TlistToggle<CR>

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

let NERDTreeIgnore=['\~$', '\.lo$', '\.la$']

let Tlist_Use_Right_Window = 1
let os = substitute(system('uname'), "\n", "", "")
if os == "FreeBSD"
	let Tlist_Ctags_Cmd = "/usr/local/bin/exctags"
endif

let g:vundle_default_git_proto = 'git'
let g:changelog_username = 'Gasol Wu <gasol.wu@gmail.com>'

if filereadable($HOME.'/.vimrc_local')
	source $HOME/.vimrc_local
endif

comm! W exec 'w !sudo tee % > /dev/null' | e!
