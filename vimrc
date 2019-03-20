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

set nocompatible			    " be iMproved, required
filetype off				    " required
set rtp+=~/.vim/bundle/Vundle.vim	    " required
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'		    " required
if hostname() == "zenbook"
    Plugin 'vimwiki/vimwiki'		    " vimwiki
    Plugin 'mcolligan/vimlab'		    " vimlab
if hostname() == "ardbeg"
    Plugin 'mcolligan/vimlab'		    " vimlab
endif
Plugin 'junegunn/goyo.vim'
Plugin 'mcolligan/vim-misc'		    " my vimrc and misc functions 
Plugin 'mcolligan/tide'			    " tmux ide
"Plugin 'christoomey/vim-tmux-navigator'	    " navigate vim and tmux splits seamlessly

call vundle#end()			    " required
filetype plugin indent on		    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ


"------------------------------------------------------------------"
" General settings                                                 "
"------------------------------------------------------------------"

set autoread			" update when file is modified outside of vim
set autowrite			" update file when changing buffers, opening new files, etc
au BufLeave * :silent! update	" save automatically when leaving buffer
set lazyredraw			" dont update screen during macros/scripts
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
set matchtime=2

set undolevels=200		" Number of undo levels
set undodir=~/.vim/undo//	" undo files
set backupdir=~/.vim/backups//	" backups
set directory=~/.vim/swap//	" swap files
set noswapfile

set splitbelow			" default new sp window goes below
set splitright			" default new vsp window goes right
set scrolloff=10		" keep x lines at top and bottom visible when scrollingkeep x lines at top and bottom visible when scrolling
autocmd VimResized * wincmd =	" keep splits equal size when resizing window

syntax on			" enable syntax highlighting
set mouse=a			" enable mouse
set t_Co=16			" use the 16 terminal colours
"set ttyfast

set sessionoptions=buffers,folds,tabpages
set viewoptions=folds,cursor

set wildmenu			" enable wildmenu for tab completion of commands
set wildignorecase		" disable wildmenu case sensitivity
set wildmode=full:list		" format wildmenu to expand and scroll with tab

set autochdir			" cwd to current file

set background=dark		" needed in case urxvt background colour is transparent

"------------------------------------------------------------------"
" Misc                                                             "
"------------------------------------------------------------------"

" restore last line in opened file
au BufReadPost *
	    \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
	    \ |   exe "normal! g`\""
	    \ | endif

" netrw
nmap <C-n> :Explore<CR>
nmap <C-t> :Texplore<CR>
let g:netrw_sort_sequence='[\/]$'

" machine specific settings
if hostname() == "zenbook"
    packadd! matchit		" needed for matlab indentation functionality
    let g:mlint_path_to_mlint = expand("$HOME") . "/applications/MATLAB/R2018b/bin/glnxa64/mlint"
    let g:vimwiki_list = [{'path': '~/work/research/research.wiki/', 'path_html': '~/work/research/research.wiki.html/'}]
endif

" session saving
let g:vimlab_session = "~/.vim/sessions/matlab-session.vim"

" Intelligently navigate tmux panes and Vim splits using the same keys.
" See https://sunaku.github.io/tmux-select-pane.html for documentation.
let progname = substitute($VIM, '.*[/\\]', '', '')
set title titlestring=%{progname}\ %f\ +%l\ #%{tabpagenr()}.%{winnr()}
if &term =~ '^screen' && !has('nvim') | exe "set t_ts=\e]2; t_fs=\7" | endif
