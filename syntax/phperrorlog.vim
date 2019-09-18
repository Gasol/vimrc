" Language: PHP error log file
" Maintainer: Gasol Wu <gasol.wu@gmail.com>

if exists('b:current_syntax')
  finish
endif

let s:cpo_save = &cpoptions
set cpoptions&vim

syntax clear
syntax case match

syntax keyword phpErrorlogSeverityWarning    contained Warning

syntax keyword phpErrorlogSeverityNotice     contained Notice

syntax keyword phpErrorlogSeverityDeprecated contained Deprecated

syntax match   phpErrorlogSeverityError      contained 'Fatal error'

syntax match   phpErrorlogSeverityStrict     contained 'Strict standards'

syntax cluster phpErrorlogSeverities         contains=phpErrorlogSeverityWarning
                                                   \ ,phpErrorlogSeverityNotice
                                                   \ ,phpErrorlogSeverityStrict
                                                   \ ,phpErrorlogSeverityError
                                                   \ ,phpErrorlogSeverityNotice

syntax match   phpErrorlogBegin display '^'
      \ nextgroup=phpErrorlogDateTime

syntax match   phpErrorlogDateTime           contained skipwhite /^\[[^]]\+\]/
      \ nextgroup=phpErrorlogTag

syntax keyword phpErrorlogTag                contained skipwhite PHP
      \ nextgroup=phpErrorlogSeverity,phpErrorlogStacktrace

syntax match   phpErrorlogSeverity           contained skipwhite '[a-zA-Z ]\+:\s\+'
      \ nextgroup=phpErrorlogSubject contains=@phpErrorlogSeverities

syntax match   phpErrorlogSubject            contained '.*'
      \ contains=phpErrorlogPhpFileInSubject,phpErrorlogSubjectLineNumber

syntax match   phpErrorlogStacktrace         contained '\(Stack trace:\|\s*\d\+\.\).*'
      \ contains=phpErrorlogSequenceNumber,phpErrorlogPhpFile

syntax match   phpErrorlogSequenceNumber     contained /\d\+\. /

syntax match   phpErrorlogPhpFile            contained /\v\/\S+\.php/
      \ nextgroup=phpErrorlogPhpFileLocation

syntax match   phpErrorlogPhpFileInSubject   contained /\v\/\S+\.php/
      \ nextgroup=phpErrorlogPhpFileLocation

syntax match   phpErrorlogPhpFileLocation    contained /:\d\+/

syntax match   phpErrorlogLineNumber         contained /\d\+/

syntax match   phpErrorlogSubjectLineNumber  contained /on line \d\+/
      \ contains=phpErrorlogLineNumber

highlight  link  phpErrorlogDateTime            Statement
highlight  link  phpErrorlogTag                 Constant
highlight  link  phpErrorlogSeverityStrict      Special
highlight  link  phpErrorlogSeverityNotice      Special
highlight  link  phpErrorlogSeverityDeprecated  Special
highlight  link  phpErrorlogSeverityWarning     Todo
highlight  link  phpErrorlogSeverityError       Error
highlight  link  phpErrorlogPhpFileInSubject    String
highlight  link  phpErrorlogLineNumber          Number
highlight  link  phpErrorlogPhpFileLocation     Number
highlight  link  phpErrorlogSubjectLineNumber   Comment
highlight  link  phpErrorlogSequenceNumber      Number

let b:current_syntax = 'phperrorlog'

let &cpoptions = s:cpo_save
unlet s:cpo_save
