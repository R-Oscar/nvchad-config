local M = {}

M.general = {
  n = {
    ["<leader>e"] = {
      function()
        vim.diagnostic.open_float(0, {scope="line"})
      end,
      "Show line diagnostics",
    },
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

