set path=**
set clipboard=unnamedplus

set hidden
set number
set nowrap
set nocompatible
set wildmenu
set splitright
set nosol

filetype plugin indent on

" netrw settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" Use 2 spaces for a tab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set autoindent
set copyindent

cnoreabbrev W w
cnoreabbrev Find find

silent! colorscheme delek
silent! let $XMLLINT_INDENT=repeat(" ", &tabstop)

" Searching
set showmatch
set ignorecase
set hlsearch
set incsearch

set backupdir=~/.cache/vtemp/backup//
set directory=~/.cache/vtemp/swap//
set undodir=~/.cache/vtemp/undo//

silent! source .nvimrc
