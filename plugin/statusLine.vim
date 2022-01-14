" Language: Vim 8.0 script
" Version:	v4.0
" Project:	https://github.com/arfanamd/SetupVim
"
" popup_atcursor('', #{time: 5000, pos: 'topleft', col: 'cursor+1'})

set nocompatible
set background=dark
syntax enable

" StatusLine Walkthrough: {{{
" Available hot-keys:
" --> tn : New tab.
" --> tc : Close tab.
" --> ,w : Save the file only if it has been modified.
" --> ,q : Close the file with confirmation.
" --> ,r : Refresh the file.
" --> ,s : Switch the window with current window size.
"
" --> ,l : Goto next tab.
" --> ,L : Goto next horizontal window.
" --> ,h : Goto previous tab.
" --> ,H : Goto previous horizontal window.
" --> ,j : Goto next vertical window.
" --> ,k : Goto previous vertical window.
"
" --> ,i : Search function under the cursor from included file.
" --> ,d : Search defined variable under the cursor.
" --> F2 : Clean trailing space.
" --> F3 : Source this file to vim.
" --> F11 : Preview mode.
"
" --> ,mk : Quick compile using template compiler command.
"
" --> ,omk : Open compiler debug window.
" --> ,cmk : Close compiler debug window.
" --> ,nmk : Point next error from debug window.
" --> ,pmk : Point previous error from debug window.
" --> ,dmk : Wipe the content of debug window.
"
" --> ,spk : Speak synthesizer word under the cursor.
" --> ,skl : User template chooser.
"			 Note: Create your own template file and put it
"			       inside your "$HOME/.vim/skeleton/" directory.
" }}}

"----- set up vim features -----"
set relativenumber
set termguicolors
set noexpandtab
set cursorline
set nosmarttab
set wildmenu
set showcmd
set noruler
set list
set nowrap
"set number
set sidescrolloff=3
set numberwidth=4
set tabpagemax=5
set shiftwidth=4
set foldmethod=marker
set foldcolumn=0
set helpheight=30
set laststatus=2
set wildignore=*.o,*.so,*.jpg,*.png,*.mp3,*.mp4
set timeoutlen=5000
set scrolloff=5
set directory=/data/data/com.termux/files/home/.vim/swap/
set listchars=tab:¦▷∙,nbsp:+
set tabstop=4
set history=50
set path=.,,
"----

"----- setup custom key -----"
nnoremap tn :tabnew<CR>
nnoremap tc :tabclose<CR>
nnoremap ,r :edit<CR>
nnoremap ,l :tabnext<CR>
nnoremap ,L :wincmd l<CR>
nnoremap ,h :tabprevious<CR>
nnoremap ,H :wincmd h<CR>
nnoremap ,j :wincmd j<CR>
nnoremap ,k :wincmd k<CR>
nnoremap ,s :wincmd p<CR>30<C-W>_
nnoremap ,w :up!<CR>
nnoremap ,q :confirm q<CR>
nnoremap ,Q :confirm qa<CR>
nnoremap ,i :exe 'il /\<' . expand("<cword>") . '\>/'<CR>
nnoremap ,d :exe 'dli /' . expand("<cword>") . '/'<CR>
nnoremap <silent> <F2> mp:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>'pzz
nnoremap <silent> <F3> :source ~/.vim/plugin/statusLine.vim<CR>
nnoremap <silent> <F11> :call CleanScreenDisplay()<CR><C-l>
nnoremap <silent> ,skl :call fzf#run({'sink':'.!cat', 'source':'find $HOME/.vim/skeleton/ -name "*.template"', 'down':'25%', 'options':'-e --border=horizontal --prompt="search: " --no-info --no-unicode --no-color --no-bold --layout=reverse-list'})<CR>M
nnoremap <silent> ,dmk :call setqflist([], 'f')<CR>
nnoremap <silent> ,omk :copen<CR>
nnoremap <silent> ,cmk :cclose<CR>
nnoremap <silent> ,nmk :cnext<CR>
nnoremap <silent> ,pmk :cprevious<CR>
nnoremap <silent> ,spk :cexpr system('termux-tts-speak -e com.svox.pico -s MUSIC -p 1.3 -r 0.9 ' . expand("<cword>"))<CR>
"---

