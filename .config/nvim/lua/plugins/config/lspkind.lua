return function()
	require("lspkind").init({
		mode = "symbol_text",
		preset = "codicons",
		symbol_map = {
			Text = "",
			Method = "ƒ",
			Function = "",
			Constructor = "",
			Variable = "[]",
			Class = "  ",
			Interface = "ﰮ",
			Module = "",
			Property = "",
			Unit = " 塞 ",
			Value = "  ",
			Enum = " 練",
			Keyword = "",
			Snippet = "﬌",
			Color = "",
			File = "",
			Folder = " ﱮ ",
			EnumMember = "  ",
			Constant = "",
			Struct = "  ",
		},
	})
end
