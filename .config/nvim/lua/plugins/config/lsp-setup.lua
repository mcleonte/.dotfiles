return {
  config = function()
    require('lsp-setup').setup({
      servers = {
        sumneko_lua = require('lua-dev').setup({
          lspconfig = {
            settings = {
              Lua = {
                format = {
                  enable = true,
                }
              }
            }
          },
        }),
        jedi_language_server = {}
      }
    })
  end
}
