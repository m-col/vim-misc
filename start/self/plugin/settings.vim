set nocompatible		" be iMproved, required
filetype plugin indent on	" required
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

let g:netrw_liststyle=0		" Set netrw style to thin listing

" restore last line in opened file
au BufReadPost *
	    \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
	    \ |   exe "normal! g`\""
	    \ | endif

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
let g:indentLine_conceallevel = 0

runtime macros/emoji-ab.vim

" Only linters listed explicitly will be run.
let g:ale_linters_explicit = 1
let g:ale_linters = {
\   'haskell': ['hlint'],
\   'python': ['flake8', 'pyright', 'ruff'],
\}
" Don't show errors in virtual text or signs column; rely on echoed message instead
let g:ale_virtualtext_cursor = 0
let g:ale_set_signs = 0
"let g:ale_command_wrapper = 'nice -n5'
let g:ale_fixers = {
\   'haskell': ['ormolu'],
\   'python': ['black', 'ruff'],
\}
"\   'markdown': ['prettier'],

let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_json_conceal=0
let g:markdown_syntax_conceal=0

let g:any_jump_references_only_for_current_filetype = 1
let g:any_jump_disable_vcs_ignore = 1

" Blamer plugin disable by default
let g:blamer_delay = 1000
let g:blamer_show_in_insert_modes = 0
let g:blamer_date_format = '%d/%m/%y'
highlight Blamer guifg=lightgrey
