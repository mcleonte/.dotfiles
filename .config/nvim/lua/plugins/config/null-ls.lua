return function()
  local null_ls = require("null-ls")
  local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

  null_ls.setup({
    debug = true,
    -- log_level = "trace",
    diagnostics_format = "[#{s}] [#{c}]: #{m}",
    sources = {

      -- python
      null_ls.builtins.diagnostics.pylint.with({
        command = "/home/leo/cs/.envs/py/nvim/bin/pylint",
      }),

      null_ls.builtins.formatting.yapf.with({
        command = "/home/leo/cs/.envs/py/nvim/bin/yapf",
        extra_args = {
          "--style",
          "yapf",
        },
      }),

      -- markdown
      null_ls.builtins.formatting.prettier,

      -- lua
      null_ls.builtins.formatting.stylua,
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
