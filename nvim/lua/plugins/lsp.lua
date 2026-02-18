return {
  -- Mason: UI для управления LSP-серверами (опционально, пригодится позже)
  {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    opts = {},
  },

  -- LSP конфигурация через нативный API Neovim 0.11
  -- nvim-lspconfig больше не нужен — используем vim.lsp.config напрямую
  {
    "neovim/nvim-lspconfig", -- оставляем только ради авто-подхвата filetype/cmd по умолчанию
    config = function()
      local map = vim.keymap.set

      -- Биндинги срабатывают только когда LSP подключился к буферу
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local opts = { buffer = args.buf }

          -- Навигация
          map("n", "gd", vim.lsp.buf.definition,     vim.tbl_extend("force", opts, { desc = "Перейти к определению" }))
          map("n", "gD", vim.lsp.buf.declaration,    vim.tbl_extend("force", opts, { desc = "Перейти к декларации" }))
          map("n", "gi", vim.lsp.buf.implementation, vim.tbl_extend("force", opts, { desc = "Перейти к реализации" }))
          map("n", "gr", vim.lsp.buf.references,     vim.tbl_extend("force", opts, { desc = "Показать референсы" }))

          -- Документация
          map("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Документация" }))

          -- Редактирование
          map("n", "<leader>rn", vim.lsp.buf.rename,      vim.tbl_extend("force", opts, { desc = "Переименовать символ" }))
          map("n", "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code action" }))

          -- Диагностика
          map("n", "<leader>e", vim.diagnostic.open_float, vim.tbl_extend("force", opts, { desc = "Показать ошибку" }))
          map("n", "[d",        vim.diagnostic.goto_prev,  vim.tbl_extend("force", opts, { desc = "Предыдущая ошибка" }))
          map("n", "]d",        vim.diagnostic.goto_next,  vim.tbl_extend("force", opts, { desc = "Следующая ошибка" }))

          -- Включаем inlay hints для этого буфера
          vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
        end,
      })

      -- Нативный API Neovim 0.11: настройка gopls
      vim.lsp.config("gopls", {
        cmd      = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_markers = { "go.work", "go.mod", ".git" },
        settings = {
          gopls = {
            analyses = {
              unusedparams   = true, -- неиспользуемые параметры
              unusedwrite    = true, -- запись в переменную которая не читается
              unusedvariable = true, -- неиспользуемые переменные
            },
            staticcheck        = true,  -- дополнительные статические проверки
            gofumpt            = true,  -- строгий форматтер
            completeUnimported = true,  -- автоимпорт пакетов
            usePlaceholders    = true,  -- placeholder-аргументы в дополнении

            -- Inlay hints: подсказки с типами прямо в коде
            hints = {
              assignVariableTypes    = true,
              compositeLiteralFields = true,
              constantValues         = true,
              functionTypeParameters = true,
              parameterNames         = true,
              rangeVariableTypes     = true,
            },
          },
        },
      })

      vim.lsp.enable("gopls")
    end,
  },
}
