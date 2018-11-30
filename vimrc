"------------------------------------------------------------------"
"                          _                                       "
"                         (_)                                      "
"                   __   ___ _ __ ___  _ __ ___                    "
"                   \ \ / / | '_ ` _ \| '__/ __|                   "
"                    \ V /| | | | | | | | | (__                    "
"                     \_/ |_|_| |_| |_|_|  \___|                   "
"                                                                  "
"------------------------------------------------------------------"


"------------------------------------------------------------------"
" Plugins                                                          "
"------------------------------------------------------------------"

set nocompatible		    " be iMproved, required
filetype off			    " required
set rtp+=~/.vim/bundle/Vundle.vim   " required
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'	" required
"Plugin 'ervandew/supertab'	" better tab completion
Plugin 'jpalardy/vim-slime'	" send text to IDE and execute
Plugin 'vimwiki/vimwiki'	" vimwiki
Plugin 'mcolligan/vimlab'	" vimlab
Plugin 'mcolligan/vim-misc'	" misc functions

call vundle#end()            " required
filetype plugin indent on    " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ


"------------------------------------------------------------------"
" General settings                                                 "
"------------------------------------------------------------------"

set hidden			" allow opening new buffers without saving first
set lazyredraw			" dont update screen during macros/scripts
"set showmatch			" Highlight matching brace
set hlsearch			" Highlight all search results - toggled by <Leader>h
set smartcase			" searches ignore case only if all lower case
set incsearch			" Searches for strings while typing search term
set gdefault			" use global by default for substitutions

set shiftwidth=4		" Default number of auto-indent spaces
set autoindent			" Auto-indent new lines
set smartindent			" Enable smart-indent
set smarttab			" shiftwidth tab at start of line, otherwise softtabstop width tab
set softtabstop=4		" Number of spaces per tab
set linebreak			" Allow backspacing over indention, line breaks and insertion start
set backspace=indent,eol,start	" Backspace behaviour
set formatoptions+=j		" Delete comment characters when joining lines.
autocmd FileType * setlocal formatoptions-=cro    " disable autocommenting

set undolevels=100		" Number of undo levels
set dir^=~/.cache/vim/swap//	" where to store swapfiles
set backupdir=~/.cache/vim	" where to store backups

set splitbelow			" default new sp window goes below
set splitright			" default new vsp window goes right
set scrolloff=15		" keep x lines at top and bottom visible when scrolling
autocmd VimResized * wincmd =	" keep splits equal size when resizing window

syntax on			" enable syntax highlighting
set mouse=a			" enable mouse
set t_Co=16			" use the 16 terminal colours

set sessionoptions-=options	" do not store global and local values in a session

set wildmenu			" enable wildmenu for tab completion of commands
set wildmode=longest:list,full	" format wildmenu to expand and scroll with tab

if hostname() == "zenbook"
    packadd! matchit		" needed for matlab indentation functionality
endif

set autochdir			" cwd to current file



"------------------------------------------------------------------"
" Ricing                                                           "
"------------------------------------------------------------------"

" statusline
set laststatus=2			    " always show status bar
set statusline =
set statusline +=%1*\ \ %<%F\ \ %*	    " full path
set statusline +=%2*\ \ %y%*                " file type
set statusline +=%2*\ %m\ %*                " modified flag
set statusline +=%3*%=%*		    " centre padding
set statusline +=%4*\ \ %l\ /\ %L\ \ %*	    " current / total lines
set statusline +=%5*\ %n\ %*		    " buffer number

hi User1 ctermfg=0 ctermbg=5 cterm=none 
hi User2 ctermfg=0 ctermbg=4 cterm=none 
hi User3 ctermfg=0 ctermbg=14 cterm=none 
hi User4 ctermfg=0 ctermbg=2 cterm=none 
hi User5 ctermfg=0 ctermbg=3 cterm=none 

" vimdiff
hi DiffAdd      cterm=none ctermfg=0 ctermbg=2
hi DiffChange   cterm=none ctermfg=0 ctermbg=4
hi DiffText     cterm=none ctermfg=0 ctermbg=6
hi DiffDelete   cterm=bold ctermfg=0 ctermbg=1

" folds
hi Folded ctermbg=8 ctermfg=4 cterm=none

" visual mode highlighting
hi Visual ctermbg=7 ctermfg=0

" matched brackets
hi MatchParen ctermfg=7 cterm=underline ctermbg=0 

" line numbers
set number relativenumber
hi LineNr ctermfg=5

" highlight cursor line
highlight CursorLine ctermbg=8 cterm=bold
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal  cursorline
    au WinLeave * setlocal nocursorline
augroup END

" change cursor shape in insert mode
let &t_SI = "\e[4 q" "underscore
let &t_EI = "\e[2 q" "block
augroup myCmds
    au!
    autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

" character for line in split
set fillchars=vert:\|    


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

" shortcuts to open files
cnoremap modrc e ~/.vimrc<CR>


"------------------------------------------------------------------"
" Misc                                                             "
"------------------------------------------------------------------"

" restore last line in opened file
:au BufReadPost *
	    \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
	    \ |   exe "normal! g`\""
	    \ | endif

" set wiki path
let g:vimwiki_list = [{'path': '~/work/research/research.wiki/', 'path_html': '~/work/research/research.wiki.html/'}]

" netrw
nmap <C-n> :Explore<CR>
nmap <C-t> :Texplore<CR>
let g:netrw_sort_sequence='[\/]$'

"------------------------------------------------------------------"
" vimlab setup
"------------------------------------------------------------------"

" vim-slime 
let g:slime_target = "tmux"
let g:slime_dont_ask_default = 1
let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}
let g:slime_paste_file = "/tmp/slime_paste"

" mlint code checking 
if hostname() == "zenbook"
    let g:mlint_path_to_mlint = "/home/mlv/applications/MATLAB/R2018b/bin/glnxa64/mlint"
else
    let g:mlint_path_to_mlint = "to be filled in later"
endif
let g:mlint_hover = 1

" session saving
let g:vimlab_session = "~/.cache/vim/sessions/matlab-session.vim"

" I am using this for debugging
cmap test echo synIDattr(synIDtrans(synID(line("."), col("."), 0)), "name")<CR>

