"------------------------------------------------------------------
"  Indentation of entire file
"------------------------------------------------------------------

function! IndentFile()
    mkview
    let l:win_view = winsaveview()
    :normal! gg=G
    silent loadview
    call winrestview(l:win_view)
endfunction

nnoremap <C-i> :call IndentFile()<CR>
