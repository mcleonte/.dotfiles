local py_venv_bin = string.gsub(vim.g.python3_host_prog, "python$", "")

return {
  {
    "williamboman/mason.nvim",
    opts = {
      DEFAULT_SETTINGS = {
        PATH = "append",
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        pyright = {
          cmd = { py_venv_bin .. "pyright-langserver", "--stdio" },
          settings = {
            pyright = {
              -- Using Ruff's import organizer
              disableOrganizeImports = true,
            },
            python = {
              pythonPath = vim.g.python3_host_prog,
              --   analysis = {
              --     -- Ignore all files for analysis to exclusively use Ruff for linting
              --     ignore = { "*" },
              --   },
            },
          },
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "ruff_format", "yapf", "ruff_fix" },
        ["*"] = { "codespell" },
      },
      -- formatters = {
      --   ruff_format = function(bufnr)
      --     return {
      --       command = py_venv_bin .. "ruff",
      --     }
      --   end,
      -- },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      events = { "BufWritePost", "BufReadPost", "TextChanged" },
      linters_by_ft = {
        python = { "ruff" },
      },
    },
  },

  -- the opts function can also be used to change the default opts:
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      local s = opts.sections
      s.lualine_c, s.lualine_x = s.lualine_x, s.lualine_c
      -- local temp = s.lualine_x
      -- s.lualine_b = s.lualine_x
      -- s.lualine_x = temp
      -- table.insert(opts.sections.lualine_x, function()
      --   local linters = require("lint").get_running()
      --   -- if #linters == 0 then
      --   --   return "󰦕"
      --   -- end
      --   return "󱉶 " .. table.concat(linters, ", ")
      -- end)
    end,
  },
}
