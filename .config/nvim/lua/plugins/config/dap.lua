return function()
  local vim = vim
  local dap = require("dap")

  dap.defaults.fallback.terminal_win_cmd = "50vsplit new"

  dap.adapters.python = {
    type = "executable",
    command = vim.g.python3_host_prog,
    args = { "-m", "debugpy.adapter" },
  }

  dap.configurations.python = {
    {
      type = "python",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      pythonPath = vim.g.python3_host_prog,
    },
  }
end
