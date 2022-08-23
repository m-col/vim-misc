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

if stridx(hostname(), "book") != -1
    "Plugin 'vimwiki/vimwiki'		    " vimwiki
    "Plugin 'gu-fan/riv.vim'
    Plugin 'https://mcol.xyz/code/vimlab'   " vimlab
    Plugin 'lervag/vimtex'		    " vimtex
    Plugin 'dense-analysis/ale'             " ALE
    Plugin 'neovimhaskell/haskell-vim'      " better haskell syntax highlighting
endif

Plugin 'https://gitlab.com/gi1242/vim-emoji-ab.git' " emoji input support
Plugin 'vmchale/dhall-vim'              " dhall highlighting
Plugin 'tpope/vim-fugitive'             " git plugin
Plugin 'https://mcol.xyz/code/vim-misc'	    " my vimrc and misc functions 
Plugin 'https://mcol.xyz/code/tide'	    " tmux ide 
"Plugin 'airblade/vim-gitgutter'		    " gitgutter
Plugin 'Yggdroot/indentLine'                "Show indentation lines
Plugin 'masukomi/vim-markdown-folding'      "markdown folding


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
set formatoptions+=j	        " Delete comment characters when joining lines.
"autocmd FileType * setlocal formatoptions-=cro    " disable autocommenting
set matchtime=2
set conceallevel=0              " disable all concealing
set nojoinspaces                " don't put 2 spaces after periods when joining lines

set undolevels=200		" Number of undo levels
set undodir=~/.vim/undo//	" undo files
set backupdir=~/.vim/backups//	" backups
set directory=~/.vim/swap//	" swap files
set noswapfile

set splitbelow			" default new sp window goes below
set splitright			" default new vsp window goes right
set scrolloff=4			" keep x lines at top and bottom visible when scrollingkeep x lines at top and bottom visible when scrolling
autocmd VimResized * wincmd =	" keep splits equal size when resizing window

syntax on			" enable syntax highlighting
set mouse=a			" enable mouse
set t_Co=16			" use the 16 terminal colours

set sessionoptions=buffers,folds,tabpages
set viewoptions=folds,cursor

set wildmenu			" enable wildmenu for tab completion of commands
set wildignorecase		" disable wildmenu case sensitivity
set wildmode=full:list		" format wildmenu to expand and scroll with tab

set autochdir			" cwd to current file

let g:netrw_liststyle=3		" Set netrw style to tree

" Misc ------------------------------------------------------------"

" restore last line in opened file
au BufReadPost *
	    \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
	    \ |   exe "normal! g`\""
	    \ | endif

" machine specific settings
if stridx(hostname(), "book") != -1

    packadd! matchit		" needed for matlab indentation functionality
    let g:vimlab_session = "~/.vim/sessions/matlab-session.vim"

    let g:vimtex_view_general_viewer = 'qpdfview'
    let g:vimtex_view_general_options = '--unique @pdf\#src:@tex:@line:@col'
    let g:vimtex_view_qpdfview_hook_callback = 'ViewerCallback'
    let g:vimtex_compiler_latexmk = {'build_dir' : '.latex_build'}
    let g:vimtex_syntax_conceal_disable = 1
    function! ViewerCallback() dict
        VimtexView
    endfunction

    "let g:riv_projects = [{ 'path': '~/git/phd', }]
    "let g:riv_disable_folding = 1
    "set mmp=2000
endif

" Intelligently navigate tmux panes and Vim splits using the same keys.
" See https://sunaku.github.io/tmux-select-pane.html for documentation.
let progname = substitute($VIM, '.*[/\\]', '', '')
if empty(v:servername)
    set title titlestring=%{progname}\ [%n]\ %F
else
    set title titlestring=%{progname}\ [%{v:servername}]\ [%n]\ %F
endif
if &term =~ '^screen' && !has('nvim') | exe "set t_ts=\e]2; t_fs=\7" | endif


if exists("$WAYLAND_DISPLAY")
    set ttym=sgr
endif

let g:indentLine_defaultGroup = 'LineNr'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:vim_json_concel = 0
let g:markdown_syntax_conceal = 0

runtime macros/emoji-ab.vim

let g:ale_linters = {
\   'haskell': ['hlint'],
\   'python': ['flake8', 'mypy'],
\}
let g:ale_linters_explicit = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_fixers = {}
let g:ale_fixers.python = ['black', 'isort']
let g:ale_fixers.haskell = ['ormolu']
