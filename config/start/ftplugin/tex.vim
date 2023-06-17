setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=110
setlocal expandtab

nnoremap K :VimtexDocPackage<CR>

nnoremap <localleader>lw :exe 'cexpr system("texcount ' . expand('%') . '")'<CR>:copen<CR>

nnoremap <localleader>c :VimtexCompile<CR>
