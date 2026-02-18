return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("bufferline").setup({
        options = {
          mode              = "buffers",
          separator_style   = "thin",
          always_show_bufferline = true,
          show_close_icon   = false,
          color_icons       = true,

          -- Показывать ошибки LSP на табе
          diagnostics       = "nvim_lsp",
          diagnostics_indicator = function(count, level)
            local icons = { error = " ", warning = " " }
            return (icons[level] or "") .. count
          end,

          -- Добавляем отступы вокруг имени — табы становятся шире
          name_formatter = function(buf)
            return "  " .. buf.name .. "  "
          end,

          -- neo-tree не перекрывает буферлайн
          offsets = {
            {
              filetype  = "neo-tree",
              text      = "Файлы",
              highlight = "Directory",
              separator = true,
            },
          },
        },

        -- Цвета heather.nvim
        highlights = {
          fill                = { bg = "#0A0A0E" },
          background          = { bg = "#141416", fg = "#606075" },
          buffer_selected     = { bg = "#222230", fg = "#E8E8F8", bold = true, italic = false },
          buffer_visible      = { bg = "#18181E", fg = "#9090BC" },
          close_button        = { bg = "#141416", fg = "#606075" },
          close_button_selected = { bg = "#222230", fg = "#FF9090" },
          separator           = { bg = "#141416", fg = "#0A0A0E" },
          separator_selected  = { bg = "#222230", fg = "#0A0A0E" },
          separator_visible   = { bg = "#18181E", fg = "#0A0A0E" },
          modified            = { bg = "#141416", fg = "#F5CA78" },
          modified_selected   = { bg = "#222230", fg = "#F5CA78" },
          indicator_selected  = { bg = "#222230", fg = "#E080E0" },
          tab_selected        = { bg = "#222230", fg = "#E8E8F8", bold = true },
          tab                 = { bg = "#141416", fg = "#606075" },
          tab_close           = { bg = "#141416", fg = "#FF9090" },
          error               = { bg = "#141416", fg = "#F08080" },
          error_selected      = { bg = "#222230", fg = "#F08080" },
          warning             = { bg = "#141416", fg = "#E0C878" },
          warning_selected    = { bg = "#222230", fg = "#E0C878" },
        },
      })

      -- Переключение буферов через табы (уже есть Tab/S-Tab, но оставим и числа)
      local map = vim.keymap.set
      map("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>", { desc = "Буфер 1" })
      map("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>", { desc = "Буфер 2" })
      map("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>", { desc = "Буфер 3" })
      map("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>", { desc = "Буфер 4" })
      map("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>", { desc = "Буфер 5" })
    end,
  },
}
