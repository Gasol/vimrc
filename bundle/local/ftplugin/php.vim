set expandtab
set shiftwidth=4
set softtabstop=4

syntax keyword phpConstant __DIR__ contained
syntax keyword phpFunctions spl_autoload_register get_called_class contained
syntax keyword phpSpecialFunction containedin=ALLBUT,phpComment,phpStringDouble,phpStringSingle,phpIdentifier
  \ __callStatic __invoke namespace use
