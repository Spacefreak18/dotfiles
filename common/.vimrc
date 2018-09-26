" this is for neovim to use the debian packaged vim plugins
" will work without errors if you do as root
" I don't think these directories are needed in neovim
" mkdir /usr/share/nvim/runtime/pack/dist/opt/matchit
" mkdir /usr/share/nvim/runtime/pack/dist/opt/editexisting

if (isdirectory("~/.SpaceVim"))
  execute 'source' fnamemodify(expand('<sfile>'), ':h').'/.SpaceVim/config/main.vim'
endif

if (!isdirectory("~/.SpaceVim"))
set runtimepath+=/usr/share/vim/addons
set runtimepath+=~/.vim
let &packpath=&runtimepath

" set path for find for pwd at vim start
set path=**

"source ~/.vim/*.vimrc

execute pathogen#infect()
call pathogen#helptags()

syntax on
silent! colorscheme pablo
silent! colorscheme vividchalk

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
" apt-get install vim-airline
silent! let g:airline#extensions#tabline#enabled = 1

" https://github.com/vim-syntastic/syntastic
" apt-get install vim-syntastic
silent! set statusline+=%#warningmsg#
silent! set statusline+=%{SyntasticStatuslineFlag()}
silent! set statusline+=%*

silent! let g:syntastic_always_populate_loc_list = 0
silent! let g:syntastic_auto_loc_list = 1
silent! let g:syntastic_check_on_open = 1
silent! let g:syntastic_check_on_wq = 1

" https://github.com/Shougo/deoplete.nvim
if has('nvim')
  let g:deoplete#enable_at_startup = 1
endif

" ends check for spacevim
endif
