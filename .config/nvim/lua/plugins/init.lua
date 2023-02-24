local packer_startup, use = unpack(require("plugins.packer"))

-- see full list of arguments for function "use" at:
-- https://github.com/wbthomason/packer.nvim#specifying-plugins
-- ext is an additional argument created in plugins.packer.lua
-- to separates config functions from this file

packer_startup(function()
  -- startup
  use({ "wbthomason/packer.nvim", opt = true }) -- packer self check
  use({ "lewis6991/impatient.nvim" }) -- speed up loading Lua modules to improve startup time
  use({ "nathom/filetype.nvim", ext = "filetype" }) -- A faster version of filetype.vim

  use({ "nvim-lua/plenary.nvim" })
  use({ "hrsh7th/nvim-compe" }) -- dependency for mcleonte/autocompletion

  -- colorschemes
  use({ "EdenEast/nightfox.nvim", ext = "nightfox" })

  -- common
  --use("vim-airline/vim-airline") -- powerline
  --use("vim-airline/vim-airline-themes")

  use("rhysd/vim-grammarous") -- grammar check
  use("andymass/vim-matchup") -- matching parens and more
  use("bronson/vim-trailing-whitespace") -- highlight trailing spaces
  use("marko-cerovac/material.nvim")

  use("rcarriga/nvim-notify")

  -- viewers
  use({
    "iamcco/markdown-preview.nvim",
    ext = "markdownpreview",
    run = "cd app && npm install",
    cmd = "MarkdownPreview",
    ft = { "markdown", "md", "MD" },
    setup = function()
      vim.g.mkdp_filetypes = { "markdown", "md", "MD" }
    end,
  })

  -- Git
  use({ "lewis6991/gitsigns.nvim", ext = "gitsigns" }) -- git added/removed in sidebar + inline blame
  use({ "TimUntersberger/neogit", cmd = { "Neogit" } })
  use("rhysd/git-messenger.vim")
  use("tpope/vim-fugitive") -- Git commands
  use({ "sindrets/diffview.nvim", ext = "diffview", requires = "nvim-lua/plenary.nvim" })

  -- Commenter & Colorizer
  use({ "norcalli/nvim-colorizer.lua", event = "BufRead", ext = "colorizer" })
  use({ "numToStr/Comment.nvim", event = "BufRead", ext = "comment" })

  -- Telescope
  use({
    "nvim-telescope/telescope.nvim",
    module = "telescope",
    ext = "telescope",
    requires = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
    -- cmd = { "Telescope", "SearchSession" },
  })
  use({ "nvim-telescope/telescope-project.nvim", after = "telescope.nvim", ext = "project" })
  use({ "nvim-telescope/telescope-media-files.nvim", after = "telescope.nvim" })
  use({ "nvim-telescope/telescope-file-browser.nvim", after = "telescope.nvim" })
  use({ "jvgrootveld/telescope-zoxide", after = "telescope.nvim", ext = "telescope-zoxide" })

  -- Syntax
  use({
    "nvim-treesitter/nvim-treesitter",
    event = { "BufRead", "BufNewFile" },
    ext = "treesitter",
    cmd = { "TSUpdate", "TSInstallSync" },
    run = ":TSUpdate",
    setup = function()
      vim.keymap.set("n", "<leader>o", "<cmd>SymbolsOutline<cr>", { desc = "Symbols Outline" })
    end,
  })
  use({ "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" })

  use({ "hrsh7th/nvim-cmp" })

  -- LSP

  -- nvim-cmp source for neovim builtin LSP client
  use({ "hrsh7th/cmp-nvim-lsp" })

  -- main lsp package manager
  use({ "williamboman/mason.nvim", ext = "mason" })

  -- wrapper for bridging the gap between mason and lspconfig
  use({ "williamboman/mason-lspconfig.nvim" }) --, ext = "mason-lspconfig" })
  -- core lsp configurer plugin
  use({ "neovim/nvim-lspconfig", ext = "nvim-lspconfig" })

  -- made for bridgin the gap between mason.nvim and null-ls.nvim
  use({ "jayp0521/mason-null-ls.nvim", ext = "mason-null-ls" })
  -- recommended by mason.nvim to pair with for linters and formatters
  use({ "jose-elias-alvarez/null-ls.nvim", ext = "null-ls", requires = "nvim-lua/plenary.nvim" })

  -- A light-weight lsp plugin based on neovim's built-in lsp with a highly
  -- performant UI.
  -- use({ "glepnir/lspsaga.nvim", ext = "lspsaga" })

  -- LSP signature hint as you type
  use({ "ray-x/lsp_signature.nvim", ext = "lsp_signature" })

  -- vscode-like pictograms for neovim lsp completion items
  use({ "onsails/lspkind.nvim", ext = "lspkind" })

  -- session management
  use({ "rmagatti/auto-session", ext = "auto-session" })
  -- telescope integration for fuzy searching sessions
  use({
    "rmagatti/session-lens",
    ext = "session-lens",
    requires = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
  })

  -- maximizes and restores current window
  use("szw/vim-maximizer")

  -- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  --  vim.lsp.diagnostic.on_publish_diagnostics, {
  --  virtual_text = false
  -- }
  -- )

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

  use({ "mbbill/undotree", cmd = "UndotreeToggle" })

  use({
    "nvim-lualine/lualine.nvim",
    ext = "lualine",
    requires = { "nvim-tree/nvim-web-devicons", opt = true },
    after = "nightfox.nvim", -- need to load theme before lualine
  })
  -- use("nanozuki/tabby.nvim") -- using lualine tabline instead

  -- A file explorer tree for neovim written in lua
  -- default mappings: https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt#L1303
  use({
    "nvim-tree/nvim-tree.lua",
    ext = "nvim-tree",
    requires = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
  })

  use({ "lukas-reineke/indent-blankline.nvim", ext = "indent-blankline" })
  use({
    "kevinhwang91/nvim-ufo",
    ext = "nvim-ufo",
    opt = true,
    event = { "BufReadPre" },
    wants = { "promise-async" },
    requires = "kevinhwang91/promise-async",
  })
  -- use { "rcarriga/nvim-notify", ext = "nvim-notify" }

  -- search
  use("tpope/vim-surround") -- surround characters shortcuts
  use("nvim-tree/nvim-web-devicons") -- icons when searching

  use("kassio/neoterm") -- terminal wrapper

  -- diagnostics
  -- https://github.com/mfussenegger/nvim-dap#usage
  use({ "mfussenegger/nvim-dap", ext = "dap" })
  use({
    "mfussenegger/nvim-dap-python",
    ext = "nvim-dap-python",
    requires = { "mfussenegger/nvim-dap", "nvim-treesitter/nvim-treesitter" },
    run = ":TSInstall python",
  })
  use({ "rcarriga/nvim-dap-ui", ext = "dapui", requires = { "mfussenegger/nvim-dap" } })
  use({ "theHamsta/nvim-dap-virtual-text", ext = "nvim-dap-virtual-text" })
  use("nvim-telescope/telescope-dap.nvim")

  -- testing
  use({
    "nvim-neotest/neotest",
    ext = "neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python",
    },
  })

  -- not working
  use({ "Iron-E/nvim-libmodal" }) --, ext = "libmodal" })
end)
