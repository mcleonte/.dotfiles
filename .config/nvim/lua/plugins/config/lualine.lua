return function()
  require("lualine").setup({
    options = {
      component_separators = { left = "|", right = "|" },
    },
  })
end
