" dein configurations.

if has('vim_starting')
    let s:cache_dir = expand('~/.cache')
    if !isdirectory(s:cache_dir)
        call mkdir(s:cache_dir, 'p')
    endif

    let s:dein_dir = finddir('dein.vim', '.;')
    if s:dein_dir !=# '' || &runtimepath !~# '/dein.vim'
        if s:dein_dir ==# '' && &runtimepath !~# '/dein.vim'
            let s:dein_dir = s:cache_dir . '/dein/repos/github.com/Shougo/dein.vim'
            if !isdirectory(s:dein_dir)
                execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
            endif
        endif
        execute 'set runtimepath^=' . substitute(
            \ fnamemodify(s:dein_dir, ':p') , '/$', '', '')
    endif

    let g:dein#auto_recache = 1
    let g:dein#install_progress_type = 'title'
    let g:dein#install_log_filename = '~/dein.log'

    let s:path = s:cache_dir . '/dein'
    if !dein#load_state(s:path)
      finish
    endif

    let s:dein_toml = '~/.vim/rc/dein.toml'
    call dein#begin(s:path, [expand('<sfile>'), s:dein_toml])
        call dein#load_toml(s:dein_toml, {'lazy': 0})
    call dein#end()
    call dein#save_state()
endif

if !has('vim_starting') && dein#check_install()
  " Installation check.
  call dein#install()
endif
