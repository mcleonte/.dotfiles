local set = vim.keymap.set

return function()
  local neotest = require("neotest")

  local on_attach = function()
    -- set("n", "<leader>T", neotest.run.run())
  end

  neotest.setup({
    on_attach = on_attach,
    adapters = {
      require("neotest-python")({
        dap = { justMyCode = false },
        runner = "pytest",
        args = {
          "--log-level",
          "DEBUG",
        },
        python = vim.g.python3_host_prog,
      }),
    },
  })
end
