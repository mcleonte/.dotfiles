local packer, use, use_local, install_sync = unpack(require "plugins.packer")

packer.startup { function()

  -- startup
  use { "wbthomason/packer.nvim", opt = true } -- packer self check
  use { "lewis6991/impatient.nvim" } -- speed up loading Lua modules to improve startup time
  use { "nathom/filetype.nvim", ext = "filetype" } -- A faster version of filetype.vim

  -- colorschemes
  use 'tomasr/molokai' -- required by molokayo
  use 'fmoralesc/molokayo'

  -- common
  use 'vim-airline/vim-airline' -- powerline
  use 'vim-airline/vim-airline-themes'
  use 'rhysd/vim-grammarous' -- grammar check
  use 'andymass/vim-matchup' -- matching parens and more
  use 'bronson/vim-trailing-whitespace' -- highlight trailing spaces
  use 'marko-cerovac/material.nvim'

  -- viewers
  use { "iamcco/markdown-preview.nvim", ext = "markdownpreview" } -- not an editor command: MarkdownPreviewToggle

  --require('material').set()

  -- Git
  use { "lewis6991/gitsigns.nvim", ext = "gitsigns" } -- git added/removed in sidebar + inline blame
  use { "TimUntersberger/neogit", cmd = { "Neogit" }, ext = "neogit" }
  use 'rhysd/git-messenger.vim'
  use 'tpope/vim-fugitive' -- Git commands

  -- Commenter & Colorizer
  use { "norcalli/nvim-colorizer.lua", event = "BufRead", ext = "colorizer" }
  use { "numToStr/Comment.nvim", event = "BufRead", ext = "comment" }

  -- Telescope
  use { "nvim-telescope/telescope.nvim", module = "telescope", ext = "telescope",
    requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } } }
  use { "nvim-telescope/telescope-project.nvim", after = "telescope.nvim", ext = "project" }
  use { "nvim-telescope/telescope-media-files.nvim", after = "telescope.nvim" }
  use { "nvim-telescope/telescope-file-browser.nvim", after = "telescope.nvim" }
  use { "jvgrootveld/telescope-zoxide", after = "telescope.nvim", ext = "telescope-zoxide" }

  -- Syntax
  use { "nvim-treesitter/nvim-treesitter", event = { "BufRead", "BufNewFile" }, ext = "treesitter" }
  use { "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" }
  use { "JoseConseco/iswap.nvim", after = "nvim-treesitter", ext = "iswap" }

  -- lsp
  --use { { "williamboman/mason.nvim", ext = "mason" },
  --      { "williamboman/mason-lspconfig.nvim", after = { "mason.nvim", "lua-dev.nvim" }, ext = "mason-lspconfig" },
  --      { "neovim/nvim-lspconfig", after = "mason-lspconfig.nvim", ext = "lspconfig"  } }
  use {
    'junnplus/lsp-setup.nvim',
    requires = {
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim'
    },
    ext = 'lsp-setup'
  }


  -- use 'glepnir/lspsaga.nvim'
  use 'hrsh7th/nvim-compe'

  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false
  }
  )

  --  require'lspsaga'.init_lsp_saga {
  --    error_sign = '!',
  --    warn_sign = '^',
  --    hint_sign = '?',
  --    infor_sign = '~',
  --    border_style = "round",
  --    code_action_prompt = {
  --      enable = false
  --   }
  --  }

  -- UI helpers
  use { "mbbill/undotree", cmd = "UndotreeToggle" }
  use { "kyazdani42/nvim-tree.lua", ext = "nvim-tree" }
  use { "kevinhwang91/nvim-ufo", ext = "nvim-ufo" }

  -- search
  use 'tpope/vim-eunuch' -- wrappers UNIX commands
  use 'tpope/vim-surround' -- surround characters shortcuts
  use 'tpope/vim-vinegar' -- file browser
  use 'kyazdani42/nvim-web-devicons' -- icons when searching

  -- testing
  use 'kassio/neoterm' -- terminal wrapper
  use 'janko-m/vim-test' -- testing commands

  -- python
  use { 'Vimjas/vim-python-pep8-indent', ft = 'python' }

  -- debug & dev
  use { "folke/lua-dev.nvim", module = "lua-dev" }

  install_sync()

end,
  config = {

  },
}
