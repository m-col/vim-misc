"------------------------------------------------------------------"
" Ricing                                                           "
"------------------------------------------------------------------"

"" visual mode highlighting
hi Visual gui=reverse

" line numbers
set number relativenumber
"hi LineNr ctermfg=5

" highlight cursor line
highlight CursorLine ctermbg=8 cterm=bold
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

"" character for split barrier
"set fillchars=vert:\ 
"hi VertSplit cterm=bold term=bold ctermbg=12
