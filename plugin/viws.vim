vim9script
# --------------------------------------------------------------
# Plugin name:   ViWS
# Maintainer:    arfanamd
# Version:       v1.0.2
#
# License:
# Distributed under the same terms as Vim itself.
# Copyright (c) 2022 arfanamd and contributors.
# See ":help license" in Vim.
# --------------------------------------------------------------

# Color profile
hi clear TabLine
hi clear TabLineSel
hi clear TabLineFill
hi TabLine     ctermbg=NONE  ctermfg=254  cterm=NONE  guibg=NONE     guifg=#e4e4e4  gui=NONE
hi TabLineSel  ctermbg=250   ctermfg=237  cterm=BOLD  guibg=#bcbcbc  guifg=#3a3a3a  gui=BOLD
hi TabLineFill ctermbg=NONE  ctermfg=078  cterm=BOLD  guibg=NONE     guifg=#5fd787  gui=BOLD

# Global options
g:viws_IconEndDisplay     = ""
g:viws_IconMultiWindow    = "M"
g:viws_IconModifBuffer    = "+"
g:viws_IconTrimFileName   = "<"
g:viws_NameDisplayWidth   = 35
g:viws_WorkSpaceSeparator = "|"

def Padding(length: number): string
	var test: string = ""
	var gap: number  = g:viws_NameDisplayWidth - length

	if gap > 1
		for i in range(1, gap)
			test ..= " "
		endfor
	endif

	return test
enddef

def g:VimWorkSpace(): string
	var contents: string = ""
	var currIndex: number = tabpagenr()
	var components = {}

	# A single workspace can have more than one opened window.
	# These three variables are used to keep track all of them.
	components['BufList'] = tabpagebuflist(currIndex)
	components['WinIndx'] = tabpagewinnr(currIndex)
	components['BufIndx'] = components['BufList'][components['WinIndx'] - 1]

	# Get the file name, length of the name, and file type.
	components['BufName'] = fnamemodify(bufname(components['BufIndx']), ':t')
	components['NameLen'] = strlen(components['BufName'])
	components['BufType'] = getbufvar(components['BufIndx'], '&buftype')

	# Left padd for placing multiple window indicator and file name
	# trimmed indicator.
	const pre_space: number = 4
	var padd_left: string   = "    "

	# Right padd for placing modified file indicator.
	var padd_right: string  = ""

	var buff_name: string   = components['BufName']
	var name_length: number = components['NameLen']

	# Vim has several types of special buffers. Some of them do not
	# have file name or buffer type or even both.
	if components['NameLen'] == 0

		# Set the buffer name for some special buffer types.
		if components['BufType'] == ""
			buff_name = "[no name]"
			name_length = 9
		elseif components['BufType'] == "quickfix"
			buff_name = "[quick-fix]"
			name_length = 11
		endif

	# File name that doesn't fit the g:viws_NameDisplayWidth will
	# be cut to fit the g:viws_NameDisplayWidth.
	elseif components['NameLen'] >= g:viws_NameDisplayWidth

		var offset: number = (components['NameLen'] - g:viws_NameDisplayWidth) + pre_space + 2
		buff_name = substitute(components['BufName'], '^.\{' .. offset .. '\}', '', '')
		name_length = strlen(buff_name)

		# Give the indicator that the file name is getting trimmed.
		padd_left = substitute(padd_left, '.$', g:viws_IconTrimFileName, '')

	else

		# Help page is an example of special buffer type that also
		# have file name.
		if components['BufType'] == "help"
			buff_name = "[help]"
			name_length = 6
		endif
	endif

	# Add the right padding.
	padd_right = Padding(name_length + pre_space)

	# If a single workspace have multiple window open.
	if len(components['BufList']) > 1
		padd_left = substitute(padd_left, '^..', " " .. g:viws_IconMultiWindow, '')
	endif

	# If the file being modified.
	if getbufvar(components['BufIndx'], '&modified') == true
		padd_right = substitute(padd_right, '.$', g:viws_IconModifBuffer, '')
	endif

	contents ..= "%#TabLineSel#"
	contents ..= padd_left
	contents ..= buff_name
	contents ..= padd_right
	contents ..= "%#TabLine#"
	contents ..= g:viws_IconEndDisplay
	contents ..= "%="
	contents ..= g:viws_WorkSpaceSeparator

	for workspace in range(1, tabpagenr('$'))
		if workspace == currIndex
			contents ..= "%#TabLineFill#[" .. workspace .. "]%#TabLine#"
		else
			contents ..= "[" .. workspace .. "]"
		endif

		contents ..= g:viws_WorkSpaceSeparator
	endfor

	return contents
enddef

## vim:ts=2
