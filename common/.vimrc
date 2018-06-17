" this is for neovim to use the debian packaged vim plugins
" will work without errors if you do as root
" I don't think these directories are needed in neovim
" mkdir /usr/share/nvim/runtime/pack/dist/opt/matchit
" mkdir /usr/share/nvim/runtime/pack/dist/opt/editexisting
set runtimepath+=/usr/share/vim/addons
let &packpath=&runtimepath

"source ~/.vim/*.vimrc

" no longer loading any non-packaged addons
" until then I'll leave this disabled
"execute pathogen#infect()
"call pathogen#helptags()

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

" https://github.com/vim-airline/vim-airline.git
let g:airline#extensions#tabline#enabled = 1
