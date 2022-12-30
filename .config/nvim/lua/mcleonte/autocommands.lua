local c = vim.cmd

-- Autocommand that reloads neovim whenever you save the plugins.lua file
c [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost $HOME/.config/nvim/lua/plugins/init.lua source <afile> | PackerSync
  augroup end
]]

-- Save and load buffer folds when leaving and entering window
-- c([[
--   au BufWinLeave *.{py,lua} mkview
--   au BufWinEnter *.{py,lua} silent! loadview
-- ]])

c([[
  au BufEnter <buffer> exec "normal! i"
  au BufWinLeave term://* stopinsert
]])
