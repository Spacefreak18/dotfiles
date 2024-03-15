
:lua require("mason").setup()
:lua require("mason-nvim-dap").setup()

:lua require("lualine").setup()
:lua require("treesitter")
:lua require("keymaps")
:lua require("setcmp")
:lua require("lsp")
:lua require("dapui").setup()
":lua vim.lsp.set_log_level('trace')
let g:fzf_preview_window = ['right:hidden', 'ctrl-/']

lua << EOF
  require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

let g:db_ui_auto_execute_table_helpers = 1
