return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      -- В новом nvim-treesitter (для Neovim 0.10+) query-файлы лежат в runtime/queries/
      -- а не в queries/ — добавляем runtime/ в runtimepath чтобы Neovim их нашёл
      vim.opt.runtimepath:append(
        vim.fn.stdpath("data") .. "/lazy/nvim-treesitter/runtime"
      )

      require("nvim-treesitter").setup()

      -- Явно включаем treesitter-подсветку при открытии файлов этих типов
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "go", "gomod", "gosum",
          "lua", "vim", "vimdoc",
          "bash", "sh",
          "json", "yaml", "toml",
          "markdown", "sql",
        },
        callback = function()
          vim.treesitter.start()
        end,
      })
    end,
  },
}
