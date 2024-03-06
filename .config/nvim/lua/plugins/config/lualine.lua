local _ = {
  pwd = function()
    return vim.fn.fnamemodify(vim.fn.getcwd(-1, -1), ":~")
  end,
}

return function()
  require("lualine").setup({
    options = {
      debug = true,
      section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" },
      globalstatus = true,
      ignore_focus = { "NvimTree" },
      refresh = {
        statusline = 200,
      },
      disabled_filetypes = {
        "packer",
        "NvimTree",
      },
    },
    sections = {
      lualine_a = { { "mode", upper = false }, "g:active_layers" },
      lualine_b = { { "branch", icon = "" }, "diff", "diagnostics" },
      lualine_c = {
        { "filename", path = 1, file_status = true, shorting_target = 0 },
      },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    tabline = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {
        {
          "windows",
          show_filename_only = true,
          mode = 2,
          show_modified_status = true,
          filetype_names = {
            NvimTree = "NTree",
          },
        },
      },
      lualine_x = {},
      lualine_y = {},
      lualine_z = { { "tabs", mode = 1, max_length = vim.o.columns } },
    },
    extensions = { { sections = { lualine_b = { "filetype" } }, filetypes = { "NvimTree" } } },
  })
end
