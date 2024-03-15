
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

Plug 'juneedahamed/vc.vim'

Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
"Plug 'theHamsta/nvim-dap-virtual-text'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'airblade/vim-rooter'
Plug 'tpope/vim-sleuth'

Plug 'tpope/vim-abolish'

Plug 'flazz/vim-colorschemes'
Plug 'axelf4/vim-strip-trailing-whitespace'

Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'

"Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }

"Plug 'mhinz/vim-startify'

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'onsails/lspkind.nvim'

Plug 'williamboman/mason.nvim'
Plug 'nvim-lualine/lualine.nvim'

Plug 'jay-babu/mason-nvim-dap.nvim'

Plug 'nvim-tree/nvim-web-devicons'
Plug 'folke/trouble.nvim'
" Initialize plugin system
call plug#end()

