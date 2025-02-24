local M = {}

M.general = {
  n = {
    ["<leader>e"] = {
      function()
        vim.diagnostic.open_float(0, {scope="line"})
      end,
      "Show line diagnostics",
    },
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<cr>", "Window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<cr>", "Window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<cr>", "Window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<cr>", "Window up" },
  },
}

M.telescope = {
  n = {
    ["<leader>fc"] = {
      function()
        require('telescope.builtin').find_files({
          find_command = {'rg', '--files', '--glob', '*.tsx', '--glob', '*.jsx'}
        })
      end,
      "Find React Components",
    },
    ["<leader>fm"] = {
      function()
        require('telescope.builtin').find_files({
          find_command = {'rg', '--files', '--glob', '*.md'}
        })
      end,
      "Find Markdown Files",
    },
  },
}

return M

