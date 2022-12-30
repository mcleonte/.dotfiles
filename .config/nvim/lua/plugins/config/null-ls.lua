return function()
  local null_ls = require("null-ls")
  local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

  null_ls.setup({
    debug = true,
    -- log_level = "trace",
    diagnostics_format = "[#{s}] [#{c}]: #{m}",
    sources = {

      -- python
      null_ls.builtins.formatting.black,

      -- markdown
      null_ls.builtins.formatting.prettier,

      --null_ls.builtins.formatting.autopep8.with({
      --  args = {
      --    '--max-line-length',
      --    '88',
      --    '--aggressive',
      --  }
      --}),
      --null_ls.builtins.formatting.black.with({
      --  extra_args = {
      --    '--line-length',
      --    '80',
      --    '--experimental-string-processing',
      --  },
      --}),

      -- null_ls.builtins.diagnostics.flake8,

      -- lua -- no need, using sumneko's new lua formatter
      null_ls.builtins.formatting.stylua,
      -- null_ls.builtins.diagnostics.luacheck
    },

    on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
            vim.lsp.buf.format({
              bufnr = bufnr,
              -- filter = function()
              --  return client.name == "null-ls"
              -- end
            })
          end,
        })
      end
    end,
  })
end
