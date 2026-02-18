return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,  -- закрыть Neovim если neo-tree — последнее окно

        window = {
          width = 30,
          mappings = {
            ["<space>"] = "none",   -- не занимать leader key внутри neo-tree
          },
        },

        filesystem = {
          filtered_items = {
            hide_dotfiles   = false,  -- показывать .gitignore, .env и т.д.
            hide_gitignored = false,
          },
          follow_current_file = {
            enabled = true,           -- auto-reveal текущий файл в дереве
          },
        },
      })

      vim.keymap.set("n", "<leader>n", "<cmd>Neotree toggle<cr>", { desc = "Файловое дерево" })
      vim.keymap.set("n", "<leader>N", "<cmd>Neotree reveal<cr>", { desc = "Показать файл в дереве" })
    end,
  },
}
