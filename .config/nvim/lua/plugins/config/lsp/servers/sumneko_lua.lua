local utils = require "plugins.config.lsp.utils"
local configs = {
  on_attach = function(client, bufnr)
    utils.common.on_attach(client, bufnr)
  end,
}
require("lspconfig").sumneko_lua.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})
