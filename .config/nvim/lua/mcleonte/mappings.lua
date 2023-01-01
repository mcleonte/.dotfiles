local vim = vim
local g, c, a = vim.g, vim.cmd, vim.api
local nvim_command = vim.api.nvim_command

local function map(mode, shortcut, command, desc)
	if not desc then
		desc = ""
	end
	vim.keymap.set(mode, shortcut, command, { desc = desc })
end

local function nmap(shortcut, command, desc)
	map("n", shortcut, command, desc)
end

local function imap(shortcut, command, desc)
	map("i", shortcut, command, desc)
end

local function vmap(shortcut, command, desc)
	map("v", shortcut, command, desc)
end

local function cmap(shortcut, command, desc)
	map("c", shortcut, command, desc)
end

local function tmap(shortcut, command, desc)
	map("t", shortcut, command, desc)
end

-- sane regexes
-- nmap('/', '/\\v')
-- vmap('/', '/\\v')

g.mapleader = " "
-- g.maplocalleader = '\\'

-- start command without holding Shift
nmap(";", ":")

-- Tabs
nmap("t<Tab>", ":tabnew<CR>", "New Tab")
nmap("q<Tab>", ":tabclose<CR>", "Close Tab")
nmap("<Tab>", ":tabn<CR>", "Next Tab") --<Tab> == <C-i>
nmap("<S-Tab>", ":tabp<CR>", "Prev Tab") -- shift-tab

-- Windows
nmap("`", "<C-w>w", "Window - switch") -- can prepend with window number
nmap("q`", "<C-w>q", "Window - close") -- can prepend with window number
nmap("\\`", "<C-w>v", "Window - split vertically")
nmap("-`", "<C-w>s", "Window - split horizontally")
nmap("e`", "<C-w>=", "Window - equalize width")

-- clear matches Ctrl+b
-- c("noremap <C-b> :noh<cr>:call clearmatches()<cr>")
nmap("<C-b>", ":nohl<CR>")

-- don't copy to clipboard when deleting characters with 'x'
-- nmap("x", "_x") -- not working, deletes the first line character instead

-- switch from insert mode to normal mode with leader double tap
imap("jh", "<ESC>", "Normal Mode")

-- increment / decrement numbers on cursor easier
nmap("<leader>+", "<C-a>")
nmap("<leader>-", "<C-x>")

-- in visual mode, enter select mode by pressing "v" again
vmap("v", "<C-g>")

-- don't jump when using *
nmap("*", "*<c-o>")

-- keep search matches in the middle of the window
nmap("n", "nzzzv")
nmap("N", "Nzzzv")

-- Same when jumping around
nmap("g;", "g;zz")
--nmap('g', 'g,zz') -- for some reason doesn't work well

-- Open a Quickfix window for the last search.
nmap("<leader>?", ":execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>")

-- Begining & End of line in Normal mode
nmap("H", "^")
nmap("L", "g_")
nmap("K", "gg")
nmap("J", "G")

-- more natural movement with wrap on
nmap("j", "gj")
nmap("k", "gk")
vmap("j", "gj")
vmap("k", "gk")

-- Reselect visual block after indent/outdent
vmap("<", "<gv")
vmap(">", ">gv")

-- home and end line in command mode
cmap("<C-a>", "<Home>")
cmap("<C-e>", "<End>")

-- Terminal
-- ESC to go to normal mode in terminal
tmap("<C-s>", "<C-\\><C-n>")
tmap("<Esc><Esc>", "<C-\\><C-n>")

-- PLUGINS

-- neoterm

nmap("<leader>tn", ":Tnew<CR>")
nmap("<leader>tl", ":<c-u>exec v:count.'Tclear'<CR>")
nmap("<leader>tt", ":T ")
nmap("<leader>tg", ":Ttoggle<CR>")

nmap("<F2>", ":NvimTreeToggle<CR>")

-- vim-maximizer
nmap("<F11>", ":MaximizerToggle<CR>")

-- session-lens
nmap("<leader>ss", ":SearchSession<CR>", "Search Session")

-- LSP
-- nmap('K', '<cmd>Lspsaga hover_doc<cr>')
-- imap('<C-k>', '<cmd>Lspsaga hover_doc<cr>')
-- nmap('gh', '<cmd>Lspsaga lsp_finder<cr>')
-- nmap('<C-e>', '<cmd>Lspsaga show_line_diagnostics<CR>')

-- Markdown Preview
nmap("<F4>", ":MarkdownPreviewToggle<CR>")

-- git
nmap("<C-g>", "<cmd>GitMessenger<cr>")

-- diagnostics
nmap("<leader>e", vim.diagnostic.open_float)
nmap("[d", vim.diagnostic.goto_prev)
nmap("]d", vim.diagnostic.goto_next)
nmap("<leader>q", vim.diagnostic.setloclist)

-- custom modes
local libmodal = require("libmodal")

