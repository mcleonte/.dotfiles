return function()
	local nightfox = require("nightfox")

	local p = {
		-- black = { base = "#24112C", bright = "#843FA2", dim = "#180B1D" },
		-- white = { base = "#E5DCC5", bright = "#FFFFFF", dim = "#D9CCAB" },
		-- red = { base = "#E2126D", bright = "#EE2F82", dim = "#BD0F5A" },
		-- green = { base = "#37FF8B", bright = "#70FFAC", dim = "#00CC55" },
		-- blue = { base = "#825CFF", bright = "#A185FF", dim = "#5E2BFF" },
		-- yellow = { base = "#FCD581", bright = "#FDE4AF", dim = "#FBCA60" },
		-- magenta = { base = "#FF00FF", bright = "#FF5CFF", dim = "#CC00CC" },
		-- cyan = { base = "#56CBF9", bright = "#89DAFB", dim = "#3AC2F8" },
		-- orange = { base = "#FC6136", bright = "#FC7753", dim = "#FB410E" },
		-- pink = { base = "#E952DE", bright = "#EF81E7", dim = "#E538DA" },

		-- black = { base = "#28112C", bright = "#933FA2", dim = "#1A0B1D" },
		-- white = { base = "#E5DCD5", bright = "#FFFFFF", dim = "#D9CCC2" },
		-- red = { base = "#E212A7", bright = "#EE2FB8", dim = "#BD0F8B" },
		-- green = { base = "#8BFF8B", bright = "#ACFFAC", dim = "#55CC55" },
		-- blue = { base = "#C05CFF", bright = "#D085FF", dim = "#AE2BFF" },
		-- yellow = { base = "#FCD5BE", bright = "#FDE4D6", dim = "#FBCAAD" },
		-- magenta = { base = "#FF00FF", bright = "#FF5CFF", dim = "#CC00CC" },
		-- cyan = { base = "#A7CBF9", bright = "#C2DAFB", dim = "#99C2F8" },
		-- orange = { base = "#FC6199", bright = "#FC77A7", dim = "#FB4184" },
		-- pink = { base = "#E952E3", bright = "#EF81EB", dim = "#E538DF" },

		black = { base = "#201134", bright = "#753FC2", dim = "#140B22" },
		white = { base = "#D1C4E9", bright = "#EDE7FF", dim = "#B8A4D9" },
		red = { base = "#DB0073", bright = "#FF007F", dim = "#B30065" },
		green = { base = "#8BFF8B", bright = "#ACFFAC", dim = "#55CC55" },
		blue = { base = "#4C5BD6", bright = "#6A73FF", dim = "#3A48B3" },
		yellow = { base = "#FCD5BE", bright = "#FDE4D6", dim = "#FBCAAD" },
		magenta = { base = "#FF00FF", bright = "#FF5CFF", dim = "#CC00CC" },
		cyan = { base = "#A7CBF9", bright = "#C2DAFB", dim = "#99C2F8" },
		orange = { base = "#FC6199", bright = "#FC77A7", dim = "#FB4184" },
		pink = { base = "#E952E3", bright = "#EF81EB", dim = "#E538DF" },

		-- black = { base = "#240046", bright = "#3C096C", dim = "#10002B" },
		-- white = { base = "#FAF4FF", bright = "#FFFFFF", dim = "#E6E0F8" },
		-- red = { base = "#DB0073", bright = "#FF007F", dim = "#B30065" },
		-- green = { base = "#98FFB3", bright = "#B3FFD1", dim = "#66CC88" },
		-- blue = { base = "#4C5BD6", bright = "#6A73FF", dim = "#3A48B3" },
		-- yellow = { base = "#FFE79C", bright = "#FFF0B3", dim = "#D1C08B" },
		-- magenta = { base = "#8E44AD", bright = "#A569BD", dim = "#6C3483" },
		-- cyan = { base = "#85E1FF", bright = "#A1EFFF", dim = "#62C2FF" },
		-- orange = { base = "#FFAF80", bright = "#FFC4A3", dim = "#CC8366" },
		-- pink = { base = "#BA52FF", bright = "#BF81FF", dim = "#B738FF" },
	}

	p.comment = p.black.bright -- Comment color

	p.bg0 = p.black.dim -- Darker bg (status line and float)
	p.bg1 = p.black.base -- Default bg
	p.bg2 = p.black.dim -- Lighter bg (colorcolumn folds)
	p.bg3 = p.black.dim -- Lighter bg (cursor line)
	p.bg4 = p.red.bright -- Lighter bg (Conceal, border fg)

	p.fg0 = p.white.dim -- Darker fg
	p.fg1 = p.white.base -- Default fg
	p.fg2 = p.white.dim -- Lighter fg (status line) CHANGE THIS IF ^^^^^
	p.fg3 = p.black.bright -- Darker fg (line numbers, fold columns)

	p.sel0 = p.black.dim -- Popup bg, visual selection bg
	p.sel1 = p.black.dim -- Popup sel bg, search bg

	nightfox.setup({
		options = {
			dim_inactive = false,
			module_default = true,
			terminal_colors = true,
			transparent = false,
			inverse = {
				match_paren = true,
				visual = true,
				search = true,
			},
			styles = {
				comments = "",
				conditionals = "italic",
				constants = "italic",
				functions = "italic",
				keywords = "italic",
				numbers = "",
				operators = "",
				strings = "",
				types = "italic",
				variables = "",
			},
		},
		palettes = {
			duskfox = p,
		},
		specs = {
			duskfox = {
				syntax = {
					comment = p.comment, -- Comments

					field = p.white.base, -- Field
					variable = p.white.dim, --	Variables
					statement = p.white.bright, -- Statements

					string = p.yellow.base, --	Strings
					regex = p.yellow.dim, -- Regex

					keyword = p.red.base, -- Keywords
					conditional = p.red.base, -- Conditional and loop
					preproc = p.red.base, -- PreProc
					dep = p.red.base, -- Deprecated

					func = p.magenta.dim, -- Functions and Titles

					builtin0 = p.blue.bright, --	Builtin variable
					builtin1 = p.blue.bright, --	Builtin type
					builtin2 = p.blue.bright, --	Builtin const

					type = p.green.dim, -- Types
					const = p.green.base, -- Constants, imports and booleans
					number = p.green.base, -- Numbers
					ident = p.green.base, -- Identifiers
					operator = p.green.base, --	Operators
					bracket = p.green.bright, -- Brackets and Punctuation
				},
				diag = {
					error = p.red.base,
					warn = p.yellow.base,
					info = p.white.base,
					hint = p.black.bright,
				},
				diag_bg = {
					error = "",
					warn = "",
					info = "",
					hint = "",
				},
				git = {
					add = p.green.base,
					removed = p.red.base,
					changed = p.yellow.base,
					conflict = p.magenta.base,
					ignored = p.black.bright,
				},
				diff = {
					add = p.green.base,
					delete = p.red.base,
					change = p.yellow.base,
					text = p.white.base,
				},
			},
		},
		groups = {
			duskfox = {
				DapBreakpoint = { fg = p.red.base },
				DapBreakpointCondition = { fg = p.orange.base },
				DapLogPoint = { fg = p.white.base },
			},
		},
	})
end
