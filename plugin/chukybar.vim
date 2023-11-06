vim9script
# --------------------------------------------------------------
#  Plugin name:   Chukybar
#  Maintainer:    arfanamd
#  Version:       1.0.7
#
#  License:
#  Distributed under the same terms as Vim itself.
#  Copyright (C) 2022 arfanamd and contributors.
#  See ":help license" in Vim.
# --------------------------------------------------------------

# Color profile for dark background
hi cbFilename  ctermbg=008  ctermfg=015  cterm=BOLD
hi cbBuffprop  ctermbg=004  ctermfg=015  cterm=BOLD
hi cbLinecpos  ctermbg=012  ctermfg=000  cterm=BOLD
hi cbFiletype  ctermbg=008  ctermfg=002  cterm=BOLD
hi cbHelpbuff  ctermbg=002  ctermfg=000  cterm=NONE
hi cbQuickfix  ctermbg=001  ctermfg=007  cterm=BOLD

# XXX: This plugin uses couple of Unicode characters.  Some of
#      them might not work on your end, it depend on the font
#      you're using.

def g:Activebuf(): string
	var barline: string

	barline ..= "%#Normal# %#cbFilename# %<%f"
	barline ..= &modified == true ? "+ " : " "
	barline ..= "%r%h%=%#cbFiletype#"
	barline ..= &filetype == "" ? "- " : "%Y "
	barline ..= "%#cbBuffprop# %L:%P "
	barline ..= "%#cbLinecpos# ☰ %l:%v "
	barline ..= "%#cbFilename# %{&ff} %#Normal#"

	return barline
enddef

def g:Inactivebuf(): string
	var barline: string

	barline ..= "%#Normal# %#cbFilename# %<%f"
	barline ..= &modified == true ? "+ " : " "
	barline ..= " %=[HOLDED]"
	barline ..= " %#Normal# "

	return barline
enddef

def g:Quickfixbuf(): string
	var barline: string

	barline ..= "%#Normal# %#cbFilename# QuickFix Debug Report "
	barline ..= "%=%#cbQuickfix# %l report %#Normal# "

	return barline
enddef

def g:Helppagebuf(): string
	var barline: string

	barline ..= "%#Normal# %#cbHelpbuff# [HELP] "
	barline ..= "%#cbFilename#  %<%f  %=  %P  %L "
	barline ..= "%#Normal# "

	return barline
enddef

augroup Statusbar
	autocmd!
	# TODO: fix statusline for text file.
	autocmd FileType qf setlocal statusline=%!Quickfixbuf()
	autocmd FileType help setlocal statusline=%!Helppagebuf()
	autocmd BufAdd,BufEnter,WinEnter,FileType text setlocal statusline=%!Activebuf()
	#autocmd WinLeave,FileType text setlocal statusline=%!Inactivebuf()
	autocmd BufAdd,BufLeave,WinLeave \w*[^t],\d*[^t],\w*.[^t]*,\d*.[^t]* setlocal statusline=%!Inactivebuf()
	autocmd BufAdd,BufEnter,WinEnter \w*[^t],\d*[^t],\w*.[^t]*,\d*.[^t]* setlocal statusline=%!Activebuf()
augroup END

## vim:ts=2
