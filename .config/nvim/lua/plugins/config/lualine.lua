local _ = {
	pwd = function()
		return vim.fn.fnamemodify(vim.fn.getcwd(-1, -1), ":~")
	end,
}

return function()
	require("lualine").setup({
		options = {
			section_separators = { left = "", right = "" },
			component_separators = { left = "", right = "" },
			globalstatus = true,
		},
		sections = {
			lualine_a = { { "mode", upper = false } },
			lualine_b = { { "branch", icon = "" }, "diff", "diagnostics" },
			lualine_c = { { "filename", path = 1, file_status = false, shorting_target = 0 } },
			lualine_x = { "encoding", "fileformat", "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { { "filename", path = 1 } },
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {
			lualine_a = { { "tabs", mode = 1, max_length = vim.o.columns } },
			lualine_b = {},
			lualine_c = {},
			lualine_x = {
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
			lualine_y = {},
			lualine_z = {},
		},
		winbar = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
		inactive_winbar = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
		extensions = { { sections = { lualine_b = { "filetype" } }, filetypes = { "NvimTree" } } },
	})
end
