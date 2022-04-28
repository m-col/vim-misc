"------------------------------------------------------------------"
" Global keybindings                                               "
"------------------------------------------------------------------"

" reload current buffer
"nnoremap <C-l> :e<CR>

" toggle fold
nnoremap <space> za

" yank to end of line
nnoremap Y y$

" buffer navigation
nnoremap <leader>b :ls<CR>:b<space>
nnoremap <Leader>v :ls<CR>:vert sb<space>
nnoremap <Leader>j :bnext<CR> 
nnoremap <Leader>k :bprevious<CR>
nnoremap <Leader><BS> :w<CR>:bdelete<CR>

" move between tabs
nnoremap <Leader>n gT
nnoremap <Leader>m gt

" indent selection
vnoremap < <gv
vnoremap > >gv

" quitting and writing shortcuts
nnoremap QQ :q<CR>
nnoremap !Q :q!<CR>
nnoremap QW :wq<CR>
nnoremap :Q :q
nnoremap :W :w

" disable K man
nnoremap K k

" copy and paste system clipboard
nmap <C-y> "+y
nmap <C-y><C-y> ms0v$"+y`s
vmap <C-y> "+y
imap <C-y> <Esc>"+y
if exists("$WAYLAND_DISPLAY")
    xmap "+y y:call system("wl-copy", @")\|echo '' <cr>
endif

" save read-only file with sudo trick
cnoremap w!! w !sudo tee > /dev/null %

" move between split views (these are configured by the vim-tmux plugin)
" except for insert mode:
"inoremap <silent> <C-H> <Esc>:TmuxNavigateLeft<cr>
"inoremap <silent> <C-J> <Esc>:TmuxNavigateDown<cr>
"inoremap <silent> <C-K> <Esc>:TmuxNavigateUp<cr>
"inoremap <silent> <C-L> <Esc>:TmuxNavigateRight<cr>
"inoremap <silent> <C-\> <Esc>:TmuxNavigatePrevious<cr>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
inoremap <C-H> <Esc><C-W><C-H>
inoremap <C-J> <Esc><C-W><C-J>
inoremap <C-K> <Esc><C-W><C-K>
inoremap <C-L> <Esc><C-W><C-L>

" move to start or end of line more easily
nnoremap 0 ^
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

" shortcut to fix lines
nnoremap <leader>p gqip

" shortcut to vert split
nnoremap vs :vsp<CR>

" toggle spell checking
nnoremap <leader>S :setlocal spell! spelllang=en_gb spell?<CR>:echo "zg to add new word"<CR>

" toggle [ ] tick box on current line with ctrl-space
function! ToggleTodo()
    let l:line = getline('.')
    if match(l:line, '\[x\]') != -1
	let l:line = substitute(l:line, '\[x\]', '\[ \]', '')
	call setline('.', l:line)
    elseif match(l:line, '\[ \]') != -1
	let l:line = substitute(l:line, '\[ \]', '\[x\]', '')
	call setline('.', l:line)
    endif
endfunction
nnoremap <silent> <C-@> :call ToggleTodo()<CR>

" quickfix navigation
nnoremap <localleader>cn :cn<CR>
nnoremap <localleader>cp :cp<CR>

" netrw
nmap <C-n> :Explore<CR>
let g:netrw_sort_sequence='[\/]$'

" bind number keys to scroll so i can use foot terminal's alt scrolling
map <Down> j
map <Up> k


" bind scroll to move cursor up and down
nnoremap <ScrollWheelDown> <Down>
nnoremap <ScrollWheelUp> <Up>
inoremap <ScrollWheelDown> <Down>
inoremap <ScrollWheelUp> <Up>
vnoremap <ScrollWheelDown> <Down>
vnoremap <ScrollWheelUp> <Up>
