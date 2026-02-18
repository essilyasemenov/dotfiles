return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        -- Floating terminal по умолчанию
        direction = "float",
        float_opts = {
          border   = "curved",
          width    = math.floor(vim.o.columns * 0.85),
          height   = math.floor(vim.o.lines   * 0.80),
        },

        -- Закрыть терминал через Esc (в terminal mode)
        on_create = function(term)
          vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { buffer = term.bufnr, desc = "Выйти из terminal mode" })
        end,
      })

      local Terminal = require("toggleterm.terminal").Terminal
      local map      = vim.keymap.set

      -- Обычный floating terminal — <C-\>
      map({ "n", "t" }, "<C-\\>", "<cmd>ToggleTerm<cr>", { desc = "Терминал" })

      -- LazyGit
      local lazygit = Terminal:new({
        cmd       = "lazygit",
        direction = "float",
        float_opts = {
          border = "curved",
          width  = math.floor(vim.o.columns * 0.95),
          height = math.floor(vim.o.lines   * 0.93),
        },
        -- Скрывать из списка буферов
        hidden = true,
        on_open = function(term)
          vim.keymap.set("t", "<Esc>", "<Nop>",         { buffer = term.bufnr })  -- Esc нужен lazygit-у
          vim.keymap.set("t", "q",     "<cmd>close<cr>", { buffer = term.bufnr })  -- q закрывает окно
        end,
      })

      map("n", "<leader>g", function() lazygit:toggle() end, { desc = "LazyGit" })
    end,
  },
}
