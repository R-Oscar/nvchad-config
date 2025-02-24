local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

-- Глобальная переменная для отслеживания состояния
vim.g.formatter_enabled = true

-- Функция для переключения состояния
local toggle_formatter = function()
  vim.g.formatter_enabled = not vim.g.formatter_enabled
  vim.notify(
    "Formatter " .. (vim.g.formatter_enabled and "enabled" or "disabled"),
    vim.g.formatter_enabled and vim.log.levels.INFO or vim.log.levels.WARN
  )
end

-- Настройка автокоманд для форматтера
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup,
  callback = function()
    if vim.g.formatter_enabled then
      vim.lsp.buf.format({ async = false })
    end
  end,
})

-- Назначаем биндинг для переключения
vim.keymap.set("n", "<leader>tf", toggle_formatter, { desc = "Toggle formatter" })

local opts = {
  sources = {
    null_ls.builtins.formatting.prettierd,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          if vim.g.formatter_enabled then
            vim.lsp.buf.format({ bufnr = bufnr })
          end
        end,
      })
    end
  end,
}

vim.keymap.set("n", "<leader>tf", toggle_formatter, { desc = "Toggle formatter" })

return opts
