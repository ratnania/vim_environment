" Vim syntax file
" Language: Vale 
" Maintainer: Ahmed Ratnani
" Latest Revision: 31 August 2016

if exists("b:current_syntax")
  finish
endif

syn keyword valeLanguageKeywords Space TrialFunction TestFunction 
syn keyword valeLanguageKeywords Equation Domain 
syn keyword valeLanguageKeywords Integer Real Complex 
syn keyword valeLanguageKeywords Field 
syn keyword valeLanguageStmts    kind dim domain space end function return 

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

highlight link potionOperator Operator
