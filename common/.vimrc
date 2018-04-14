execute pathogen#infect()

call pathogen#helptags()

syntax on

set hidden
set number
set nowrap
set nocompatible
set wildmenu
set splitright

set clipboard=unnamedplus

filetype plugin indent on

" netrw settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" Use 2 spaces for a tab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

let g:airline#extensions#tabline#enabled = 1
