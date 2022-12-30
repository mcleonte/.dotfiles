return function()
	-- require("notify")("nightfox theme is being set up")

	local nightfox = require("nightfox")
	local color = require("nightfox.lib.color")

	local p = {
		black = { base = color.from_hex("#24112C"), bright = "#9E4FBA", dim = "#180B1D" },
		white = { base = color.from_hex("#E5DCC5"), bright = "#EAEFD3", dim = "#D8C99B" },
		red = { base = color.from_hex("#EE0000") },
		green = { base = color.from_hex("#43B929"), bright = "#37FF8B" },
		blue = { base = color.from_hex("#3F8EFC"), bright = "#87BFFF", dim = "#2667FF" },
		yellow = { base = color.from_hex("#FFCA3A"), bright = "#FFF689", dim = "#E9B872" },
		magenta = { base = color.from_hex("#F433AB") },
		cyan = { base = color.from_hex("#14BDEB") },
		orange = { base = color.from_hex("#FA7921"), bright = "#EF7B45", dim = "#D84727" },
		pink = { base = color.from_hex("#E952DE"), bright = "#FFA0FD", dim = "#AA4465" },
	}
	local dim_diff = 10
	local bright_diff = 10

	for k, v in pairs(p) do
		--p[k][1] = v[1]:rotate(282):saturate(44):lighten(12)
		if not p[k].bright then
			p[k].bright = v.base:lighten(bright_diff):to_css()
		end
		if not p[k].dim then
			p[k].dim = v.base:lighten(-dim_diff):to_css()
		end
		p[k].base = v.base:to_css()
	end

	p.comment = p.black.bright
	p.bg0 = p.black.dim
	p.bg1 = p.black.base

	p.fg0 = p.white.bright
	p.fg1 = p.white.base
	p.fg2 = p.white.dim
	p.fg3 = p.white.dim

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
					comment = p.black.bright, -- Comments

					variable = p.white.base, --	Variables
					statement = p.white.bright, -- Statements
					field = p.white.dim, -- Field

					builtin0 = p.pink.base, --	Builtin variable
					builtin1 = p.pink.base, --	Builtin type
					builtin2 = p.pink.base, --	Builtin const
					const = p.pink.base, -- Constants, imports and booleans

					keyword = p.magenta.base, -- Keywords
					conditional = p.magenta.base, -- Conditional and loop
					preproc = p.magenta.base, -- PreProc

					dep = p.red.dim, -- Deprecated

					type = p.green.base, -- Types

					func = p.yellow.base, -- Functions and Titles
					number = p.green.bright, -- Numbers
					operator = p.pink.base, --	Operators
					ident = p.blue.dim, -- Identifiers

					string = p.yellow.bright, --	Strings
					bracket = p.green.bright, -- Brackets and Punctuation
					regex = p.yellow.dim, -- Regex
				},
			},
		},
	})
end
