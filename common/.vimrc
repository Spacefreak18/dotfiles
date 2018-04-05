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

" start NERDTree
autocmd VimEnter * NERDTree
" if vim is open without a file, nerdtree is opened by default
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" since NERDTree was started move back to the previous buffer
autocmd VimEnter * wincmd p

" will exit vim if only buffer left open is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" au VimEnter * split


" Use 2 spaces for a tab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
