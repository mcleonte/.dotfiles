-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/leo/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/leo/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/leo/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/leo/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/leo/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/leo/.local/share/nvim/site/pack/packer/opt/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["filetype.nvim"] = {
    config = { "\27LJ\2\n]\0\0\3\0\6\0\r6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0006\1\0\0009\1\1\0019\1\4\1'\2\5\0&\1\2\1=\1\4\0K\0\1\0\aL0\15cinoptions\bcpp\rfiletype\abo\bvimà\1\0\0\a\0\n\0\0186\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0006\4\0\0009\4\4\0049\4\b\4'\6\t\0B\4\2\2'\5\a\0&\2\5\2B\0\2\1K\0\1\0\6%\vexpand\6\"\18open -a skim \rjobstart\afn\bpdf\rfiletype\abo\bvim.\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\15syntax off\bcmd\bvim0\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\17iabbrev $ $$\bcmd\bvim¯\2\1\0\6\0\28\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\26\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\v\0003\5\n\0=\5\f\0043\5\r\0=\5\14\4=\4\15\0035\4\17\0003\5\16\0=\5\18\4=\4\19\0035\4\21\0003\5\20\0=\5\22\4=\4\23\0035\4\24\0=\4\25\3=\3\27\2B\0\2\1K\0\1\0\14overrides\1\0\0\fshebang\1\0\1\tdash\ash\21function_complex\21*.math_notes/%w+\1\0\0\0\21function_literal\rBrewfile\1\0\0\0\24function_extensions\bpdf\0\bcpp\1\0\0\0\fcomplex\1\0\1\17.*git/config\14gitconfig\fliteral\1\0\1\17MyBackupFile\blua\15extensions\1\0\0\1\0\1\apn\vpotion\nsetup\rfiletype\frequire\0" },
    loaded = true,
    path = "/home/leo/.local/share/nvim/site/pack/packer/start/filetype.nvim",
    url = "https://github.com/nathom/filetype.nvim"
  },
  ["git-messenger.vim"] = {
    loaded = true,
    path = "/home/leo/.local/share/nvim/site/pack/packer/start/git-messenger.vim",
    url = "https://github.com/rhysd/git-messenger.vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nW\0\4\n\1\4\0\14\14\0\3\0X\4\1Ä4\3\0\0-\4\0\0=\4\0\0036\4\1\0009\4\2\0049\4\3\4\18\6\0\0\18\a\1\0\18\b\2\0\18\t\3\0B\4\5\1K\0\1\0\0¿\bset\vkeymap\bvim\vbufferó\a\1\1\t\0)\0H6\1\0\0009\1\1\0019\1\2\0013\2\3\0\18\3\2\0'\5\4\0'\6\5\0'\a\6\0005\b\a\0B\3\5\1\18\3\2\0'\5\4\0'\6\b\0'\a\t\0005\b\n\0B\3\5\1\18\3\2\0005\5\v\0'\6\f\0'\a\r\0005\b\14\0B\3\5\1\18\3\2\0005\5\15\0'\6\16\0'\a\17\0005\b\18\0B\3\5\1\18\3\2\0'\5\4\0'\6\19\0009\a\20\0015\b\21\0B\3\5\1\18\3\2\0'\5\4\0'\6\22\0009\a\23\0015\b\24\0B\3\5\1\18\3\2\0'\5\4\0'\6\25\0009\a\26\0015\b\27\0B\3\5\1\18\3\2\0'\5\4\0'\6\28\0009\a\29\0015\b\30\0B\3\5\1\18\3\2\0'\5\4\0'\6\31\0009\a \0015\b!\0B\3\5\1\18\3\2\0'\5\4\0'\6\"\0009\a#\0015\b$\0B\3\5\1\18\3\2\0005\5%\0'\6&\0'\a'\0005\b(\0B\3\5\0012\0\0ÄK\0\1\0\1\0\1\tdesc\16Select hunk#:<C-U>Gitsigns select_hunk<CR>\aih\1\3\0\0\6o\6x\1\0\1\tdesc\14Diff this\rdiffthis\15<leader>hd\1\0\1\tdesc\30Toggle current line blame\30toggle_current_line_blame\15<leader>hb\1\0\1\tdesc\17Preview hunk\17preview_hunk\15<leader>hp\1\0\1\tdesc\17Reset buffer\17reset_buffer\15<leader>hR\1\0\1\tdesc\20Undo stage hunk\20undo_stage_hunk\15<leader>hu\1\0\1\tdesc\17Stage buffer\17stage_buffer\15<leader>hS\1\0\1\tdesc\15Reset hunk\29:Gitsigns reset_hunk<CR>\15<leader>hr\1\3\0\0\6n\6v\1\0\1\tdesc\15Stage hunk\29:Gitsigns stage_hunk<CR>\15<leader>hs\1\3\0\0\6n\6v\1\0\1\texpr\0021&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'\a[c\1\0\1\texpr\0021&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'\a]c\6n\0\rgitsigns\vloaded\fpackage◊\2\1\0\5\0\20\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0023\3\16\0=\3\17\0025\3\18\0=\3\19\2B\0\2\1K\0\1\0\17watch_gitdir\1\0\1\rinterval\3Ë\a\14on_attach\0\nsigns\1\0\2\18sign_priority\3\6\20update_debounce\3»\1\17changedelete\1\0\2\ttext\6~\ahl\bRed\14topdelete\1\0\2\ttext\6-\ahl\bRed\vdelete\1\0\2\ttext\b‚îÇ\ahl\bRed\vchange\1\0\2\ttext\b‚îÇ\ahl\tBlue\badd\1\0\0\1\0\2\ttext\b‚îÇ\ahl\nGreen\nsetup\rgitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/leo/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/leo/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["iswap.nvim"] = {
    config = { "\27LJ\2\n∞\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\a\17hl_selection\15WarningMsg\rhl_snipe\rErrorMsg\fhl_grey\vLineNr\rautoswap\2\tgrey\fdisable\21hl_grey_priority\t1000\tkeys\15qwertyuiop\nsetup\niswap\frequire\0" },
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/leo/.local/share/nvim/site/pack/packer/opt/iswap.nvim",
    url = "https://github.com/JoseConseco/iswap.nvim"
  },
  ["lsp-setup.nvim"] = {
    config = { "\27LJ\2\nÛ\1\0\0\v\0\18\0\0266\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\16\0005\3\r\0006\4\0\0'\6\3\0B\4\2\0029\4\2\0045\6\v\0005\a\t\0005\b\a\0005\t\5\0005\n\4\0=\n\6\t=\t\b\b=\b\n\a=\a\f\6B\4\2\2=\4\14\0034\4\0\0=\4\15\3=\3\17\2B\0\2\1K\0\1\0\fservers\1\0\0\25jedi_language_server\16sumneko_lua\1\0\0\14lspconfig\1\0\0\rsettings\1\0\0\bLua\1\0\0\vformat\1\0\0\1\0\1\venable\2\flua-dev\nsetup\14lsp-setup\frequire\0" },
    loaded = true,
    path = "/home/leo/.local/share/nvim/site/pack/packer/start/lsp-setup.nvim",
    url = "https://github.com/junnplus/lsp-setup.nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/leo/.local/share/nvim/site/pack/packer/opt/lua-dev.nvim",
    url = "https://github.com/folke/lua-dev.nvim"
  },
  ["markdown-preview.nvim"] = {
    commands = { "MarkdownPreview" },
    config = { "\27LJ\2\nÑ\2\0\0\5\0\f\0\0246\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2'\1\4\0&\0\1\0006\1\0\0009\1\5\0016\2\0\0009\2\1\0029\2\a\2\18\4\0\0B\2\2\2=\2\6\0016\1\0\0009\1\5\1'\2\t\0=\2\b\0016\1\0\0009\1\5\0015\2\v\0=\2\n\1K\0\1\0\1\4\0\0\rmarkdown\amd\aMD\19mkdp_filetypes\vchrome\17mkdp_browser\vexpand\22mkdp_markdown_css\6g:/lua/plugins/config/markdownpreview/styles/github.css\vconfig\fstdpath\afn\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/leo/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/leo/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/leo/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["material.nvim"] = {
    loaded = true,
    path = "/home/leo/.local/share/nvim/site/pack/packer/start/material.nvim",
    url = "https://github.com/marko-cerovac/material.nvim"
  },
  molokai = {
    loaded = true,
    path = "/home/leo/.local/share/nvim/site/pack/packer/start/molokai",
    url = "https://github.com/tomasr/molokai"
  },
  molokayo = {
    loaded = true,
    path = "/home/leo/.local/share/nvim/site/pack/packer/start/molokayo",
    url = "https://github.com/fmoralesc/molokayo"
  },
  neogit = {
    commands = { "Neogit" },
    config = { "\27LJ\2\nà\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\17integrations\1\0\1\rdiffview\2\1\0\2\17auto_refresh\2 disable_commit_confirmation\2\nsetup\vneogit\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/leo/.local/share/nvim/site/pack/packer/opt/neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  neoterm = {
    loaded = true,
    path = "/home/leo/.local/share/nvim/site/pack/packer/start/neoterm",
    url = "https://github.com/kassio/neoterm"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n|\0\0\4\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\a\vRRGGBB\2\rRRGGBBAA\2\vrgb_fn\2\vhsl_fn\2\vcss_fn\2\bcss\2\bRGB\2\1\2\0\0\6*\nsetup\14colorizer\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/leo/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/leo/.local/share/nvim/site/pack/packer/start/nvim-compe",
    url = "https://github.com/hrsh7th/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/leo/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeFindFile", "NvimTreeFocus", "NvimTreeOpen", "NvimTreeRefresh", "NvimTreeToggle" },
    config = { "\27LJ\2\n˚\5\0\0\a\0$\00036\0\0\0'\2\1\0B\0\2\0029\0\2\0004\1\3\0005\2\4\0005\3\3\0=\3\5\2\18\3\0\0'\5\6\0B\3\2\2=\3\a\2>\2\1\0015\2\t\0005\3\b\0=\3\5\2\18\3\0\0'\5\n\0B\3\2\2=\3\a\2>\2\2\0016\2\0\0'\4\v\0B\2\2\0029\2\f\0025\4\r\0005\5\14\0=\5\15\0045\5\16\0005\6\17\0=\6\18\5=\5\19\0045\5\20\0005\6\21\0=\1\22\6=\6\23\5=\5\24\0045\5\25\0=\5\26\0045\5\27\0=\5\28\4B\2\2\0016\2\29\0009\2\30\0025\3 \0005\4!\0=\4\26\0035\4\"\0=\4#\3=\3\31\2K\0\1\0\vfolder\1\0\5\topen\bÓóæ\fdefault\bÓóø\nempty\bÔÑî\15empty_open\bÔÑï\fsymlink\bÔíÇ\1\0\5\14untracked\b‚úó\runstaged\bÔëÑ\vstaged\b‚úì\runmerged\bÓúß\frenamed\b‚ûú\1\0\2\fsymlink\bÔíÅ\fdefault\bÓòí\20nvim_tree_icons\6g\bvim\ntrash\1\0\2\20require_confirm\2\bcmd\ntrash\bgit\1\0\3\vignore\2\venable\2\ftimeout\3˙\1\tview\rmappings\tlist\1\0\0\1\0\2\18adaptive_size\1\nwidth\3\25\ffilters\vcustom\1\3\0\0\t.git\16__pycache__\1\0\1\rdotfiles\1\24update_focused_file\1\0\1\venable\1\1\0\3\17hijack_netrw\2\15update_cwd\2\18disable_netrw\2\nsetup\14nvim-tree\15close_node\1\0\0\1\3\0\0\t<BS>\6h\acb\tedit\bkey\1\0\0\1\5\0\0\t<CR>\6o\18<2-LeftMouse>\6l\23nvim_tree_callback\21nvim-tree.config\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/leo/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-treesitter-textobjects", "iswap.nvim" },
    commands = { "TSUpdate", "TSInstallSync" },
    config = { "\27LJ\2\nå\1\0\2\a\0\5\1\0196\2\0\0009\2\1\0029\2\2\2\18\4\1\0B\2\2\0026\3\0\0009\3\1\0039\3\3\3'\5\4\0004\6\3\0>\2\1\6B\3\3\2*\4\0\0\0\4\3\0X\4\2Ä+\4\1\0X\5\1Ä+\4\2\0L\4\2\0\rgetfsize\23nvim_call_function\22nvim_buf_get_name\bapi\bvimÄÄ U\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0006if &ft == \"packer\" | echo \"\" | else | silent! e %\bcmd\bvim√\t\1\0\a\0 \0&6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0003\5\5\0=\5\6\4=\4\a\0035\4\b\0005\5\t\0=\5\n\4=\4\v\0035\4\f\0=\4\r\0035\4\16\0005\5\14\0005\6\15\0=\6\n\5=\5\17\0045\5\18\0005\6\19\0=\6\20\0055\6\21\0=\6\22\0055\6\23\0=\6\24\0055\6\25\0=\6\26\5=\5\27\4=\4\28\3B\1\2\0016\1\29\0009\1\30\0013\3\31\0)\4\0\0B\1\3\1K\0\1\0\0\rdefer_fn\bvim\16textobjects\tmove\22goto_previous_end\1\0\5\tgpiC\16@call.inner\bgpF\20@function.outer\tgpiF\20@function.inner\bgpP\21@parameter.inner\bgpC\16@call.outer\24goto_previous_start\1\0\5\tgpic\16@call.inner\bgpf\20@function.outer\tgpif\20@function.inner\bgpp\21@parameter.inner\bgpc\16@call.outer\18goto_next_end\1\0\5\bgnP\21@parameter.inner\bgnC\16@call.outer\tgniC\16@call.inner\bgnF\20@function.outer\tgniF\20@function.inner\20goto_next_start\1\0\5\bgnf\20@function.outer\tgnif\20@function.inner\bgnc\16@call.outer\tgnic\16@call.inner\bgnp\21@parameter.inner\1\0\2\14set_jumps\2\venable\2\vselect\1\0\0\1\0\v\bast\21@statement.outer\bacd\23@conditional.outer\aaB\17@block.outer\bisc\21@scopename.inner\aiB\17@block.inner\aaf\20@function.outer\aif\20@function.inner\aal\16@loop.outer\ail\16@loop.inner\bicd\23@conditional.inner\bacm\19@comment.outer\1\0\2\14lookahead\2\venable\2\26context_commentstring\1\0\1\venable\2\26incremental_selection\fkeymaps\1\0\4\22scope_incremental\bgns\21node_decremental\bgnp\19init_selection\bgnn\21node_incremental\bgnn\1\0\1\venable\2\14highlight\fdisable\0\1\0\3&additional_vim_regex_highlighting\1\venable\2\21use_languagetree\1\1\0\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/leo/.local/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/leo/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ufo"] = {
    after = { "promise-async" },
    config = { "\27LJ\2\næ\3\0\0\n\0\22\00016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0006\4\5\0'\6\6\0B\4\2\0029\4\a\4B\0\4\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\b\0006\4\5\0'\6\6\0B\4\2\0029\4\t\4B\0\4\0016\0\0\0009\0\n\0009\0\v\0009\0\f\0B\0\1\0029\1\r\0005\2\15\0=\2\14\0015\1\16\0006\2\17\0\18\4\1\0B\2\2\4X\5\bÄ6\a\5\0'\t\18\0B\a\2\0028\a\6\a9\a\19\a5\t\20\0=\0\21\tB\a\2\1E\5\3\3R\5ˆ6\2\5\0'\4\6\0B\2\2\0029\2\19\2B\2\1\1K\0\1\0\17capabilities\1\0\0\nsetup\14lspconfig\vipairs\1\3\0\0\25jedi_language_server\16sumneko_lua\1\0\2\24dynamicRegistration\1\20lineFoldingOnly\2\17foldingRange\17textDocument\29make_client_capabilities\rprotocol\blsp\18closeAllFolds\azM\17openAllFolds\bufo\frequire\azR\6n\bset\vkeymap\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/leo/.local/share/nvim/site/pack/packer/opt/nvim-ufo",
    url = "https://github.com/kevinhwang91/nvim-ufo",
    wants = { "promise-async" }
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/leo/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/leo/.local/share/nvim/site/pack/packer/opt/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/leo/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/leo/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["promise-async"] = {
    load_after = {
      ["nvim-ufo"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/leo/.local/share/nvim/site/pack/packer/opt/promise-async",
    url = "https://github.com/kevinhwang91/promise-async"
  },
  ["telescope-file-browser.nvim"] = {
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/leo/.local/share/nvim/site/pack/packer/opt/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-media-files.nvim"] = {
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/leo/.local/share/nvim/site/pack/packer/opt/telescope-media-files.nvim",
    url = "https://github.com/nvim-telescope/telescope-media-files.nvim"
  },
  ["telescope-project.nvim"] = {
    config = { "\27LJ\2\nL\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\fproject\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/leo/.local/share/nvim/site/pack/packer/opt/telescope-project.nvim",
    url = "https://github.com/nvim-telescope/telescope-project.nvim"
  },
  ["telescope-zoxide"] = {
    config = { "\27LJ\2\nK\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\vzoxide\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/leo/.local/share/nvim/site/pack/packer/opt/telescope-zoxide",
    url = "https://github.com/jvgrootveld/telescope-zoxide"
  },
  ["telescope.nvim"] = {
    after = { "telescope-zoxide", "telescope-media-files.nvim", "telescope-file-browser.nvim", "telescope-project.nvim" },
    commands = { "Telescope", "SearchSession" },
    config = { "\27LJ\2\n \t\0\0\4\0,\0D5\0\a\0005\1\3\0005\2\1\0005\3\0\0=\3\2\2=\2\4\0015\2\5\0=\2\6\1=\1\b\0005\1\t\0005\2\n\0=\2\v\0015\2\f\0=\2\r\1=\1\14\0005\1\15\0=\1\16\0005\1\17\0=\1\18\0006\1\19\0'\3\20\0B\1\2\0029\1\21\1=\1\22\0004\1\0\0=\1\23\0006\1\19\0'\3\20\0B\1\2\0029\1\24\1=\1\25\0004\1\0\0=\1\26\0005\1\27\0=\1\28\0005\1\29\0=\1\30\0006\1\19\0'\3\31\0B\1\2\0029\1 \0019\1!\1=\1\"\0006\1\19\0'\3\31\0B\1\2\0029\1#\0019\1!\1=\1$\0006\1\19\0'\3\31\0B\1\2\0029\1%\0019\1!\1=\1&\0006\1\19\0'\3\31\0B\1\2\0029\1'\1=\1'\0006\1\19\0'\3(\0B\1\2\0029\1)\0015\3*\0=\0+\3B\1\2\1K\0\1\0\rdefaults\1\0\0\nsetup\14telescope\27buffer_previewer_maker\21qflist_previewer\22vim_buffer_qflist\19grep_previewer\23vim_buffer_vimgrep\19file_previewer\bnew\19vim_buffer_cat\25telescope.previewers\fset_env\1\0\1\14COLORTERM\14truecolor\16borderchars\1\t\0\0\b‚îÄ\b‚îÇ\b‚îÄ\b‚îÇ\b‚ï≠\b‚ïÆ\b‚ïØ\b‚ï∞\vborder\19generic_sorter\29get_generic_fuzzy_sorter\25file_ignore_patterns\16file_sorter\19get_fuzzy_file\22telescope.sorters\frequire\17path_display\1\2\0\0\rtruncate\22vimgrep_arguments\1\b\0\0\arg\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\17--smart-case\18layout_config\rvertical\1\0\1\vmirror\1\15horizontal\1\0\2\18results_width\4ö≥ÊÃ\tô≥¶ˇ\3\18preview_width\4ö≥ÊÃ\tô≥Üˇ\3\1\0\4\20prompt_position\vbottom\19preview_cutoff\3x\nwidth\4◊«¬Î\3äÆØˇ\3\vheight\4ö≥ÊÃ\tô≥¶ˇ\3\fpickers\1\0\b\20scroll_strategy\ncycle\18prompt_prefix\6>\23selection_strategy\nreset\rwinblend\3\0\21sorting_strategy\15descending\20layout_strategy\15horizontal\ruse_less\2\19color_devicons\2\14live_grep\1\0\1\19only_sort_text\2\15find_files\1\0\0\17find_command\1\0\0\1\5\0\0\arg\16--type=file\r--hidden\17--smart-case\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/leo/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  undotree = {
    commands = { "UndotreeToggle" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/leo/.local/share/nvim/site/pack/packer/opt/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-airline"] = {
    loaded = true,
    path = "/home/leo/.local/share/nvim/site/pack/packer/start/vim-airline",
    url = "https://github.com/vim-airline/vim-airline"
  },
  ["vim-airline-themes"] = {
    loaded = true,
    path = "/home/leo/.local/share/nvim/site/pack/packer/start/vim-airline-themes",
    url = "https://github.com/vim-airline/vim-airline-themes"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/home/leo/.local/share/nvim/site/pack/packer/start/vim-eunuch",
    url = "https://github.com/tpope/vim-eunuch"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/leo/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-grammarous"] = {
    loaded = true,
    path = "/home/leo/.local/share/nvim/site/pack/packer/start/vim-grammarous",
    url = "https://github.com/rhysd/vim-grammarous"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/home/leo/.local/share/nvim/site/pack/packer/start/vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-python-pep8-indent"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/leo/.local/share/nvim/site/pack/packer/opt/vim-python-pep8-indent",
    url = "https://github.com/Vimjas/vim-python-pep8-indent"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/leo/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/home/leo/.local/share/nvim/site/pack/packer/start/vim-test",
    url = "https://github.com/janko-m/vim-test"
  },
  ["vim-trailing-whitespace"] = {
    loaded = true,
    path = "/home/leo/.local/share/nvim/site/pack/packer/start/vim-trailing-whitespace",
    url = "https://github.com/bronson/vim-trailing-whitespace"
  },
  ["vim-vinegar"] = {
    loaded = true,
    path = "/home/leo/.local/share/nvim/site/pack/packer/start/vim-vinegar",
    url = "https://github.com/tpope/vim-vinegar"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^lua%-dev"] = "lua-dev.nvim",
  ["^neogit"] = "neogit",
  ["^telescope"] = "telescope.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Setup for: markdown-preview.nvim
time([[Setup for markdown-preview.nvim]], true)
try_loadstring("\27LJ\2\nC\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\4\0\0\rmarkdown\amd\aMD\19mkdp_filetypes\6g\bvim\0", "setup", "markdown-preview.nvim")
time([[Setup for markdown-preview.nvim]], false)
-- Setup for: nvim-treesitter
time([[Setup for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nv\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\1\tdesc\20Symbols Outline\28<cmd>SymbolsOutline<cr>\14<leader>o\6n\bset\vkeymap\bvim\0", "setup", "nvim-treesitter")
time([[Setup for nvim-treesitter]], false)
-- Setup for: nvim-tree.lua
time([[Setup for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\nÏ\1\0\0\4\0\v\0\0296\0\0\0009\0\1\0009\0\2\0)\2\0\0'\3\3\0B\0\3\0026\1\0\0009\1\4\1'\3\5\0B\1\2\1\6\0\6\0X\1\fÄ\a\0\a\0X\1\5Ä6\1\0\0009\1\4\1'\3\b\0B\1\2\1X\1\tÄ6\1\0\0009\1\4\1'\3\t\0B\1\2\1X\1\4Ä6\1\0\0009\1\4\1'\3\n\0B\1\2\1K\0\1\0\19NvimTreeToggle\21NvimTreeFindFile\18NvimTreeFocus\5\rNvimTree\20NvimTreeRefresh\bcmd\rfiletype\24nvim_buf_get_option\bapi\bvimf\1\0\a\0\a\0\n3\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\5\0\18\5\0\0005\6\6\0B\1\5\1K\0\1\0\1\0\1\tdesc\23Open tree explorer\14<leader>p\6n\bset\vkeymap\bvim\0\0", "setup", "nvim-tree.lua")
time([[Setup for nvim-tree.lua]], false)
-- Config for: filetype.nvim
time([[Config for filetype.nvim]], true)
try_loadstring("\27LJ\2\n]\0\0\3\0\6\0\r6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0006\1\0\0009\1\1\0019\1\4\1'\2\5\0&\1\2\1=\1\4\0K\0\1\0\aL0\15cinoptions\bcpp\rfiletype\abo\bvimà\1\0\0\a\0\n\0\0186\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0006\4\0\0009\4\4\0049\4\b\4'\6\t\0B\4\2\2'\5\a\0&\2\5\2B\0\2\1K\0\1\0\6%\vexpand\6\"\18open -a skim \rjobstart\afn\bpdf\rfiletype\abo\bvim.\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\15syntax off\bcmd\bvim0\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\17iabbrev $ $$\bcmd\bvim¯\2\1\0\6\0\28\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\26\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\v\0003\5\n\0=\5\f\0043\5\r\0=\5\14\4=\4\15\0035\4\17\0003\5\16\0=\5\18\4=\4\19\0035\4\21\0003\5\20\0=\5\22\4=\4\23\0035\4\24\0=\4\25\3=\3\27\2B\0\2\1K\0\1\0\14overrides\1\0\0\fshebang\1\0\1\tdash\ash\21function_complex\21*.math_notes/%w+\1\0\0\0\21function_literal\rBrewfile\1\0\0\0\24function_extensions\bpdf\0\bcpp\1\0\0\0\fcomplex\1\0\1\17.*git/config\14gitconfig\fliteral\1\0\1\17MyBackupFile\blua\15extensions\1\0\0\1\0\1\apn\vpotion\nsetup\rfiletype\frequire\0", "config", "filetype.nvim")
time([[Config for filetype.nvim]], false)
-- Config for: lsp-setup.nvim
time([[Config for lsp-setup.nvim]], true)
try_loadstring("\27LJ\2\nÛ\1\0\0\v\0\18\0\0266\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\16\0005\3\r\0006\4\0\0'\6\3\0B\4\2\0029\4\2\0045\6\v\0005\a\t\0005\b\a\0005\t\5\0005\n\4\0=\n\6\t=\t\b\b=\b\n\a=\a\f\6B\4\2\2=\4\14\0034\4\0\0=\4\15\3=\3\17\2B\0\2\1K\0\1\0\fservers\1\0\0\25jedi_language_server\16sumneko_lua\1\0\0\14lspconfig\1\0\0\rsettings\1\0\0\bLua\1\0\0\vformat\1\0\0\1\0\1\venable\2\flua-dev\nsetup\14lsp-setup\frequire\0", "config", "lsp-setup.nvim")
time([[Config for lsp-setup.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MarkdownPreview lua require("packer.load")({'markdown-preview.nvim'}, { cmd = "MarkdownPreview", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SearchSession lua require("packer.load")({'telescope.nvim'}, { cmd = "SearchSession", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeFindFile lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeFindFile", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeFocus lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeFocus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Neogit lua require("packer.load")({'neogit'}, { cmd = "Neogit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeOpen lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSUpdate lua require("packer.load")({'nvim-treesitter'}, { cmd = "TSUpdate", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSInstallSync lua require("packer.load")({'nvim-treesitter'}, { cmd = "TSInstallSync", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeRefresh lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeRefresh", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file UndotreeToggle lua require("packer.load")({'undotree'}, { cmd = "UndotreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType css ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "css" }, _G.packer_plugins)]]
vim.cmd [[au FileType python ++once lua require("packer.load")({'vim-python-pep8-indent'}, { ft = "python" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType sass ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "sass" }, _G.packer_plugins)]]
vim.cmd [[au FileType lua ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType vim ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "vim" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType md ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "md" }, _G.packer_plugins)]]
vim.cmd [[au FileType MD ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "MD" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "typescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "javascript" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufRead * ++once lua require("packer.load")({'nvim-treesitter', 'Comment.nvim', 'nvim-colorizer.lua'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'nvim-ufo', 'gitsigns.nvim'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
vim.cmd [[au BufNewFile * ++once lua require("packer.load")({'nvim-treesitter'}, { event = "BufNewFile *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
