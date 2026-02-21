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

      local map = vim.keymap.set

      -- Обычный floating terminal — <C-\>
      map({ "n", "t" }, "<C-\\>", "<cmd>ToggleTerm<cr>", { desc = "Терминал" })

    end,
  },
}
