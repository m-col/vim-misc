"------------------------------------------------------------------"
" Goyo configuration
"------------------------------------------------------------------"

function! s:goyo_enter()
    set noshowmode
    set noshowcmd
endfunction

function! s:goyo_leave()
    source ~/.vim/bundle/vim-misc/plugin/theme.vim
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
