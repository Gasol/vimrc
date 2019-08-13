" Gasol Wu <gasol.wu@gmail.com>
" https://github.com/gasol/vimrc

set nocompatible

set t_Co=256
set number relativenumber

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,big5,gb2312,sjis
set hlsearch
set modeline
set background=dark
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

syntax on

filetype off

call plug#begin('~/.vim/plugged')

Plug '2072/PHP-Indenting-for-VIm'
Plug 'Gasol/vim-scripts'
Plug 'StanAngeloff/php.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-php-manual'
Plug 'derekwyatt/vim-scala'
Plug 'digitaltoad/vim-pug'
Plug 'editorconfig/editorconfig-vim'
Plug 'fatih/vim-go'
Plug 'fs111/pydoc.vim'
Plug 'garbas/vim-snipmate'
Plug 'itchyny/lightline.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'joonty/vdebug'
Plug 'kchmck/vim-coffee-script'
Plug 'kien/ctrlp.vim'
Plug 'kylef/apiblueprint.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'millermedeiros/vim-statline'
Plug 'rayburgemeestre/phpfolding.vim'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'shawncplus/phpcomplete.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'sukima/xmledit'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/EasyMotion'
Plug 'vim-scripts/Efficient-python-folding'
Plug 'vim-scripts/taglist.vim'
Plug 'vim-scripts/xml.vim'

" vim-snipmate dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'honza/vim-snippets'

Plug 'mhinz/vim-signify'
Plug 'dense-analysis/ale'

call plug#end()

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
let NERDTreeMinimalUI=1

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
let g:vdebug_options = {
\ "port": 9003,
\ "ide_key": 'gasolwu',
\ "proxy_host": '',
\ "proxy_port": 0,
\ }

comm! W exec 'w !sudo tee % > /dev/null' | e!

set tags=./.tags;,.tags
let g:gutentags_ctags_tagfile='.ctags'
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
let g:asyncrun_open = 8
set statusline+=%{gutentags#statusline()}
