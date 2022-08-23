setlocal textwidth=101
"setlocal spell spelllang=en_gb
nnoremap <localleader>c :mkview<CR>gqip:silent loadview<CR>


" format folded section header text
function! GenericFoldText()
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - len(foldedlinecount))
    let level = (len(split(line)[0]) - 1) * 3
    let level_indent = repeat(" ", level)
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - level
    return level_indent . line . repeat(" ",fillcharcount) . ' ' . foldedlinecount
endfunction
setlocal foldtext=GenericFoldText()
