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
Plugin 'mcolligan/vim-misc'	" my vimrc and misc functions 
Plugin 'vimwiki/vimwiki'	" vimwiki
Plugin 'mcolligan/vimlab'	" vimlab
Plugin 'mcolligan/tide'		" tmux ide
Plugin 'jpalardy/vim-slime'	" send text to IDE and execute
Plugin 'christoomey/vim-tmux-navigator'	    " navigate vim and tmux splits seamlessly

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

set autoread			" update when file is modified outside of vim
set autowrite			" save file automatically
au FocusLost * :silent! wall	" save all changed buffers when vim loses focus
set hidden			" allow opening new buffers without saving first
set lazyredraw			" dont update screen during macros/scripts
set hlsearch			" Highlight all search results - toggled by <Leader>h
set smartcase			" searches ignore case only if all lower case
set incsearch			" Searches for strings while typing search term
set gdefault			" use global by default for substitutions
set nowrap			" don't wrap really long lines

set shiftwidth=4		" Default number of auto-indent spaces
set autoindent			" Auto-indent new lines
set smartindent			" Enable smart-indent
set smarttab			" shiftwidth tab at start of line, otherwise softtabstop width tab
set softtabstop=4		" Number of spaces per tab
set linebreak			" Allow backspacing over indention, line breaks and insertion start
set backspace=indent,eol,start	" Backspace behaviour
set formatoptions+=j		" Delete comment characters when joining lines.
autocmd FileType * setlocal formatoptions-=cro    " disable autocommenting
set matchtime=3

set undolevels=100		" Number of undo levels
set undodir=~/.vim/undo//	" undo files
set backupdir=~/.vim/backups//	" backups
set directory=~/.vim/swap//	" swap files
set noswapfile

set splitbelow			" default new sp window goes below
set splitright			" default new vsp window goes right
set scrolloff=12		" keep x lines at top and bottom visible when scrollingkeep x lines at top and bottom visible when scrolling
autocmd VimResized * wincmd =	" keep splits equal size when resizing window

syntax on			" enable syntax highlighting
set mouse=a			" enable mouse
set t_Co=16			" use the 16 terminal colours
set ttyfast

set sessionoptions=buffers,folds,tabpages
set viewoptions=folds,cursor

set wildmenu			" enable wildmenu for tab completion of commands
set wildmode=longest:list,full	" format wildmenu to expand and scroll with tab

if hostname() == "zenbook"
    packadd! matchit		" needed for matlab indentation functionality
endif

set autochdir			" cwd to current file



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



"------------------------------------------------------------------"
" vimlab setup
"------------------------------------------------------------------"

"" vim-slime 
"if hostname() == "zenbook"
"    let g:slime_target = "tmux"
"    let g:slime_dont_ask_default = 1
"    let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}
"    let g:slime_paste_file = "/tmp/slime_paste"
"endif

" mlint code checking 
if hostname() == "zenbook"
    let g:mlint_path_to_mlint = expand("$HOME") . "/applications/MATLAB/R2018b/bin/glnxa64/mlint"
else
    let g:mlint_path_to_mlint = "to be filled in later"
endif
let g:mlint_hover = 0

" session saving
let g:vimlab_session = "~/.vim/sessions/matlab-session.vim"
