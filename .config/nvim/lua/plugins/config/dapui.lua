local sign_define = vim.fn.sign_define

return function()
  local dapui = require("dapui")

  dapui.setup({
    icons = { expanded = "▾", collapsed = "▸" },
    mappings = {
      -- Use a table to apply multiple mappings
      expand = { "<CR>", "<2-LeftMouse>" },
      open = "o",
      remove = "d",
      edit = "e",
      repl = "r",
      toggle = "t",
    },
    layouts = {
      {
        elements = {
          "watches",
          "scopes",
          "breakpoints",
          "stacks",
        },
        size = 32,
        position = "right",
      },
      {
        elements = {
          "console",
        },
        size = 10,
        position = "bottom",
      },
    },
  })

  sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint" })
  sign_define("DapBreakpointCondition", { text = "", texthl = "DapBreakpointCondition" })
  sign_define("DapLogPoint", { text = "", texthl = "DapLogPoint" })
end
