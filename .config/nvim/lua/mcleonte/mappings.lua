local vim = vim
local g, c, a = vim.g, vim.cmd, vim.api

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

-- debugging
local dap = require("dap")
local dap_python = require("dap-python")
local dapui = require("dapui")

local dap_keys = {
  ["<leader>db"] = { "toggle_breakpoint", "DAP | Toggle breakpoint" },

  ["<leader>dc"] = { "continue", "DAP | Continue" },
  ["<leader>dC"] = { "run_to_cursor", "DAP | Run to cursor" },
  ["<leader>dd"] = { "disconnect", "DAP | Disconnect" },
  ["<leader>dS"] = { "session", "DAP | Session" },

  ["<leader>di"] = { "step_into", "DAP | Step into" },
  ["<leader>do"] = { "step_over", "DAP | Step over" },
  ["<leader>du"] = { "step_out", "DAP | Step out" },
  ["<leader>dB"] = { "step_back", "DAP | Step back" },

  ["<leader>dp"] = { "pause.toggle", "DAP | Pause toggle" },
  ["<leader>dr"] = { "repl.toggle", "DAP | REPL toggle" },
  ["<leader>dq"] = { "close", "DAP | Close" },
}

for k, v in pairs(dap_keys) do
  nmap(k, function()
    return dap[v[1]]()
  end, v[2])
end

nmap("<leader>dc", function()
  return dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, "DAP | Set conditional breakpoint")

nmap("<leader>dl", function()
  return dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end, "DAP | Set log point")

nmap("<leader>tf", function()
  return dap_python.test_method()
end, "Test closest method / function")

nmap("<F5>", function()
  return dapui.toggle()
end, "DAPUI | toggle side panel")

-- debugging mode

local mappings = {
  ["<F7>"] = function()
    a.nvim_command("require('dapui').toggle()")
    --return dapui.toggle()
  end,
}

nmap("<F6>", function()
  libmodal.mode.enter("DEBUG", mappings)
end, "Enter debugmode")

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
