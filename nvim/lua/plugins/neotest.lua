return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-go",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-go")({
            args = { "-count=1", "-timeout=60s", "-race" },
          }),
        },

        -- Иконки результатов
        icons = {
          passed  = "✓",
          failed  = "✗",
          running = "↻",
          skipped = "○",
          unknown = "?",
        },

        -- Не показывать диагностику LSP поверх результатов тестов
        diagnostic = {
          enabled = true,
        },
      })

      local nt  = require("neotest")
      local map = vim.keymap.set

      map("n", "<leader>tr", function() nt.run.run() end,
        { desc = "Test: Тест под курсором" })

      map("n", "<leader>tR", function() nt.run.run(vim.fn.expand("%")) end,
        { desc = "Test: Все тесты в файле" })

      map("n", "<leader>ts", function() nt.summary.toggle() end,
        { desc = "Test: Панель тестов" })

      map("n", "<leader>to", function() nt.output.open({ enter = true }) end,
        { desc = "Test: Вывод теста" })

      map("n", "<leader>tO", function() nt.output_panel.toggle() end,
        { desc = "Test: Панель вывода (снизу)" })

      map("n", "<leader>tS", function() nt.run.stop() end,
        { desc = "Test: Остановить" })

      -- Дебажить тест через nvim-dap
      map("n", "<leader>td", function() nt.run.run({ strategy = "dap" }) end,
        { desc = "Test: Дебажить тест" })

      -- Навигация по провалившимся тестам
      map("n", "]t", function() nt.jump.next({ status = "failed" }) end,
        { desc = "Test: Следующий провалившийся" })
      map("n", "[t", function() nt.jump.prev({ status = "failed" }) end,
        { desc = "Test: Предыдущий провалившийся" })
    end,
  },
}
