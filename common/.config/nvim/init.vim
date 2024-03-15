set runtimepath+=/usr/share/vim/vimfiles/
set runtimepath+=/~/.nvim/plugged/

silent! source ~/.config/nvim/plugged.vim
silent! source ~/.config/nvim/plugconfig.vim
" let g:mapleader = "\<Space>"
" let g:maplocalleader = ','
" nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
" nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>


silent! source ~/.config/nvim/global.vim
silent! colorscheme delek
silent! source .nvimrc


