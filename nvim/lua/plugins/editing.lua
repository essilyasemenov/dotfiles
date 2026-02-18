return {
  -- Добавлять/менять/удалять скобки и кавычки вокруг текста
  -- ys<motion><char>  — добавить    (ysiw" = обернуть слово в "")
  -- ds<char>          — удалить     (ds"   = убрать кавычки)
  -- cs<old><new>      — заменить    (cs"'  = " → ')
  {
    "kylechui/nvim-surround",
    version = "*",
    event   = "VeryLazy",
    config  = function()
      require("nvim-surround").setup()
    end,
  },

  -- Автоматически закрывает (), [], {}, "", ''
  -- Интегрируется с cmp: если выбрал функцию из автодополнения — сразу ставит ()
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true,  -- treesitter помогает определять контекст (не закрывать в строках)
      })

      -- Интеграция с nvim-cmp: при подтверждении функции → автоскобки
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp           = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },

  -- Подсвечивает TODO, FIXME, NOTE, HACK, WARN в коде
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup()

      -- Найти все TODO в проекте через Telescope
      vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Найти TODO в проекте" })
    end,
  },
}
