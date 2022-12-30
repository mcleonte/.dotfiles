return function()
  local nightfox = require("nightfox")

  local p = {
    black = { base = "#24112C", bright = "#843FA2", dim = "#180B1D" },
    white = { base = "#E5DCC5", bright = "#F2EEE3", dim = "#D9CCAB" },
    red = { base = "#E2126D", bright = "#EE2F82", dim = "#BD0F5A" },
    green = { base = "#37FF8B", bright = "#70FFAC", dim = "#00CC55" },
    blue = { base = "#825CFF", bright = "#A185FF", dim = "#5E2BFF" },
    yellow = { base = "#FCD581", bright = "#FDE4AF", dim = "#FBCA60" },
    magenta = { base = "#FF00FF", bright = "#FF5CFF", dim = "#CC00CC" },
    cyan = { base = "#56CBF9", bright = "#89DAFB", dim = "#3AC2F8" },
    orange = { base = "#FC6136", bright = "#FC7753", dim = "#FB410E" },
    pink = { base = "#E952DE", bright = "#EF81E7", dim = "#E538DA" },
  }

  p.comment = p.black.bright -- Comment color

  p.bg0 = p.black.dim -- Darker bg (status line and float)
  p.bg1 = p.black.base -- Default bg
  p.bg2 = p.black.dim -- Lighter bg (colorcolumn folds)
  p.bg3 = p.black.dim -- Lighter bg (cursor line)
  p.bg4 = p.black.dim -- Lighter bg (Conceal, border fg)

  p.fg0 = p.white.bright -- Lighter fg
  p.fg1 = p.white.base -- Default fg
  p.fg2 = p.white.dim -- Darker fg (status line)
  p.fg3 = p.white.dim -- Darker fg (line numbers, fold columns)

  p.sel0 = p.black.dim -- Popup bg, visual selection bg
  p.sel1 = p.black.base -- Popup sel bg, search bg

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

          field = p.white.dim, -- Field
          variable = p.white.base, --	Variables
          statement = p.white.bright, -- Statements

          string = p.yellow.base, --	Strings
          regex = p.yellow.dim, -- Regex

          keyword = p.red.base, -- Keywords
          conditional = p.red.base, -- Conditional and loop
          preproc = p.red.dim, -- PreProc

          dep = p.red.base, -- Deprecated

          builtin0 = p.blue.bright, --	Builtin variable
          builtin1 = p.blue.base, --	Builtin type
          builtin2 = p.blue.dim, --	Builtin const

          type = p.green.dim, -- Types
          const = p.green.base, -- Constants, imports and booleans
          number = p.green.base, -- Numbers
          func = p.green.base, -- Functions and Titles
          ident = p.green.base, -- Identifiers

          operator = p.green.base, --	Operators
          bracket = p.magenta.dim, -- Brackets and Punctuation
        },
        git = {
          add = p.green.base,
          removed = p.magenta.base,
          changed = p.yellow.base,
          conflict = p.red.base,
          ignored = p.black.bright,
        },
      },
    },
  })
end
