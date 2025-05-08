setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=88
setlocal expandtab

" add python breakpoint: vim function that checks for 'breakpoint' in the current line and removes this line if it exists, otherwise adds a new line on this line with breakpoint() on it
function! Breakpoint()
    let l:line = getline('.')
    if match(l:line, 'breakpoint') != -1
	execute 'normal! dd'
    else
	execute 'normal! Obreakpoint()'
    endif
endfunction
nnoremap <C-b> :call Breakpoint()<CR>
