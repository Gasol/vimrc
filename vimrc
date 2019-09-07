" Gasol Wu <gasol.wu@gmail.com>
" https://github.com/gasol/vimrc

" dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('wsdjeg/dein-ui.vim')
  call dein#add('2072/PHP-Indenting-for-VIm')
  call dein#add('Xuyuanp/nerdtree-git-plugin')
  call dein#add('Yggdroot/LeaderF', { 'build': './install.sh' })
  call dein#add('Yggdroot/indentLine')
  call dein#add('alvan/vim-php-manual')
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('fs111/pydoc.vim')
  call dein#add('garbas/vim-snipmate')
  call dein#add('haginaga/vim-compiler-phpunit')
  call dein#add('itchyny/lightline.vim')
  call dein#add('janko-m/vim-test')
  call dein#add('jeffkreeftmeijer/vim-numbertoggle')
  call dein#add('joonty/vdebug')
  call dein#add('ludovicchabant/vim-gutentags')
  call dein#add('majutsushi/tagbar')
  call dein#add('michaeljsmith/vim-indent-object')
  call dein#add('ntpeters/vim-better-whitespace')
  call dein#add('rayburgemeestre/phpfolding.vim')
  call dein#add('rking/ag.vim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('shawncplus/phpcomplete.vim')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('skywind3000/asyncrun.vim')
  call dein#add('sukima/xmledit')
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-cucumber')
  call dein#add('tpope/vim-dispatch')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-git')
  call dein#add('tpope/vim-projectionist')
  call dein#add('tpope/vim-repeat')
  call dein#add('tpope/vim-scriptease')
  call dein#add('tpope/vim-sensible')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-unimpaired')
  call dein#add('vim-scripts/EasyMotion')
  call dein#add('vim-scripts/Efficient-python-folding')
  call dein#add('vim-scripts/taglist.vim')
  call dein#add('vimwiki/vimwiki')
  call dein#add('vim-scripts/wombat256.vim')

  " vim-snipmate dependencies
  call dein#add('MarcWeber/vim-addon-mw-utils')
  call dein#add('tomtom/tlib_vim')
  call dein#add('honza/vim-snippets')

  call dein#add('mhinz/vim-signify')
  call dein#add('dense-analysis/ale')
  call dein#add('neoclide/coc.nvim', {'build': 'yarn install --frozen-lockfile'})

  if has('nvim')
    call dein#add('Shougo/deoplete.nvim', { 'hook_post_update': ':UpdateRemotePlugins' })
  else
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------
"
set t_Co=256
set number relativenumber
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,big5,gb2312,sjis
set hlsearch
set modeline
set background=dark
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set noshowmode
set updatetime=300
set shortmess+=c

colorscheme wombat256mod

let g:coc_global_extensions = ['coc-phpls', 'coc-json', 'coc-snippets', 'coc-tsserver', 'coc-tslint', 'coc-eslint']

" autocomplete
augroup MyCustomFileType
  autocmd FileType css setl omnifunc=csscomplete
  autocmd FileType perl setl sw=4 ts=4 et
  autocmd FileType c setl sw=4 ts=4 et
  autocmd BufNewFile,BufRead *.go setl filetype=go sw=4 ts=4
  autocmd BufNewFile,BufRead *.mako setl filetype=mako
  autocmd BufNewFile,BufRead *.gradle setl filetype=groovy sw=4 ts=4 et
  autocmd BufNewFile,BufRead *.thrift if &ft == 'conf' | setl filetype=thrift
  autocmd BufNewFile,BufRead *.md setl filetype=markdown
augroup end

map th :tabprev<CR>
map tl :tabnext<CR>
nnoremap <silent> <F12> :TlistToggle<CR>

let NERDTreeIgnore=['\~$', '\.lo$', '\.la$', '\.pyc']
let NERDTreeMinimalUI=1

let Tlist_Use_Right_Window = 1
let os = substitute(system('uname'), '\n', '', '')
if os ==# 'FreeBSD'
	let Tlist_Ctags_Cmd = '/usr/local/bin/exctags'
endif

let g:changelog_username = 'Gasol Wu <gasol.wu@gmail.com>'

if filereadable($HOME.'/.vimrc_local')
	source $HOME/.vimrc_local
endif
let g:vdebug_options = {
\ 'port': 9003,
\ 'ide_key': 'gasolwu',
\ 'proxy_host': '',
\ 'proxy_port': 0,
\ }

comm! W exec 'w !sudo tee % > /dev/null' | e!

if executable('universal-ctags')
	let g:gutentags_ctags_executable = 'universal-ctags'
	let g:Lf_Ctags = 'universal-ctags'
endif

set tags=./.tags;,.tags
let g:gutentags_ctags_tagfile='.ctags'
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
let g:asyncrun_open = 8
let g:ale_virtualtext_cursor = 1
set statusline+=%{gutentags#statusline()}

let g:projectionist_heuristics = {
\   'tests/&phpunit.xml|phpunit.xml.dist': {
\     'src/*.php': {
\       'alternate': 'tests/{}Test.php',
\       'type': 'source'
\     },
\     'tests/*Test.php': {
\       'alternate': 'src/{}.php',
\       'type': 'test'
\     }
\   }
\ }

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
\  'colorscheme': 'wombat',
\  'active': {
\    'left': [ [ 'mode', 'paste' ],
\              [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
\  },
\  'component_function': {
\    'cocstatus': 'coc#status',
\    'currentfunction': 'CocCurrentFunction'
\  }
\}

nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
