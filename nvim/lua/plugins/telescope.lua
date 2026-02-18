return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "master",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    config = function()
      local telescope = require("telescope")
      local actions   = require("telescope.actions")

      telescope.setup({
        defaults = {
          -- В insert mode внутри telescope
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<Esc>"] = actions.close,
            },
          },
          -- Не показывать файлы из .gitignore / node_modules / etc
          file_ignore_patterns = { "%.git/", "node_modules/", "vendor/" },
        },
      })

      telescope.load_extension("fzf")

      local map = vim.keymap.set

      map("n", "<leader>ff", "<cmd>Telescope find_files<cr>",   { desc = "Найти файл" })
      map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>",    { desc = "Поиск по проекту" })
      map("n", "<leader>fb", "<cmd>Telescope buffers<cr>",      { desc = "Открытые буферы" })
      map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>",     { desc = "Недавние файлы" })
      map("n", "<leader>fc", "<cmd>Telescope grep_string<cr>",  { desc = "Найти слово под курсором" })
      map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>",    { desc = "Справка Neovim" })
    end,
  },
}
