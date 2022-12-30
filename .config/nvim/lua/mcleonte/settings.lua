HOME = os.getenv("HOME")

local g, o, c = vim.g, vim.opt, vim.cmd


g.mapleader = ' '
--vim.g.maplocalleader = '\\'

-- basic settings
o.encoding = "utf-8"
o.backspace = "indent,eol,start" -- backspace works on every char in insert mode
o.completeopt = 'menuone,noselect'
o.history = 1000
o.dictionary = '/usr/share/dict/words'
o.startofline = true
o.termguicolors = true
o.mouse = 'nv' -- enable mouse for normal and visual mode
o.clipboard = "unnamedplus" -- use system clipboard

-- Mapping waiting time
o.timeout = false
o.ttimeout = true
o.ttimeoutlen = 100

-- Display
o.showmatch  = true -- show matching brackets
o.scrolloff  = 3 -- always show 3 rows from edge of the screen
o.synmaxcol  = 300 -- stop syntax highlight after x lines for performance
o.laststatus = 2 -- always show status line

--Folding
o.foldcolumn = "1"
o.foldlevel = 99
o.foldlevelstart = -1
o.foldenable = true



o.list = false -- do not display white characters
o.wrap = false --do not wrap lines even if very long
o.eol = false -- show if there's no eol char
o.showbreak = '↪' -- character to show when line is broken

-- Sidebar
o.relativenumber = true -- show relative line number to curent line on the left
o.number = true -- show absolute line number of curent line on the left
o.numberwidth = 3 -- always reserve 3 spaces for line number
o.signcolumn = 'number' -- keep 1 column for coc.vim  check
o.modelines = 0
o.showcmd = true -- display command in bottom bar

-- Search
o.incsearch = true -- starts searching as soon as typing, without enter needed
o.ignorecase = true -- ignore letter case when searching
o.smartcase = true -- case insentive unless capitals used in search
o.matchtime = 2 -- delay before showing matching paren
o.hlsearch = true
-- o.mps = o.mps .. ",<:>"

-- White characters
o.autoindent = true
o.smartindent = true
o.tabstop = 2 -- 1 tab = 2 spaces
o.shiftwidth = 2 -- indentation rule
o.formatoptions = 'qnj1' -- q  - comment formatting; n - numbered lists; j - remove comment when joining lines; 1 - don't break after one-letter word
o.expandtab = true -- expand tab to spaces

-- Backup files
o.backup = true -- use backup files
o.writebackup = false
o.swapfile = false -- do not use swap file
o.undodir = HOME .. '/.vim/tmp/undo//' -- undo files
o.backupdir = HOME .. '/.vim/tmp/backup//' -- backups
o.directory = '/.vim/tmp/swap//' -- swap files

c([[
  au FileType python                  set ts=4 sw=4
  au BufRead,BufNewFile *.md          set ft=mkd tw=80 syntax=markdown
  au BufRead,BufNewFile *.ppmd        set ft=mkd tw=80 syntax=markdown
  au BufRead,BufNewFile *.markdown    set ft=mkd tw=80 syntax=markdown
  au BufRead,BufNewFile *.slimbars    set syntax=slim
]])

-- Commands mode
o.wildmenu = true -- on TAB, complete options for system command
o.wildignore = 'deps,.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc'

-- Only show cursorline in the current window and in normal mode.
c([[
  augroup cline
      au!
      au WinLeave * set nocursorline
      au WinEnter * set cursorline
      au InsertEnter * set nocursorline
      au InsertLeave * set cursorline
  augroup END
]])

-- vim.o.background = 'dark'
c('colorscheme molokayo')
-- vim.g.material_style = "palenight"

-- vim.g.python3_host_prog = "/Users/grzegorz/.asdf/shims/python3"
-- vim.g.python_host_prog = "/Users/grzegorz/.asdf/shims/python2"
