local g, c, a = vim.g, vim.cmd, vim.api

local function map(mode, shortcut, command)
	a.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

local function nmap(shortcut, command)
	map("n", shortcut, command)
end

local function imap(shortcut, command)
	map("i", shortcut, command)
end

local function vmap(shortcut, command)
	map("v", shortcut, command)
end

local function cmap(shortcut, command)
	map("c", shortcut, command)
end

local function tmap(shortcut, command)
	map("t", shortcut, command)
end

-- sane regexes
-- nmap('/', '/\\v')
-- vmap('/', '/\\v')

g.mapleader = " "
-- g.maplocalleader = '\\'

-- start command without holding Shift
nmap(";", ":")

-- Window (/buffer) spliting
nmap("vv", "<C-w>v") -- split vertically
nmap("ss", "<C-w>s") -- split horizontally
nmap("<leader>se", "C-w>=") -- equalize width of split windows
nmap("<leader>w", ":close<CR>") -- close current split window

-- Window (/buffer) navigation
nmap("<C-h>", "<C-w>h")
nmap("<C-j>", "<C-w>j")
nmap("<C-k>", "<C-w>k")
nmap("<C-l>", "<C-w>l")

-- Tabs
nmap("<C-t>", ":tabnew<CR>")
nmap("<C-w>", ":tabclose<CR>")
nmap("<C-i>", ":tabn<CR>") -- tab
nmap("<S-Tab>", ":tabp<CR>") -- shift-tab

-- clear matches Ctrl+b
-- c("noremap <C-b> :noh<cr>:call clearmatches()<cr>")
nmap("<C-b>", ":nohl<CR>")

-- don't copy to clipboard when deleting characters with 'x'
-- nmap("x", "_x") -- not working, deletes the first line character instead

-- switch from insert mode to normal mode with leader double tap
imap("jh", "<ESC>")

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
nmap("<leader>ss", ":SearchSession<CR>")

-- Find files using Telescope command-line sugar.
nmap("<C-p>", "<cmd>Telescope find_files<cr>")
nmap("<leader>f", "<cmd>Telescope live_grep<cr>")
nmap("<leader>bb", "<cmd>Telescope buffers<cr>")
nmap("<leader>hh", "<cmd>Telescope help_tags<cr>")

-- LSP
-- nmap('K', '<cmd>Lspsaga hover_doc<cr>')
-- imap('<C-k>', '<cmd>Lspsaga hover_doc<cr>')
-- nmap('gh', '<cmd>Lspsaga lsp_finder<cr>')
-- nmap('<C-e>', '<cmd>Lspsaga show_line_diagnostics<CR>')

-- Markdown Preview
nmap("<F4>", ":MarkdownPreviewToggle<CR>")

-- git
nmap("<C-g>", "<cmd>GitMessenger<cr>")
