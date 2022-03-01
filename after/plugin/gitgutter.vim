""turn off realtime updates for gitgutter but update upon write
"let g:gitgutter_enabled = 0
"autocmd! gitgutter CursorHold,CursorHoldI
"autocmd BufWritePost * GitGutter
"
"" gitgutter
"nmap <localleader>g :GitGutterToggle<CR>
"nmap gp <Plug>(GitGutterPreviewHunk)
"nmap gs <Plug>(GitGutterStageHunk)
"nmap gu <Plug>(GitGutterUndoHunk)
"nmap [g <Plug>(GitGutterPrevHunk)
"nmap ]g <Plug>(GitGutterNextHunk)
"omap ig <Plug>(GitGutterTextObjectInnerPending)
"omap ag <Plug>(GitGutterTextObjectOuterPending)
"xmap ig <Plug>(GitGutterTextObjectInnerVisual)
"xmap ag <Plug>(GitGutterTextObjectOuterVisual)
