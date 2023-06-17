setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=101
setlocal noautoindent
setlocal nosmartindent
"setlocal formatoptions+=a
"setlocal spell spelllang=en_gb

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


"function! MarkdownFixParagraph()
"    let start = line("'{")
"    let end = line("'}")
"    let g:ale_markdown_prettier_fix_options =
"	\ '--prose-wrap=always --print-width=101 --range-start=' . start . ' --range-end=' . end
"    "ALEFix
"endfunction
"
""nnoremap <localleader>c :mkview<CR>gqip:silent loadview<CR>
"nnoremap <localleader>c :call MarkdownFixParagraph()<CR>

"let b:ale_lint_on_text_changed = 1
"let b:ale_fix_on_save = 1
"let b:ale_lint_delay = 1000
