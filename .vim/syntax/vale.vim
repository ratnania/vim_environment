" Vim syntax file
" Language: Vale 
" Maintainer: Ahmed Ratnani
" Latest Revision: 31 August 2016

if exists("b:current_syntax")
  finish
endif

syn keyword valeLanguageKeywords Mapping Domain Space Field Function 
syn keyword valeLanguageKeywords Integer Real Complex 
syn keyword valeLanguageStmts    kind dim domain mapping space 

hi def link valeLanguageKeywords    Todo
hi def link valeLanguageKeywords    Comment
hi def link valeLanguageStmts       Statement
hi def link valeLanguageKeywords    Type
hi def link valeLanguageKeywords    Constant
hi def link valeLanguageKeywords    PreProc

syntax region potionString start=/\v"/ skip=/\v\\./ end=/\v"/
syntax region potionString start=/\v'/ skip=/\v\\./ end=/\v'/
highlight link potionString String

syntax match potionComment "\v\#.*$"
highlight link potionComment Comment

syntax match potionOperator "\v\+"
syntax match potionOperator "\v\-"
syntax match potionOperator "\v\*"
syntax match potionOperator "\v\="
syntax match potionOperator "\v\:\="
syntax match potionOperator "\v\:\:"
syntax match potionOperator "\v\<"
syntax match potionOperator "\v\>"
syntax match potionOperator "\v\{"
syntax match potionOperator "\v\}"
syntax match potionOperator "\vgrad"
syntax match potionOperator "\vcurl"
syntax match potionOperator "\vdiv"
syntax match potionOperator "\vdx"
syntax match potionOperator "\vdy"
syntax match potionOperator "\vdz"
syntax match potionOperator "\vdxx"
syntax match potionOperator "\vdyy"
syntax match potionOperator "\vdzz"
syntax match potionOperator "\vdxy"
syntax match potionOperator "\vdyz"
syntax match potionOperator "\vdxz"
syntax match potionOperator "\vcross"
syntax match potionOperator "\vinner"
syntax match potionOperator "\vouter"
syntax match potionOperator "\vdot"

highlight link potionOperator Operator
