return function()
	require("catppuccin").setup({
		term_colors = true,
		no_italic = true, -- Force no italic
		color_overrides = {
			mocha = {

				-- defaults

				-- base = "#1e1e2f",
				-- blue = "#89b4fb",
				-- crust = "#11111c",
				-- flamingo = "#f2cdce",
				-- green = "#a6e3a2",
				-- lavender = "#b4beff",
				-- mantle = "#181826",
				-- maroon = "#eba0ad",
				-- mauve = "#cba6f8",
				-- overlay0 = "#6c7087",
				-- overlay1 = "#7f849d",
				-- overlay2 = "#9399b3",
				-- peach = "#fab388",
				-- pink = "#f5c2e8",
				-- red = "#f38ba9",
				-- rosewater = "#f5e0dd",
				-- sapphire = "#74c7ed",
				-- sky = "#89dcec",
				-- subtext0 = "#a6adc9",
				-- subtext1 = "#bac2df",
				-- surface0 = "#313245",
				-- surface1 = "#45475b",
				-- surface2 = "#585b71",
				-- teal = "#94e2d6",
				-- text = "#cdd6f5",
				-- yellow = "#f9e2b0",

				-- overrides

				base = "#201134", -- Dark grey with a hint of purple
				crust = "#753FC2", -- Darker grey with a hint of purple
				mantle = "#140B22", -- Modified to be a lighter purple
				overlay0 = "#73698b", -- Adjusted to be a lighter purple shade
				overlay1 = "#8678a4", -- Adjusted to be a medium purple shade
				overlay2 = "#9a89bd", -- Adjusted to be a slightly brighter purple shade
				subtext0 = "#9181a3", -- Adjusted to a lighter purple shade
				subtext1 = "#a59bb8", -- Adjusted to a slightly deeper purple shade
				surface0 = "#2e2c3c", -- Adjusted to a soft purple
				surface1 = "#423e53", -- Adjusted to a medium purple
				surface2 = "#564f69", -- Adjusted to a darker purple
			},
		},
	})

	vim.cmd.colorscheme("catppuccin-mocha")
end
