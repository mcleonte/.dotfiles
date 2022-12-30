return function()
  local dap_python = require("dap-python")
  dap_python.setup("~/cs/.envs/py/nvim/bin/python")
  dap_python.test_runner = "pytest"
end
