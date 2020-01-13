" dein
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  " Custom Plugins
  ""call dein#add('wsdjeg/FlyGrep.vim')
  call dein#add('vim-scripts/dbext.vim')
  call dein#add('neomake/neomake')
  call dein#add('yegappan/grep')
  call dein#add('juneedahamed/vc.vim')
  call dein#add('AndrewRadev/inline_edit.vim')
  call dein#add('AndrewRadev/linediff.vim')
  call dein#add('Chiel92/vim-autoformat')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable
