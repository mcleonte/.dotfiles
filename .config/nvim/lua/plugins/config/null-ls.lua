return function()
	local null_ls = require("null-ls")
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

	null_ls.setup({
		-- debug = true,
		notify_format = nil,
		log_level = "warn",
		diagnostics_format = "[#{s}] [#{c}]: #{m}",
		sources = {

			-- python
			null_ls.builtins.diagnostics.pylint.with({
			}),

			null_ls.builtins.formatting.yapf.with({
			}),

			-- sql
			null_ls.builtins.formatting.sqlfluff.with({
			}),
			null_ls.builtins.diagnostics.sqlfluff.with({
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
  local function get_python_host_prog()
    local cwd = vim.fn.getcwd()
    if vim.fn.glob(cwd .. "/poetry.lock") then
      local venv = vim.fn.trim(vim.fn.system("poetry env info -p"))
      if vim.fn.system('if [ -d "' .. venv .. '" ]; then echo "1"; fi') == "1" then
        return venv .. "/bin/python"
      end
    end
    if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
      return cwd .. "/venv/bin/python"
    elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
      return cwd .. "/.venv/bin/python"
      -- elseif vim.fn.exists("$VIRTUAL_ENV") then -- concatenate nil value error?
      -- 	return os.getenv("VIRTUAL_ENV") .. "/bin/python"
    else
      return "/usr/bin/python"
    end
  end

  local pyexec = get_python_host_prog()
  vim.g.python3_host_prog = pyexec
  local venv_bin_dir = string.gsub(pyexec, "/python$", "")
        command = venv_bin_dir .. "/pylint",
        command = venv_bin_dir .. "/yapf",
        command = venv_bin_dir .. "/sqlfluff",
        command = venv_bin_dir .. "/sqlfluff",
end
