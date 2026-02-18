return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")

      wk.setup({
        delay = 400,  -- задержка перед появлением popup (мс)
        icons = {
          mappings = true,
        },
      })

      -- Группируем leader-биндинги — в popup будет видно название группы
      wk.add({
        -- Группы
        { "<leader>f",  group = "Найти (Telescope)" },
        { "<leader>h",  group = "Git (hunks)" },
        { "<leader>d",  group = "Debug" },
        { "<leader>t",  group = "Тесты" },
        { "<leader>c",  group = "Код / Go" },
        { "<leader>g",  desc  = "LazyGit" },

        -- Одиночные биндинги (для документации)
        { "<leader>rn", desc = "Переименовать символ" },
        { "<leader>ca", desc = "Code action" },
        { "<leader>e",  desc = "Показать ошибку" },
        { "<leader>x",  desc = "Закрыть буфер" },
        { "<leader>n",  desc = "Файловое дерево" },
        { "<leader>N",  desc = "Показать файл в дереве" },
        { "<leader>p",  desc = "Форматировать" },
      })
    end,
  },
}