"----- Setup new highlight component -----" {{{1
hi BlkWht		              guifg=#f1faee cterm=bold
hi WhtBlk		              guifg=#f1faee cterm=bold,reverse
hi WhtCyn		guibg=#f1faee guifg=#0a898c cterm=none
hi CynWht		guibg=#0a898c guifg=#f1faee cterm=bold
hi CynBlu		guibg=#0a898c guifg=#005f73 cterm=none
hi BluWht		guibg=#005f73 guifg=#f1faee cterm=bold
hi BluGry		guibg=#005f73 guifg=#2f3c3c cterm=none
hi GryGrn		guibg=#2f3c3c guifg=#0fff00 cterm=bold
hi BlkGry		              guifg=#2f3c3c cterm=none
hi GryWht		guibg=#2f3c3c guifg=#f1faee cterm=bold
hi BlkRed		              guifg=#e63946 cterm=none
"----- Modifing Original Value -----" {{{2
"----- Reset Original Value ------" {{{3
hi clear NonText
hi clear CursorLine
hi clear TabLine
hi clear TabLineSel
hi clear TabLineFill
hi clear PmenuSel
hi clear Pmenu
hi clear LineNr
hi clear CursorLineNr
hi clear Folded
hi clear WildMenu
hi clear StatusLine
hi clear QuickFixLine
hi clear MatchParen
hi clear MoreMsg
hi clear Visual
hi clear SpecialKey
" }}}
hi NonText		              guifg=#888888 cterm=none
hi CursorLine	guibg=#17171d               cterm=none
hi TabLine		              guifg=#f1faee cterm=none
hi TabLineSel	guibg=#f1faee guifg=#000000 cterm=bold
hi TabLineFill	              guifg=#2f3c3c cterm=none
hi PmenuSel		guibg=#3c5a92               cterm=none
hi Pmenu		guibg=#5d5c62               cterm=none
hi LineNr		              guifg=#c0c0c0 cterm=none
hi CursorLineNr	guibg=#1d3557 guifg=#c0c0c0 cterm=bold
hi Folded		guibg=#2b3037 guifg=#c0c0c0 cterm=italic
hi WildMenu		guibg=#77bdfd guifg=#000000 cterm=bold,underline
hi StatusLine	guibg=#f1faee guifg=#000000 cterm=none
hi QuickFixLine	                            cterm=standout
hi MatchParen	              guifg=#ff5faf cterm=bold
hi MoreMsg		              guifg=#0fff00 cterm=none
hi Visual		guibg=#000000               cterm=reverse

hi link SpecialKey NonText
" }}}
" }}}
"----- Get current filetype -----" {{{1
function! CheckFT(filetype)
	if a:filetype == ''
		return '-'
	else
		return toupper(a:filetype)
	endif
endfunction
" }}}
"----- Check modified status -----" {{{1
function! CheckMod(mod)
	if a:mod == 1
		return expand('%:t').' '.'[+]'
	else
		return expand('%:t').''
	endif
endfunction
" }}}
"----- Custom Tab -----"{{{1
function! TabLineDraw()
	let Tabs = ''
	let l:component = {}
	let l:maxwidth = (&columns / &tabpagemax)
	for each in range(tabpagenr('$'))
		let l:index = each + 1
		let l:component['BL'] = tabpagebuflist(index)
		let l:component['WN'] = tabpagewinnr(index)
		let l:component['SS'] = component['BL'][component['WN'] - 1]
		let l:component['BN'] = fnamemodify(bufname(component['SS']), ':t')
		let l:component['TL'] = strlen(component['BN'])

		let l:ico = len(component['BL']) > 1 ? ' ☲' : ''
		if component['TL'] > maxwidth
			if ico != ''
				let l:tmp = component['TL'] - (maxwidth - 6)
			else
				let l:tmp = component['TL'] - (maxwidth - 5)
			endif
			let l:component['BN'] = substitute(component['BN'], '\w\{'. tmp .'\}', '◁', '')
		endif

		let Tabs .= (index == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
		let Tabs .= '%'. index .'T'

		let l:temp = ''
		let l:buff = getbufvar(component['SS'], '&buftype')
		if buff == ''
			if component['BN'] ==# ''
				let temp = ' [No Name]'
			else
				let temp = ' '. component['BN']
			endif
		elseif buff ==# 'quickfix'
			let temp = ' [QuickFix]'
		elseif buff ==# 'help'
			let temp = ' [Help]'
		endif

		let Tabs .= ico
		let Tabs .= temp
		let Tabs .= getbufvar(component['SS'], '&modified') == 1 ? '+ ' : ' '
		let Tabs .= (index == tabpagenr() ? '%#TabLine#' : '¦')
	endfor

	let Tabs .= '%#TabLineFill#%T'
	return Tabs
endfunction
set tabline=%!TabLineDraw()
"}}}
"----- Status line -----" {{{1
function! ActiveLine()
	let statusline = ""
	let statusline .= "%#BlkWht#🐧%#WhtBlk# %{CheckMod(&modified)} %r%h"
	let statusline .= "%="
	let statusline .= "%#WhtCyn#%#CynWht# %L:%P %#CynBlu#%#BluWht# ☰ %l:%c "
	let statusline .= "%#BluGry#◀%#GryGrn# %{CheckFT(&filetype)}%#BlkGry#"
	return statusline
endfunction

function! InactiveLine()
	let statusline = ""
	let statusline .= "%#BlkGry#════%#GryWht# 🔒 %{CheckMod(&modified)} %r%h[HOLDED] %#BlkGry#"
	return statusline
endfunction

function! QuickFixLine()
	let statusline = ""
	let statusline .= "%#BlkRed#════%#GryWht# 🔒 VIM Compile Debug Report %#BlkRed#"
	let statusline .= "%#BlkRed#══%#GryWht# %{CheckFT(&filetype)} %#BlkRed#"
	return statusline
endfunction
"---

"----- Change statusline automatically -----"
augroup StatusLine
	autocmd!
	autocmd WinEnter,BufEnter,BufAdd *.* setlocal statusline=%!ActiveLine()
	autocmd WinLeave,BufLeave,BufAdd *.* setlocal statusline=%!InactiveLine()
	autocmd WinEnter,BufEnter,BufAdd .* setlocal statusline=%!ActiveLine()
	autocmd WinLeave,BufLeave,BufAdd .* setlocal statusline=%!InactiveLine()
	autocmd BufWinEnter,BufWinLeave,BufReadPost quickfix setlocal statusline=%!QuickFixLine() | set wrap | set norelativenumber
augroup END
" }}}
"----- Clean screen mode -----" {{{1
let g:csmMode = 0
function! CleanScreenDisplay()
	if g:csmMode == 0
		setlocal laststatus=0
		setlocal showtabline=0
		setlocal foldcolumn=0
		setlocal nocursorline
		setlocal norelativenumber
		hi NonText guifg=#000000
		let g:csmMode = 1
	else
		setlocal laststatus=2
		setlocal showtabline=1
		setlocal cursorline
		setlocal relativenumber
		hi NonText guifg=#888888
		let g:csmMode = 0
	endif
endfunction
" }}}
"----- DiffOrig by tpruvot@github{{{
" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig windo new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif"}}}

" vim:foldmethod=marker:ts=4:sw=4
