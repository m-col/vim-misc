"------------------------------------------------------------------"
" Global keybindings                                               "
"------------------------------------------------------------------"

" reload current buffer
"nnoremap <C-l> :e<CR>

" toggle fold
nnoremap <space> za

" buffer navigation
nnoremap <leader>b :ls<CR>:b<space>
nnoremap <Leader>v :ls<CR>:vert sb<space>
nnoremap <Leader>j :bnext<CR> 
nnoremap <Leader>k :bprevious<CR>
nnoremap <silent> <BS> :bdelete<CR>
nnoremap <Leader><BS> :w<CR>:bdelete<CR>

" move between tabs
nnoremap <Leader>n gT
nnoremap <Leader>m gt

" indent selection
vnoremap < <gv
vnoremap > >gv

" quitting and writing shortcuts
nnoremap Q <nop>
nnoremap QQ :q<CR>
nnoremap !Q :q!<CR>
nnoremap QW :wq<CR>
nnoremap :Q :q
nnoremap :W :w

" yank to end of line
nnoremap Y y$

" copy and paste system clipboard
nnoremap <C-p> "+p
nnoremap <C-y> "+y
nnoremap <C-y><C-y> ms0v$"+y`s
vnoremap <C-p> "+p
vnoremap <C-y> "+y
"next one needs fixing:
"inoremap <C-p> <Esc>"+p
inoremap <C-y> <Esc>"+y

" save read-only file with sudo trick
cnoremap w!! w !sudo tee > /dev/null %

" move between split views
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
inoremap <C-H> <Esc><C-W><C-H>
inoremap <C-J> <Esc><C-W><C-J>
inoremap <C-K> <Esc><C-W><C-K>
inoremap <C-L> <Esc><C-W><C-L>

" move to start or end of line more easily
nnoremap H 0
nnoremap L $
vnoremap H 0
vnoremap L g_

" resize splits
nnoremap <silent> <Up> :res -1<CR>
nnoremap <silent> <Down> :res +1<CR>
nnoremap <silent> <Left> :vertical resize -5<CR>
nnoremap <silent> <Right> :vertical resize +5<CR>

" toggle search highlight
nnoremap <Leader>h :set hlsearch!<CR>
