vim9script

###  Config  {{{
# Only support for newer version of Vim
set nocompatible
# I'm a vampire
set background=dark
# Increase productivity while editing
set relativenumber
# Follow the indentation from previous line
set autoindent
set cindent
# Immediately show search result
set incsearch
# I prefer single tab rather than 4 spaces; save more bytes
set noexpandtab
# Look & Feel
set nowrap
set cursorline
set sidescrolloff=3
set scrolloff=5
set numberwidth=4
set colorcolumn=-4
set history=50
# Two seconds for keymap & a tenth of a second for key code.
set timeout
set timeoutlen=2000
set ttimeoutlen=100
# Command completion
set wildmenu
set wildmode=longest,list,full
# Ignore these types of file in completion
set wildignore=*.o,*.so,*.jpg,*.png,*.mp3,*.mp4
# Sometimes I forget
set showcmd
# Highlight parenthesis
set showmatch
# Using my ViWS plugin instead
set noruler
set laststatus=2
set tabline=%!VimWorkSpace()
# Indentation
set nosmarttab
set tabstop=4
set shiftwidth=4
# Show indentation
set list
set listchars=tab:\¦\ ,nbsp:+
# Folding block
set foldmethod=marker
# Show help in full screen
set helpheight=30
# Path for swap
set directory=/data/data/com.termux/files/home/.vim/swap/
# Search path
set path=.,,
### }}}
###  Netrw {{{
g:netrw_banner      = 0
g:netrw_dirhistmax  = 0
g:netrw_list_hide   = '.*\.png,.*\.jpg,.*\.jpeg,.*\.svg,.*\.mp3,.*\.mp4'
g:netrw_mousemaps   = 0
g:netrw_use_noswf   = 1
### }}}
###  Map  {{{
nnoremap Zj o<esc>
nnoremap Zk O<esc>
nnoremap tn :tabnew<cr>
nnoremap ,r :edit<cr>
nnoremap ,l :tabnext<cr>
nnoremap ,h :tabprevious<cr>
nnoremap ,j :wincmd j<cr>
nnoremap ,k :wincmd k<cr>
nnoremap ,o :35%Lexplore<cr>
nnoremap ,w :up<cr>
nnoremap ,b :ls<cr>:buff<space>
nnoremap ,q :confirm q<cr>
nnoremap ,Q :confirm qa<cr>
nnoremap <silent> <f2> mp:let _s=@/<bar>:%s/\s\+$//e<bar>:let @/=_s<bar><cr>'pzz
nnoremap <silent> <f3> :call fzf#run(fzf#wrap({'sink':'0read', 'source':'find ~/.vim/skeleton/ -mindepth 1 -maxdepth 1', 'down':'20%', 'options':'-e --layout=reverse-list --no-border --no-info --color=16'}))<cr>
### }}}
###  Theme  {{{
# Clear Vim default theme
hi clear ColorColumn
hi clear Comment
hi clear Constant
hi clear CursorLine
hi clear CursorLineNr
hi clear DiffAdd
hi clear DiffText
hi clear Directory
hi clear ErrorMsg
hi clear Folded
hi clear IncSearch
hi clear LineNr
hi clear MatchParen
hi clear ModeMsg
hi clear MoreMsg
hi clear NonText
hi clear PMenuSel
hi clear Pmenu
hi clear Question
hi clear Search
hi clear SpecialKey
hi clear Todo
hi clear Visual
hi clear WarningMsg
hi clear WildMenu

# Define my theme
hi ColorColumn  ctermbg=001  ctermfg=NONE cterm=NONE
hi Comment      ctermbg=NONE ctermfg=004  cterm=BOLD
hi Constant     ctermbg=NONE ctermfg=003  cterm=NONE
hi CursorLine   ctermbg=000  ctermfg=NONE cterm=NONE
hi CursorLineNr ctermbg=008  ctermfg=015  cterm=BOLD
hi DiffAdd      ctermbg=136  ctermfg=NONE cterm=NONE
hi DiffText     ctermbg=124  ctermfg=NONE cterm=NONE
hi Directory    ctermbg=NONE ctermfg=004  cterm=NONE
hi ErrorMsg     ctermbg=001  ctermfg=015  cterm=NONE
hi Folded       ctermbg=008  ctermfg=NONE cterm=NONE
hi IncSearch    ctermbg=015  ctermfg=000  cterm=NONE
hi LineNr       ctermbg=NONE ctermfg=250  cterm=NONE
hi MatchParen   ctermbg=NONE ctermfg=205  cterm=BOLD
hi ModeMsg      ctermbg=NONE ctermfg=015  cterm=NONE
hi MoreMsg      ctermbg=NONE ctermfg=002  cterm=NONE
hi NonText      ctermbg=NONE ctermfg=250  cterm=NONE
hi PMenuSel     ctermbg=004  ctermfg=015  cterm=BOLD
hi Pmenu        ctermbg=012  ctermfg=000  cterm=NONE
hi Question     ctermbg=NONE ctermfg=007  cterm=NONE
hi Search       ctermbg=003  ctermfg=237  cterm=NONE
hi SpecialKey   ctermbg=NONE ctermfg=250  cterm=NONE
hi Todo                      ctermfg=011  cterm=UNDERLINE
hi Visual                                 cterm=REVERSE
hi WarningMsg   ctermbg=NONE ctermfg=003  cterm=NONE
hi WildMenu     ctermbg=008  ctermfg=007  cterm=BOLD

hi link VertSplit Normal
hi link CurSearch Search
### }}}
###  Autogroup  {{{
augroup Template
	autocmd BufNewFile \w*.cpp :0read ~/.vim/skeleton/cpp.template
	autocmd BufNewFile \w*.sh :0read ~/.vim/skeleton/bash.template
	autocmd BufNewFile \w*.rs :0read ~/.vim/skeleton/rust.template
	autocmd BufNewFile \w*.c :0read ~/.vim/skeleton/c.template
	autocmd BufNewFile Cargo.toml :0read ~/.vim/skeleton/cargo_toml.template
augroup END
augroup Compiler
	autocmd BufEnter \w*.cpp :set makeprg=cc\ -Werror\ -Wextra\ -Wconversion\ -Wshadow\ -Wpedantic\ -std=c++17\ %
	autocmd BufEnter \w*.rs :set makeprg=rustc\ -C\ prefer-dynamic\ %
	autocmd BufEnter \w*.c :set makeprg=cc\ -Werror\ -Wextra\ -Wconversion\ -Wshadow\ -Wpedantic\ -std=c17\ %
augroup END
augroup QuickFixWin
	autocmd QuickFixCmdPre * g:mainbuf = bufnr('%')
	autocmd QuickFixCmdPost * botright copen 8 | exec ':' .. bufwinnr(g:mainbuf) .. 'wincmd w'
augroup END
### }}}
## vim:ft=vim:foldmethod=marker
