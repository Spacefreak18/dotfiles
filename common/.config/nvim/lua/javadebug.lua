local bundles = {
    vim.fn.glob("/home/paul/git/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar")
};

local on_attach = function(client, bufr)
    require('jdtls').setup_dap()
    require'lsp'.common_on_attach(client, bufr)
    require('jdtls.dap').setup_dap_main_class_configs()
    --require('jdtls.setup').add_commands()
end

require('jdtls').start_or_attach({
    on_attach = on_attach,
    cmd = {"java-lsp.sh"},
    root_dir = require('jdtls.setup').find_root({'build.gradle', 'pom.xml', '.git'}),
    init_options = {bundles = bundles}
})

-- require('jdtls.dap').setup_dap_main_class_configs()
local dap = require('dap')

-- dap.adapters.java = {
 --     type = 'server';
   --   host = '127.0.0.1';
     -- port = 8000;
   -- }

   dap.configurations.java = {
      {
        type = 'java';
        request = 'attach';
        name = 'Tomcat';
        hostName = '127.0.0.1';
        port = 8000;
        projectName = 'nw_business';
      },
    }
  dap.defaults.fallback.external_terminal = {
   -- command = '/usr/bin/alacritty';
   -- args = {'-e'};
  }
-- require("dapui").setup()
