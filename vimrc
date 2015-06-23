" Gasol Wu <gasol.wu@gmail.com>
" https://github.com/gasol/vimrc

set nocompatible

set t_Co=256
set history=50
set number
set ruler

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,big5,gb2312,sjis

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

Plugin 'gmarik/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-surround'
Plugin 'garbas/vim-snipmate'
Plugin '2072/PHP-Indenting-for-VIm'
Plugin 'millermedeiros/vim-statline'
Plugin 'tpope/vim-fugitive'
Plugin 'taglist.vim'
Plugin 'sukima/xmledit'
Plugin 'majutsushi/tagbar'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'Gasol/vim-scripts'
Plugin 'Gasol/vim-php'
Plugin 'tpope/vim-cucumber'
set wildignore+=*/vim-php/doc/*
Plugin 'fatih/vim-go'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'gnuchangelog'
Plugin 'sprsquish/thrift.vim'
Plugin 'fs111/pydoc.vim'
Plugin 'Efficient-python-folding'
Plugin 'tpope/vim-markdown'
Plugin 'nathanaelkane/vim-indent-guides'
let g:indent_guides_guide_size = 1
Plugin 'EasyMotion'
Plugin 'joonty/vdebug'
Plugin 'xml.vim'

" vim-snipmate dependencies
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'

filetype plugin indent on

" python syntax highlight
let python_highlight_all = 1
let python_sync_slow = 1

" autocomplete
autocmd FileType py setl omnifunc=pythoncomplete
autocmd FileType python syntax keyword pythonDecorator True None False self
autocmd FileType python setl sw=4 ts=4 sts=4 tw=120 sta et nosi
autocmd FileType css setl omnifunc=csscomplete
autocmd FileType perl setl sw=4 ts=4 et
autocmd FileType c setl sw=4 ts=4 et
autocmd BufNewFile,BufRead *.go setl filetype=go sw=4 ts=4
autocmd BufNewFile,BufRead *.mako setl filetype=mako
autocmd BufNewFile,BufRead *.gradle setl filetype=groovy sw=4 ts=4 et
autocmd BufNewFile,BufRead *.thrift if &ft == 'conf' | setl filetype=thrift
autocmd BufNewFile,BufRead *.json setl ft=javascript sw=4 ts=4 et
autocmd BufNewFile,BufRead *.md setl filetype=markdown

map th :tabprev<CR>
map tl :tabnext<CR>
nnoremap <silent> <F12> :TlistToggle<CR>

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

let NERDTreeIgnore=['\~$', '\.lo$', '\.la$', '\.pyc']

let Tlist_Use_Right_Window = 1
let os = substitute(system('uname'), "\n", "", "")
if os == "FreeBSD"
	let Tlist_Ctags_Cmd = "/usr/local/bin/exctags"
endif

let g:vundle_default_git_proto = 'git'
let g:changelog_username = 'Gasol Wu <gasol.wu@gmail.com>'

let g:gitgutter_enabled = 0

if filereadable($HOME.'/.vimrc_local')
	source $HOME/.vimrc_local
endif

comm! W exec 'w !sudo tee % > /dev/null' | e!
