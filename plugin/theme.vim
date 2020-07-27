"------------------------------------------------------------------"
" Ricing                                                           "
"------------------------------------------------------------------"

" statusline
set laststatus=2			    " always show status bar
set statusline =
if $USER == 'root'
    let hostname = hostname()
    exec 'set statusline +=%7*\ ' . $USER . '@' . hostname . '\ %*'
endif
if ! empty($TMUX)
    set statusline +=%6*%*
endif

set statusline +=%1*\ \ %<%F\ \ %*	    " full path
set statusline +=%2*\ \ %y%*                " file type
set statusline +=%2*\ %m\ %*                " modified flag
set statusline +=%3*%{noscrollbar#statusline(12,'\ ','-')}
set statusline +=%4*%=%*		    " centre padding
set statusline +=%5*\ \ %l\ /\ %L\ \ %*	    " current / total lines
set statusline +=%1*\ %n\ %*		    " buffer number 

hi User1 ctermfg=0 ctermbg=5 cterm=none
hi User2 ctermfg=0 ctermbg=4 cterm=none
hi User3 ctermfg=0 ctermbg=14 cterm=none
hi User4 ctermfg=0 ctermbg=2 cterm=none
hi User5 ctermfg=0 ctermbg=3 cterm=none
hi User6 ctermfg=3 ctermbg=5 cterm=none
hi User7 ctermfg=0 ctermbg=9 cterm=none

" tab bar
hi TabLineFill ctermfg=0 ctermbg=1
hi TabLine ctermfg=0 ctermbg=13
hi TabLineSel ctermfg=0 ctermbg=12
hi Title ctermfg=0 ctermbg=12

" vimdiff
hi DiffAdd      cterm=none ctermfg=0 ctermbg=2
hi DiffChange   cterm=none ctermfg=0 ctermbg=4
hi DiffText     cterm=none ctermfg=0 ctermbg=6
hi DiffDelete   cterm=bold ctermfg=0 ctermbg=1

" folds
hi Folded ctermbg=8 ctermfg=4 cterm=none

" visual mode highlighting
hi Visual ctermbg=7 ctermfg=0

" title highlighting needs changing so that text doesn't go invisible due to cursor line
hi Title ctermfg=3 ctermbg=0

" matched brackets
hi MatchParen ctermfg=7 cterm=underline ctermbg=0 

" line numbers
set number relativenumber
hi LineNr ctermfg=5

" highlight cursor line
highlight CursorLine ctermbg=8 cterm=bold
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

" change cursor shape in insert mode
"let &t_SI = "\e[4 q" "underscore
"let &t_EI = "\e[2 q" "block
"augroup myCmds
"    au!
"    autocmd VimEnter * silent !echo -ne "\e[2 q"
"augroup END

" character for split barrier
set fillchars=vert:\ 
hi VertSplit cterm=bold term=bold ctermbg=12
