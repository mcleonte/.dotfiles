local libmodal = require("libmodal")
local dapui = require("dapui")

local mappings = {
  ["<F7>"] = function()
    dapui.toggle()
  end,
}

vim.keymap.set("n", "<F6>", function()
  libmodal.mode.enter("DEBUG", mappings)
  -- debugmode:enter()
end, "Enter debugmode")

--return function() end
