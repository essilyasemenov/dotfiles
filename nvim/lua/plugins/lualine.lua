return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()

      -- Тема на основе цветов heather.nvim
      -- Каждый режим — свой акцентный цвет из палитры
      local heather = {
        normal = {
          a = { bg = "#E080E0", fg = "#141416", gui = "bold" },  -- keyword: magenta
          b = { bg = "#222230", fg = "#E8E8F8" },
          c = { bg = "#18181E", fg = "#9090BC" },
        },
        insert = {
          a = { bg = "#7FFFD4", fg = "#141416", gui = "bold" },  -- green: aquamarine
          b = { bg = "#222230", fg = "#E8E8F8" },
          c = { bg = "#18181E", fg = "#9090BC" },
        },
        visual = {
          a = { bg = "#F578A2", fg = "#141416", gui = "bold" },  -- pink
          b = { bg = "#222230", fg = "#E8E8F8" },
          c = { bg = "#18181E", fg = "#9090BC" },
        },
        replace = {
          a = { bg = "#FF9090", fg = "#141416", gui = "bold" },  -- operator: coral
          b = { bg = "#222230", fg = "#E8E8F8" },
          c = { bg = "#18181E", fg = "#9090BC" },
        },
        command = {
          a = { bg = "#F5CA78", fg = "#141416", gui = "bold" },  -- number: amber
          b = { bg = "#222230", fg = "#E8E8F8" },
          c = { bg = "#18181E", fg = "#9090BC" },
        },
        inactive = {
          a = { bg = "#18181E", fg = "#606075", gui = "bold" },
          b = { bg = "#18181E", fg = "#606075" },
          c = { bg = "#141416", fg = "#606075" },
        },
      }

      require("lualine").setup({
        options = {
          theme                = heather,
          globalstatus         = true,   -- одна statusline на всё, не на каждый сплит
          section_separators   = { left = "", right = "" },
          component_separators = { left = "│", right = "│" },
        },

        sections = {
          lualine_a = { "mode" },

          lualine_b = {
            { "branch", icon = "" },
            { "diff",
              symbols = { added = " ", modified = " ", removed = " " },
            },
          },

          lualine_c = {
            { "filename",
              path = 1,        -- показывать относительный путь
              symbols = { modified = "  ", readonly = "  " },
            },
          },

          lualine_x = {
            { "diagnostics",
              sources  = { "nvim_lsp" },
              symbols  = { error = " ", warn = " ", info = " ", hint = " " },
            },
            "filetype",
          },

          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },
}
