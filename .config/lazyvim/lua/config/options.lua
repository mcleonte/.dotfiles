-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local function ensure_python_host()
  if vim.g.python3_host_prog ~= nil then
    return vim.g.python3_host_prog
  end
  local cwd = vim.fn.getcwd()
  -- if vim.fn.glob(cwd .. "/poetry.lock") then
  -- 	local venv = vim.fn.trim(vim.fn.syjtem("poetry env info -p"))
  -- 	if vim.fn.system('if [ -d "' .. venv .. '" ]; then echo "1"; fi') == "1" then
  -- 		vim.g.python3_host_prog = venv .. "/bin/python"
  -- 		return
  -- 	end
  -- end
  --
  local pyhost
  if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
    pyhost = cwd .. "/venv/bin/python"
  elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
    pyhost = cwd .. "/.venv/bin/python"
    -- elseif vim.fn.exists("$VIRTUAL_ENV") then -- concatenate nil value error?
    -- 	return os.getenv("VIRTUAL_ENV") .. "/bin/python"
  else
    pyhost = "/usr/bin/python"
  end
  vim.g.python3_host_prog = pyhost
  return pyhost
end

ensure_python_host()
-- return {
--   ensure_python_host = ensure_python_host,
-- }
--

-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--   callback = function()
--     -- try_lint without arguments runs the linters defined in `linters_by_ft`
--     -- for the current filetype
--     require("lint").try_lint()
--
--     -- You can call `try_lint` with a linter name or a list of names to always
--     -- run specific linters, independent of the `linters_by_ft` configuration
--     -- require("lint").try_lint("cspell")
--   end,
-- })
