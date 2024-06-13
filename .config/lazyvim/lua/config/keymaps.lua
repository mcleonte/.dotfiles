-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local vim = vim
local g = vim.g
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

-- start command without holding Shift
nmap(";", ":")

nmap("gb", "<C-o>")
nmap("<leader>\\", ":vsplit<CR>", "Split window vertically")

imap("jk", "<Esc>")
imap("kj", "<Esc>")

-- in visual mode, enter select mode by pressing "v" again
vmap("v", "<C-g>")
