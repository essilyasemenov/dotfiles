return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      -- Go-конфигурация (автоматически запускает Delve)
      {
        "leoluz/nvim-dap-go",
        config = function()
          require("dap-go").setup()
        end,
      },

      -- Визуальный UI: переменные, стек вызовов, брейкпоинты
      {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" },
        config = function()
          local dap   = require("dap")
          local dapui = require("dapui")

          dapui.setup()

          -- UI открывается и закрывается автоматически
          dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
          end
          dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
          end
          dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
          end
        end,
      },

      -- Значения переменных прямо в строках кода (virtual text)
      {
        "theHamsta/nvim-dap-virtual-text",
        config = function()
          require("nvim-dap-virtual-text").setup()
        end,
      },
    },

    config = function()
      local dap   = require("dap")
      local dapui = require("dapui")
      local map   = vim.keymap.set

      -- Иконки в знаковой колонке
      vim.fn.sign_define("DapBreakpoint",          { text = "●", texthl = "DiagnosticError" })
      vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "DiagnosticWarn"  })
      vim.fn.sign_define("DapBreakpointRejected",  { text = "○", texthl = "DiagnosticError" })
      vim.fn.sign_define("DapLogPoint",            { text = "◉", texthl = "DiagnosticInfo"  })
      vim.fn.sign_define("DapStopped",             { text = "▶", texthl = "DiagnosticOk", linehl = "CursorLine" })

      -- ─── Управление сессией ───────────────────────────────────────────────
      map("n", "<F5>",       dap.continue,           { desc = "Debug: Запустить / продолжить" })
      map("n", "<F10>",      dap.step_over,          { desc = "Debug: Шаг через" })
      map("n", "<F11>",      dap.step_into,          { desc = "Debug: Шаг внутрь" })
      map("n", "<F12>",      dap.step_out,           { desc = "Debug: Шаг наружу" })
      map("n", "<leader>dr", dap.restart,            { desc = "Debug: Перезапустить" })
      map("n", "<leader>dq", dap.terminate,          { desc = "Debug: Остановить" })

      -- ─── Брейкпоинты ─────────────────────────────────────────────────────
      map("n", "<leader>db", dap.toggle_breakpoint,  { desc = "Debug: Брейкпоинт" })
      map("n", "<leader>dB", function()
        dap.set_breakpoint(vim.fn.input("Условие: "))
      end, { desc = "Debug: Условный брейкпоинт" })

      -- ─── UI ──────────────────────────────────────────────────────────────
      map("n", "<leader>du", dapui.toggle,           { desc = "Debug: Открыть/закрыть UI" })
      map("n", "<leader>de", dapui.eval,             { desc = "Debug: Вычислить выражение" })
      map("v", "<leader>de", dapui.eval,             { desc = "Debug: Вычислить выделенное" })

      -- ─── Go-специфичное (тесты) ───────────────────────────────────────────
      map("n", "<leader>dt", function() require("dap-go").debug_test()      end, { desc = "Debug: Тест под курсором" })
      map("n", "<leader>dl", function() require("dap-go").debug_last_test() end, { desc = "Debug: Повторить последний тест" })
    end,
  },
}
