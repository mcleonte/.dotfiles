return function()
  require("neotest").setup({
    adapters = {
      require("neotest-python")({
        dap = { justMyCode = false },
        runner = "pytest",
        args = {
          "--log-level",
          "DEBUG",
        },
        python = "/home/leo/cs/.envs/py/nvim/bin/python",
      }),
    },
  })
end
