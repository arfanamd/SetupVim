vim9script

###  Config  {{{
# Only support for newer version of Vim
set nocompatible
# I'm a vampire
set background=dark
# Increase productivity while editing
set relativenumber
# I prefer single tab rather than 4 spaces
set noexpandtab
# Look & Feel
set nowrap
set cursorline
set sidescrolloff=3
set scrolloff=5
set textwidth=71
set numberwidth=4
set colorcolumn=-4
set history=50
# Command completion
set wildmenu
# Ignore these types of file in completion
set wildignore=*.o,*.so,*.jpg,*.png,*.mp3,*.mp4
# Sometimes I forget
set showcmd
# Highlight parenthesis
set showmatch
# Using my ViWS plugin instead
set noruler
set laststatus=2
# Indentation
set nosmarttab
set tabstop=4
set shiftwidth=4
# Show indentation
set list
set listchars=tab:¦▷∙,nbsp:+
# Folding block
set foldmethod=marker
# Show help in full screen
set helpheight=30
# Path for swap
set directory=/data/data/com.termux/files/home/.vim/swap/
# Search path
set path=.,,
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
nnoremap ,w :up<cr>
nnoremap ,b :ls<cr>:buff 
nnoremap ,q :confirm q<cr>
nnoremap ,Q :confirm qa<cr>
nnoremap <silent> <F2> mp:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>'pzz
nnoremap <silent> <F3> :call fzf#run({'sink':'.!cat', 'source':'ls -1 $HOME/.vim/skeleton/', 'down':'20%', 'options':'-e --layout=reverse-list --border=none --no-info --color=16'})<cr>
### }}}
###  Theme  {{{
hi ColorColumn  ctermbg=167  ctermfg=NONE cterm=NONE guibg=#d75f5f guifg=NONE    gui=NONE
hi Comment      ctermbg=NONE ctermfg=068  cterm=BOLD guibg=NONE    guifg=#5f87d7 gui=BOLD
hi Constant     ctermbg=NONE ctermfg=217  cterm=NONE guibg=NONE    guifg=#ffafaf gui=NONE
hi CursorLine   ctermbg=235  ctermfg=NONE cterm=NONE guibg=#262626 guifg=NONE    gui=NONE
hi CursorLineNr ctermbg=237  ctermfg=254  cterm=BOLD guibg=#3a3a3a guifg=#e4e4e4 gui=BOLD
hi Directory    ctermbg=NONE ctermfg=004  cterm=NONE guibg=NONE    guifg=#65a0d5 gui=NONE
hi ErrorMsg     ctermbg=001  ctermfg=254  cterm=NONE guibg=#d85050 guifg=#e4e4e4 gui=NONE
hi Folded       ctermbg=237  ctermfg=NONE cterm=NONE guibg=#3a3a3a guifg=NONE    gui=NONE
hi IncSearch    ctermbg=254  ctermfg=237  cterm=NONE guibg=#e4e4e4 guifg=#3a3a3a gui=NONE
hi LineNr       ctermbg=NONE ctermfg=250  cterm=NONE guibg=NONE    guifg=#bcbcbc gui=NONE
hi MatchParen   ctermbg=NONE ctermfg=205  cterm=BOLD guibg=NONE    guifg=#ff5faf gui=BOLD
hi ModeMsg      ctermbg=NONE ctermfg=254  cterm=NONE guibg=NONE    guifg=#e4e4e4 gui=NONE
hi MoreMsg      ctermbg=NONE ctermfg=002  cterm=NONE guibg=NONE    guifg=#69c076 gui=NONE
hi NonText      ctermbg=NONE ctermfg=250  cterm=NONE guibg=NONE    guifg=#bcbcbc gui=NONE
hi PMenuSel     ctermbg=068  ctermfg=254  cterm=BOLD guibg=#5f87d7 guifg=#e4e4e4 gui=BOLD
hi Pmenu        ctermbg=250  ctermfg=237  cterm=NONE guibg=#bcbcbc guifg=#3a3a3a gui=NONE
hi Question     ctermbg=NONE ctermfg=002  cterm=NONE guibg=NONE    guifg=#69c076 gui=NONE
hi Question     ctermbg=NONE ctermfg=254  cterm=NONE guibg=NONE    guifg=#e4e4e4 gui=NONE
hi Search       ctermbg=003  ctermfg=237  cterm=NONE guibg=#d8bd50 guifg=#3a3a3a gui=NONE
hi SpecialKey   ctermbg=NONE ctermfg=250  cterm=NONE guibg=NONE    guifg=#bcbcbc gui=NONE
hi WarningMsg   ctermbg=NONE ctermfg=003  cterm=NONE guibg=NONE    guifg=#d85050 gui=NONE
hi WildMenu     ctermbg=037  ctermfg=237  cterm=BOLD guibg=#00afaf guifg=#3a3a3a gui=BOLD

hi DiffAdd      ctermbg=136  ctermfg=NONE cterm=NONE guibg=#af8700 guifg=NONE    gui=NONE
hi DiffText     ctermbg=124  ctermfg=NONE cterm=NONE guibg=#af0000 guifg=NONE    gui=NONE

hi Visual       ctermbg=000  cterm=REVERSE guibg=#000000 gui=REVERSE
hi Todo         ctermbg=NONE ctermfg=011 cterm=UNDERLINE guibg=NONE guifg=#ffdf5f gui=UNDERLINE
hi link VertSplit Normal
hi link CurSearch Search
### }}}
## vim:ft=vim:foldmethod=marker
