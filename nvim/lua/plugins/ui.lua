return {
  -- Вертикальные линии отступов
  {
    "lukas-reineke/indent-blankline.nvim",
    main  = "ibl",
    event = "BufReadPost",
    config = function()
      require("ibl").setup({
        indent = {
          char      = "│",
          tab_char  = "│",
        },
        scope = {
          enabled    = true,   -- подсвечивает текущий scope (функцию, if, for...)
          show_start = false,
          show_end   = false,
        },
        exclude = {
          filetypes = { "help", "dashboard", "neo-tree", "lazy", "mason" },
        },
      })
    end,
  },

  -- Подсвечивает все вхождения слова под курсором
  {
    "RRethy/vim-illuminate",
    event = "BufReadPost",
    config = function()
      require("illuminate").configure({
        delay          = 200,
        under_cursor   = true,
        -- Не работать в этих типах файлов
        filetypes_denylist = { "neo-tree", "TelescopePrompt", "mason" },
      })
    end,
  },
}
