return function()
  require("mason-lspconfig").setup({
    -- lsp servers to automatically install if they are not installed
    ensure_installed = {
      -- "sumneko_lua", -- lua
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
    },
    -- automatically install lsp servers configured via lspconfig
    automatic_installation = true,
  })
end
