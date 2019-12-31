"------------------------------------------------------------------"
" Global folding rules
"------------------------------------------------------------------"


" format folded section header text
"function! GenericFoldText()
"    let line = getline(v:foldstart)
"
"    let nucolwidth = &fdc + &number * &numberwidth
"    let windowwidth = winwidth(0) - nucolwidth - 3
"    let foldedlinecount = v:foldend - v:foldstart
"
"    let onetab = strpart('          ', 0, &tabstop)
"    let line = substitute(line, '\t', onetab, 'g')
"
"    let line = strpart(line, 0, windowwidth - len(foldedlinecount))
"    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
"    return line . repeat(" ",fillcharcount) . ' ' . foldedlinecount
"endfunction
"set foldtext=GenericFoldText()
"
"
"function! GenericFolds()
"    if match(getline(v:lnum), '^\s*' . &commentstring[0] . &commentstring[0]) >=0
"	return ">1"
"    else
"	return "="
"    endif
"endfunction
"
"
"set foldmethod=expr
"set foldexpr=GenericFolds()
