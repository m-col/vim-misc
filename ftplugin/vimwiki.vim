"""" These commented commands are in vimrc, so ARE active:
""" split open index of vimwiki.
"nmap <Leader>wv :vsp<CR><Leader>ww

"""" These commented commands are defaukts, so ARE active:
""" \ww opens it normally, which is default, in new buffer
"nmap <Leader>wh Vimwiki2HTML
"nmap <Leader>whh Vimwiki2HTMLBrowse

" open index wiki in horizontal split	
nmap <buffer> <Leader>ws :sp<CR><Leader>ww

" go to papers page
nmap <buffer> <Leader>gp /[[/papers/papers<CR><CR>

" save all as HTML
nmap <buffer> <Leader>wa :VimwikiAll2HTML<CR>
nmap <buffer> <Leader>wah :VimwikiAll2HTML<CR>:Vimwiki2HTMLBrowse<CR><CR>
" save as HTML and quit
nmap <buffer> <Leader>wq :VimwikiAll2HTML<CR>:wq<CR>

" follow next link
nmap <buffer> g<CR> /[[<CR><CR>

" paste copied bullet pointed link as title
nmap <buffer> <Leader>p 0f\|yy<CR>Pdf\|$xx===o<CR>

" open pdf from papers page
nmap <buffer> <Leader>o 0f\|lvt]y:let a = substitute(@*, ' ', '_', 'g') \| exec "!qpdfview --unique ~/work/research/papers/" . a . ".pdf &"<CR>

" update papers page with new pdf files
nmap <buffer> <Leader>u :!vimwiki_add_papers.sh<CR>

" run goyo
nmap <buffer> <Leader>g :Goyo<CR>


setlocal wrap
setlocal linebreak
setlocal breakindent
