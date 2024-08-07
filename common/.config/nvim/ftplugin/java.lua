local bundles = {
    --vim.fn.glob("/home/paul/git/com.microsoft.java.debug.plugin-*.jar", 1)
    vim.fn.glob("/home/paul/.local/share/nvim/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin.jar")
}


local config = {
    cmd = {
        --"/home/paul/.sdkman/candidates/java/jbr-17.0.10-linux-x64-b1207.12/bin/java",
        "/home/paul/.sdkman/candidates/java/17.0.10-jbr/bin/java",
        --"/home/paul/.sdkman/candidates/java/17.0.6-amzn/bin/java",
        --"/home/paul/.sdkman/candidates/java/21.0.2-amzn/bin/java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xms1g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens",
        "java.base/java.util=ALL-UNNAMED",
        "--add-opens",
        "java.base/java.lang=ALL-UNNAMED",
        --
        "-jar", "/home/paul/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.800.v20240330-1250.jar",
        "-configuration", "/home/paul/.local/share/nvim/mason/packages/jdtls/config_linux",
        "-data", "/home/paul/.lsp/java/calc50main2/"
    },
    root_dir = require('jdtls.setup').find_root({'.svn'}),
    settings = {
        java = {
          configuration = {
            runtimes = {
              {
                name = "JavaSE-17",
                path = "/home/paul/.sdkman/candidates/java/17.0.10-jbr",
              }
            }
          },
            signatureHelp = {enabled = true},
            import = {enabled = true},
            rename = {enabled = true}
        }
    },
    init_options = {
        bundles = bundles;
    }
}
-- --
-- -- Mappings.
-- -- See `:help vim.lsp.*` for documentation on any of the below functions
local bufopts = { noremap=true, silent=true, buffer=bufnr }
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
vim.keymap.set('n', '<space>wl', function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))

vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end, bufopts)


require('jdtls').setup_dap()
--require('jdtls').setup_dap({ hotcodereplace = 'auto' })
require('jdtls').start_or_attach(config)
