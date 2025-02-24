local plugins = {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
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
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = {
        adaptive_size = true,
        preserve_window_proportions = true
      }
    }
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'auto',
        },
      }
    end
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
  },
  {
    "NvChad/nvterm",
    lazy = false,
  },
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require "custom.configs.lint"
    end,
  },
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
      config = function ()
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
      vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
      vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
      vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
    end
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 }
}
return plugins
