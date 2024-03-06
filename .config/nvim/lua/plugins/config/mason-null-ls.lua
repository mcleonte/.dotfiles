return function()
	-- local null_ls = require("nulls-ls")
	local mason_null_ls = require("mason-null-ls")
	mason_null_ls.setup({
		ensure_installed = {
			-- "stylua",
			-- "luacheck", -- null-ls: "command luacheck not executable" error
			-- "prettier",
			-- "black",
			-- "autopep8",
			-- "yapf",
			-- "pylint",
		},
		automatic_installation = true,
		-- automatic_setup = true,
	})
	-- null_ls.setup()
end
