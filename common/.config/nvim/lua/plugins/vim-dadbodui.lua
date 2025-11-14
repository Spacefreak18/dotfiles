return {
  -- https://github.com/kristijanhusak/vim-dadbod-ui
  'kristijanhusak/vim-dadbod-ui',
  branch = 'master',
  dependencies = {
    'tpope/vim-dadbod',
  },
  dependencies = {
    { 'tpope/vim-dadbod', lazy = true },
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true }, -- Optional
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1
  end,
}
