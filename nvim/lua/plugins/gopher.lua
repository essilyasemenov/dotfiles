return {
  {
    "olexsmir/gopher.nvim",
    ft = { "go", "gomod" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("gopher").setup()

      -- Биндинги только для Go-файлов (buffer-local)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "go",
        callback = function()
          local map  = vim.keymap.set
          local opts = { buffer = true }

          -- Struct теги
          map("n", "<leader>cj", "<cmd>GoTagAdd json<cr>",
            vim.tbl_extend("force", opts, { desc = "Go: добавить json теги" }))
          map("n", "<leader>cy", "<cmd>GoTagAdd yaml<cr>",
            vim.tbl_extend("force", opts, { desc = "Go: добавить yaml теги" }))
          map("n", "<leader>cJ", "<cmd>GoTagRemove json<cr>",
            vim.tbl_extend("force", opts, { desc = "Go: убрать json теги" }))

          -- if err != nil
          map("n", "<leader>ce", "<cmd>GoIfErr<cr>",
            vim.tbl_extend("force", opts, { desc = "Go: if err != nil" }))

          -- Реализовать интерфейс (запросит: тип и интерфейс)
          map("n", "<leader>ci", "<cmd>GoImpl<cr>",
            vim.tbl_extend("force", opts, { desc = "Go: реализовать интерфейс" }))

          -- go mod tidy
          map("n", "<leader>cm", "<cmd>GoMod tidy<cr>",
            vim.tbl_extend("force", opts, { desc = "Go: mod tidy" }))
        end,
      })
    end,
  },
}
