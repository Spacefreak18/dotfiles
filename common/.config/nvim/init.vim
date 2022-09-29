set runtimepath+=/usr/share/vim/vimfiles/
set runtimepath+=/~/.nvim/plugged/
" Specify a directory for plugins
call plug#begin('~/.cache/nvim/plugged')

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'neovim/nvim-lspconfig'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

"Plug 'nvim-telescope/telescope.nvim'
"Plug 'nvim-telescope/telescope-dap.nvim'
"Plug 'folke/which-key.nvim'
"Plug 'liuchengxu/vim-which-key'
"Plug 'AckslD/nvim-whichkey-setup.lua'

"Plug 'glepnir/lspsaga.nvim'

Plug 'mfussenegger/nvim-jdtls'

Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'

Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/nvim-compe'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'airblade/vim-rooter'
Plug 'tpope/vim-sleuth'

Plug 'tpope/vim-abolish'

Plug 'flazz/vim-colorschemes'
Plug 'axelf4/vim-strip-trailing-whitespace'

" Initialize plugin system
call plug#end()

" let g:mapleader = "\<Space>"
" let g:maplocalleader = ','
" nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
" nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>


silent! source ~/.config/nvim/global.vim
silent! colorscheme delek
silent! source .nvimrc

:lua require('treesitter')
:lua require("keymaps")
:lua require("dapui").setup()
" :lua vim.lsp.set_log_level('trace')

set completeopt=menuone,noselect
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.tags = v:true
let g:compe.source.ultisnips = v:true

