local plugins = {
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("telescope").setup {
        defaults = {
          -- Your Telescope default settings
        },
        pickers = {
          find_components = {
            find_command = {'rg', '--files', '--glob', '*.tsx', '--glob', '*.jsx'},
            prompt_title = "Find React Components",
          },
          find_markdown = {
            find_command = {'rg', '--files', '--glob', '*.md'},
            prompt_title = "Find Markdown Files",
          },
        },
      }
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "typescript-language-server",
        "eslint-lsp",
        "prettierd",
        "emmet-ls",
        "css-lsp",
      }
    }
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
    config = function ()
      require('nvim-ts-autotag').setup()
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function ()
      opts = require "plugins.configs.treesitter"
      opts.ensure_installed = {
        "lua",
        "javascript",
        "typescript",
        "tsx",
        "markdown",
        "markdown_inline",
        "css",
      }
      return opts
    end
  },
  {
    "tpope/vim-fugitive",
    lazy = false,
  },
  {
    "OlegGulevskyy/better-ts-errors.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    event = "BufReadPre *.ts,*.tsx",
    config = function()
      require('better-ts-errors').setup {
        keymaps = {
          toggle = '<leader>dd', -- default '<leader>dd'
          go_to_definition = '<leader>dx' -- default '<leader>dx'
        }
      }
    end,
  }
}
return plugins
