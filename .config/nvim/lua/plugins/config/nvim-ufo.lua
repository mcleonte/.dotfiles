return {
  opt = true,
  event = { "BufReadPre" },
  wants = { "promise-async" },
  requires = "kevinhwang91/promise-async",
  config = function()
    vim.keymap.set("n", "zR", require("ufo").openAllFolds)
    vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

    -- Tell the server the capability of foldingRange,
    -- Neovim hasn't added foldingRange to default capabilities, users must add it manually
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true
    }
    local language_servers = {
      "jedi_language_server",
      "sumneko_lua"
    } -- like {'gopls', 'clangd'}
    for _, ls in ipairs(language_servers) do
      require('lspconfig')[ls].setup({
        capabilities = capabilities,
        --       other_fields = ...
      })
    end

    require("ufo").setup {
      provider_selector = function(bufnr, filetype, buftype)
        return "lsp" -- {"lsp", "treesitter"} is bugged for now, triggers error for >2
      end,
    }
  end
}
