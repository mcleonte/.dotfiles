local vim = vim
local lspconfig = require("lspconfig")

lspconfig.sumneko_lua.setup({
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

lspconfig.jedi_language_server.setup({})

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
