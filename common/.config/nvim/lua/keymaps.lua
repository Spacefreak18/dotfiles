-- require('dap').set_log_level('INFO')
local dap = require('dap')
dap.defaults.fallback.terminal_win_cmd = '20split new'
vim.fn.sign_define('DapBreakpoint', {text='🟥', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='🟦', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='⭐️', texthl='', linehl='', numhl=''})

vim.keymap.set('n', '<leader>dh', function() require"dap".toggle_breakpoint() end)
vim.keymap.set('n', '<leader>t', function() require"dap".toggle_breakpoint() end)
vim.keymap.set('n', '<leader>dH', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set('n', '<F4>', function() require"dap".step_out() end)
vim.keymap.set('n', "<F7>", function() require"dap".step_into() end)
vim.keymap.set('n', '<F8>', function() require"dap".step_over() end)
vim.keymap.set('n', '<F5>', function() require"dap".continue() end)
vim.keymap.set('n', '<leader>dn', function() require"dap".run_to_cursor() end)
vim.keymap.set('n', '<leader>dx', function() require"dap".terminate() end)
vim.keymap.set('n', '<leader>dC', function() require"dap".clear_breakpoints() end)
vim.keymap.set('n', '<leader>de', function() require"dap".set_exception_breakpoints({"all"}) end)
vim.keymap.set('n', '<leader>da', function() require"debugHelper".attach() end)
vim.keymap.set('n', '<leader>dA', function() require"debugHelper".attachToRemote() end)
vim.keymap.set('n', '<leader>di', function() require"dap.ui.widgets".hover() end)
vim.keymap.set('n', '<leader>dz', function() require"dapui".eval() end)
vim.keymap.set('n', '<leader>do', function() require"dapui".eval() require"dapui".eval() end)
vim.keymap.set('n', '<leader>d?', function() local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes) end)
vim.keymap.set('n', '<leader>dk', ':lua require"dap".up()<CR>zz')
vim.keymap.set('n', '<leader>dj', ':lua require"dap".down()<CR>zz')
vim.keymap.set('n', '<leader>dR', ':lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l')


vim.keymap.set('n', '<leader>u', ':lua require"dapui".toggle()<CR>')
--vim.keymap.set('n', '<leader>u', function() require"dapui".toggle() end)
vim.keymap.set('n', '<leader>n', ":bnext<cr>");
vim.keymap.set('n', '<leader>p', ":bprev<cr>");
vim.keymap.set('n', '<leader>b', ":Buffers<cr>");
vim.keymap.set('n', '<leader>h', ":History<cr>");
