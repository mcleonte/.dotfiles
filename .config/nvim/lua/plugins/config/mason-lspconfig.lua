return {
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "sumneko_lua", -- lua
        "dockerls", -- docker
        "jsonls", -- json
        "ltex", -- latex
        "marksman", -- markdown
        "jedi_language_server", -- python
        "sqls", -- sql
        "taplo", -- toml
        "terraformls", -- terraform
        "yamlls", -- yaml
        "html", -- html
        "cssls", -- css
        "bashls", -- bash
      }
    })
  end
}
