return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require("conform").setup({
        -- Go форматируется через gopls (gofumpt = true уже настроен в lsp.lua)
        -- Для других языков добавляй сюда свои форматтеры
        formatters_by_ft = {
          lua = { "stylua" },
        },

        -- Форматировать при каждом :w
        format_on_save = {
          timeout_ms = 1000,
          lsp_format  = "fallback",  -- если нет форматтера — использовать LSP
        },
      })

      -- Вручную: <leader>p — форматировать файл
      vim.keymap.set({ "n", "v" }, "<leader>p", function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end, { desc = "Форматировать файл" })
    end,
  },
}
