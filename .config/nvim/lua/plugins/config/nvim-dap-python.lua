return function()
  local dap_python = require("dap-python")
  dap_python.setup(vim.g.python3_host_prog)
  dap_python.test_runner = "pytest"
end
