syntax on
filetype plugin indent on
syntax enable
set autoindent
"Note, smartindent annoyingly causes python comments to be left justified.
"cindent works fine
"set smartindent
set cindent
set expandtab
set modeline
set ls=2
set softtabstop=4 shiftwidth=4
set textwidth=0 wrapmargin=0
"set undofile                " Save undo's after file closes
"set undodir=$HOME/.vim/undo " where to save undo histories
"set undolevels=1000         " How many undos
"set undoreload=10000        " number of lines to save for undo
set viminfo='20,<10000
set mouse-=a
set nowrapscan "disable wrapping around to beginning when searching
set hlsearch
map <F1> <Esc>
imap <F1> <Esc>
