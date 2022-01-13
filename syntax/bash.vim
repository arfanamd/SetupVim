" Vim syntax file
" Language:	bash
" Maintainer:	Bram
" Last Change:	2019 Sep 27

" quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" The actual syntax is in sh.vim and controlled by buffer-local variables.
unlet! b:is_sh
unlet! b:is_kornshell
let b:is_bash = 1

runtime! syntax/sh.vim

let b:current_syntax = 'bash'
"#5f87f4afcbff
"----- sh/bash edited syntax -----" {{{
hi shComment		guifg=#80a0ff cterm=none
hi shString		guifg=#ffa0a0 cterm=none
hi shStatement		guifg=#ffff87 cterm=none
hi shSetList		guifg=#ff5f00 cterm=none
hi shFunction		guifg=#4afcbf cterm=none
hi shSpecial		guifg=#deeeee cterm=none
hi shArithmetic		guifg=#eeeeee cterm=none
hi shShellVariables	guifg=#87ff00 cterm=none

hi link shCommandSub	shSpecial
hi link shNumber	shString
hi link shOperato	shStatement
hi link shVariabl	shSetList
hi link shAlias		shFunction
hi link shSpecial	shCommandSub
hi link shSpecial	shCommandSub
hi link shOption	shCommandSub
hi link shEscape	shCommandSub
hi link shCtrlSeq	shCommandSub
" }}}

" vim: ts=8
