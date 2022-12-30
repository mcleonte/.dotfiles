return function()
	require("lsp_signature").setup({
		bind = true, -- mandatory, else border config won't get registered.
		doc_lines = 2,
		floating_window = true,
		fix_pos = true,
		hint_enable = true,
		hint_prefix = " ",
		hint_scheme = "String",
		hi_parameter = "Search",
		max_height = 22,
		max_width = 120,
		handler_opts = {
			border = "single",
		},
		zindex = 200,
		padding = "",
	})
end