-- for libmodal, not needed yet
-- local function char(val)
-- 	return vim.api.nvim_replace_termcodes(val, true, true, true)
-- end

-- debugging

local dap = require("dap")
local dap_python = require("dap-python")
local dapui = require("dapui")
local dap_ui_widgets = require("dap.ui.widgets")

local debug_layer = libmodal.layer.new({
	n = {
		-- ["B"] = { rhs = cmd(":exe bufwinnr('DAP Breakpoints') .. ' wincmd w'") },
		-- ["w"] = cmd(":exe bufwinnr('DAP Stacks') .. ' wincmd w'"),
		["b"] = { dap.toggle_breakpoint, "DAP | Toggle [b]reakpoint" },
		["n"] = {
			function()
				return dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end,
			"DAP | Set co[n]ditional breakpoint",
		},
		["m"] = {
			function()
				return dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
			end,
			"DAP | Set log point [m]essage",
		},
		["u"] = { dap.step_out, "DAP | Step o[u]t" },
		["i"] = { dap.step_into, "DAP | Step [i]nto" },
		["o"] = { dap.step_over, "DAP | Step [o]ver" },
		["p"] = { dap.run_to_cursor, "DAP | Run to cursor" },
		["g"] = { dap.continue, "DAP | Continue ( [G]o )" },
		["D"] = { dap.disconnect, "DAP | [D]isconnect" },
		["w"] = {
			function()
				nvim_command(":exe bufwinnr('DAP Watches') .. ' wincmd w'")
			end,
			"DAP | Switch to DAP [W]atches window",
		},
		["c"] = {
			function()
				nvim_command(":exe bufwinnr('DAP Scopes') .. ' wincmd w'")
			end,
			"DAP | Switch to DAP S[c]opes window",
		},
		["r"] = {
			function()
				nvim_command(":exe bufwinnr('dap-repl') .. ' wincmd w'")
			end,
			"DAP | Switch to DAP [R]epl window",
		},
		["t"] = { dap_python.test_method, "DAP | [T]est closest method / function" },
		["q"] = { dap.close, "DAP | Close ( [Q]uit )" },
		["R"] = { dap.repl.toggle, "DAP | REPL toggle" },
		["v"] = { dap_ui_widgets.hover, "DAP | View [v]alue of expression at cursor expression" },
	},
})

for k, v in pairs(debug_layer.n) do
	debug_layer.n[k] = { rhs = v[0], desc = v[1] }
end

nmap("<F5>", function()
	dapui.toggle()
	if debug_layer:is_active() then
		debug_layer:exit()
		g.active_layers = ""
	else
		debug_layer:enter()
		g.active_layers = "DEBUG"
	end
end, "Toggle custom DEBUG layer")

-- lsp
-- See `:help vim.lsp.*` for documentation on any of the below functions
nmap("gD", vim.lsp.buf.declaration, "LSP | Go to Declaration")
nmap("gd", vim.lsp.buf.definition, "LSP | Go to Definition")
nmap("<C-k>", vim.lsp.buf.hover)
nmap("gi", vim.lsp.buf.implementation, "LSP | Go to Implementation")
nmap("<leader>sh", vim.lsp.buf.signature_help, "LSP | Signature Help")
nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "LSP | Add Workspace Folder")
nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "LSP | Remove Workspace Folder")
nmap("<leader>wl", function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, "LSP | List Workspace Folders")
nmap("<leader>D", vim.lsp.buf.type_definition, "LSP | Go to type definition")
nmap("<leader>rn", vim.lsp.buf.rename, "LSP | Rename")
nmap("<leader>ca", vim.lsp.buf.code_action, "LSP | code action")
nmap("gr", vim.lsp.buf.references)
nmap("<leader>f", function()
	vim.lsp.buf.format({ async = true })
end)

-- Telescope
local tsb = require("telescope.builtin")
vmap("<leader>tc", "<cmd>Telescope commands<cr>", "Show Commands")
nmap("<leader>tc", "<cmd>Telescope commands<cr>", "Show Commands")
nmap("<leader>ts", "<cmd>Telescope current_buffer_fuzzy_find<cr>", "FZF current buffer")
nmap("<leader>ff", tsb.find_files, "Find files")
nmap("<leader>fk", tsb.keymaps, "Find keymaps")
nmap("<leader>tg", tsb.live_grep, "Live grep")
nmap("<leader>tb", "<cmd>Telescope buffers<cr>", "Buffers")
nmap("<leader>th", "<cmd>Telescope help_tags<cr>", "Help tags")
nmap("<leader>tC", "<cmd>Telescope colorscheme<cr>", "Colorscheme")
nmap("<leader>tp", "<cmd>Telescope project<cr>", "Project")
nmap("<leader>cd", "<cmd>Telescope zoxide list<cr>", "Zoxide")
nmap("<leader>tm", "<cmd>Telescope man_pages<cr>", "Man pages")
nmap("<leader>tn", "<cmd>Telescope notify<cr>", "Notifications")
