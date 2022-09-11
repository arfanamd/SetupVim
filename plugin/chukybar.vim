vim9script
# --------------------------------------------------------------
#  Plugin name:   Chukybar
#  Maintainer:    arfanamd
#  Version:       1.0.6
#
#  License:
#  Distributed under the same terms as Vim itself.
#  Copyright (C) 2022 arfanamd and contributors.
#  See ":help license" in Vim.
# --------------------------------------------------------------

# Color profile for dark background
hi cbNameField ctermbg=237  ctermfg=254  cterm=BOLD  guibg=#3a3a3a  guifg=#e4e4e4  gui=BOLD
hi cbSepIcn1   ctermbg=237  ctermfg=037  cterm=BOLD  guibg=#3a3a3a  guifg=#00afaf  gui=BOLD
hi cbLineSize  ctermbg=037  ctermfg=237  cterm=BOLD  guibg=#00afaf  guifg=#3a3a3a  gui=BOLD
hi cbSepIcn2   ctermbg=037  ctermfg=031  cterm=BOLD  guibg=#00afaf  guifg=#0087af  gui=BOLD
hi cbCursorPos ctermbg=031  ctermfg=254  cterm=BOLD  guibg=#0087af  guifg=#e4e4e4  gui=BOLD
hi cbSepIcn3   ctermbg=031  ctermfg=237  cterm=BOLD  guibg=#0087af  guifg=#3a3a3a  gui=BOLD
hi cbFileType  ctermbg=237  ctermfg=078  cterm=BOLD  guibg=#3a3a3a  guifg=#5fd787  gui=BOLD
hi cbHelpMark  ctermbg=079  ctermfg=237  cterm=BOLD  guibg=#5fd7af  guifg=#3a3a3a  gui=BOLD
hi cbQuickfix  ctermbg=167  ctermfg=254  cterm=BOLD  guibg=#d75f5f  guifg=#e4e4e4  gui=BOLD

# XXX: This plugin uses couple of Unicode characters.  Some of
#      them might not work on your end, it depend on the font
#      that you're using.

def g:Activebuf(): string
	var barline: string

	barline ..= "%#Normal# %#cbNameField# %<%f"
	barline ..= &modified == true ? "+ " : " "
	barline ..= "%r%h%= "
	barline ..= "%#cbSepIcn1#%#cbLineSize# %L:%P "
	barline ..= "%#cbSepIcn2#%#cbCursorPos# ☰ %l:%c "
	barline ..= "%#cbSepIcn3#◀%#cbFileType# "
	barline ..= &filetype == "" ? "-" : "%Y"
	barline ..= " %#Normal# "

	return barline
enddef

def g:Inactivebuf(): string
	var barline: string

	barline ..= "%#Normal# %#cbNameField# %<%f"
	barline ..= &modified == true ? "+ " : " "
	barline ..= " %=[HOLDED]"
	barline ..= " %#Normal#  "

	return barline
enddef

def g:Quickfixbuf(): string
	var barline: string

	barline ..= "%#Normal# %#cbNameField# QuickFix Debug Report "
	barline ..= "%=%#cbQuickfix# %l report %#Normal# "

	return barline
enddef

def g:Helppagebuf(): string
	var barline: string

	barline ..= "%#Normal# %#cbHelpMark# [HELP] "
	barline ..= "%#cbNameField#  %<%f  %=  %P  %L "
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
