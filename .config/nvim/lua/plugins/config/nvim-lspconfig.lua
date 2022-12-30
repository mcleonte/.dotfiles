return function()
  local vim = vim
  local set = vim.keymap.set

  local opts = { noremap = true, silent = true }
  set("n", "<space>e", vim.diagnostic.open_float, opts)
  set("n", "[d", vim.diagnostic.goto_prev, opts)
  set("n", "]d", vim.diagnostic.goto_next, opts)
  set("n", "<space>q", vim.diagnostic.setloclist, opts)

  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    set("n", "gD", vim.lsp.buf.declaration, bufopts)
    set("n", "gd", vim.lsp.buf.definition, bufopts)
    set("n", "K", vim.lsp.buf.hover, bufopts)
    set("n", "gi", vim.lsp.buf.implementation, bufopts)
    set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
    set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
    set("n", "<space>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
    set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
    set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
    set("n", "gr", vim.lsp.buf.references, bufopts)
    set("n", "<space>f", function()
      vim.lsp.buf.format({ async = true })
    end, bufopts)
  end

  local lspconfig = require("lspconfig")

  require("mason-lspconfig").setup_handlers({

    function(server_name)
      lspconfig[server_name].setup({
        on_attach = on_attach,
      })
    end,

    ["sumneko_lua"] = function()
      lspconfig["sumneko_lua"].setup({
        on_attach = on_attach,
        settings = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using
              -- (most likely LuaJIT in the case of Neovim)
              version = "LuaJIT",
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              -- not working...
              globals = { "vim" },
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file("", true),

              -- https://github.com/neovim/nvim-lspconfig/issues/1700
              -- prevent message on every startup
              checkThirdParty = false,
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
              enable = false,
            },
            --          format = {
            --            enable = true,
            --            defaultConfig = {
            --              indent_style = "space",
            --              indent_size = "2",
            --            }
            --          },
          },
        },
      })
    end,
  })
end
