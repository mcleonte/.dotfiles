local c = vim.cmd

-- Autocommand that reloads neovim whenever you save the plugins.lua file
c([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost $HOME/.config/nvim/lua/plugins/init.lua source <afile> | PackerSync
  augroup end
]])

-- Save and load buffer folds when leaving and entering window
-- c([[
--   au BufWinLeave *.{py,lua} mkview
--   au BufWinEnter *.{py,lua} silent! loadview
-- ]])

c([[
  au BufEnter <buffer> exec "normal! i"
  au BufWinLeave term://* stopinsert
]])

vim.api.nvim_create_autocmd("VimEnter", {
	pattern = "*",
	callback = function()
		-- Check for .git directory
		local f = io.open(".git", "r")
		if f ~= nil then
			io.close(f)
			return
		end

		-- Set environment variables
		vim.env.GIT_DIR = vim.env.HOME .. "/.dotfiles/"
		vim.env.GIT_WORK_TREE = vim.env.HOME .. "/"
	end,
})
