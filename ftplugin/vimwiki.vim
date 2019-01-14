"""" These commented commands are in vimrc, so ARE active:
""" split open index of vimwiki.
"nmap <Leader>wv :vsp<CR><Leader>ww

"""" These commented commands are defaukts, so ARE active:
""" \ww opens it normally, which is default, in new buffer
"nmap <Leader>wh Vimwiki2HTML
"nmap <Leader>whh Vimwiki2HTMLBrowse

" open index wiki in horizontal split	
nmap <Leader>ws :sp<CR><Leader>ww

" split follow link
nmap <Leader>s <Plug>VimwikiSplitLink
nmap <Leader>v <Plug>VimwikiVSplitLink

" some html shortcuts
nmap <Leader>b msA<br><Esc>`s
nmap <Leader>i msI<i><Esc>A</i><Esc>`s
nmap <Leader>r mso<hr><Esc>`s
nmap <Leader>R msO<hr><Esc>`s

" go to pages
nmap <Leader>gp /[[/papers/papers<CR><CR>
nmap <Leader>gl /[[/topics/learning<CR><CR>
nmap <Leader>gb /[[/topics/brain<CR><CR>
nmap <Leader>gd /[[/topics/direction<CR><CR>
nmap <Leader>gm /[[/topics/muscles<CR><CR>

" save all as HTML
nmap <Leader>wa :VimwikiAll2HTML<CR>
nmap <Leader>wah :VimwikiAll2HTML<CR>:Vimwiki2HTMLBrowse<CR><CR>
" save as HTML and quit
nmap <Leader>wq :VimwikiAll2HTML<CR>WQ

" follow next link
nmap g<CR> /[[<CR><CR>

" paste copied bullet pointed link as title
nmap <Leader>p 0f\|yy<CR>Pdf\|$xx===o<CR>

" open pdf from papers page
nmap <Leader>o 0f\|lvt]y:let a = substitute(@*, ' ', '_', 'g') \| !qpdfview --unique "~/work/research/papers/" . a . ".pdf" &

" update papers page with new pdf files
nmap <Leader>u :!vimwiki_add_papers.sh<CR>

setlocal textwidth=80
