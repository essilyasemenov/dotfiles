return {
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gdiffsplit", "Gvdiffsplit" },
    keys = {
      { "<leader>gg", "<cmd>Git<cr>",              desc = "Git status" },
      { "<leader>gc", "<cmd>Git commit<cr>",        desc = "Git commit" },
      { "<leader>gp", "<cmd>Git push<cr>",          desc = "Git push" },
      { "<leader>gP", "<cmd>Git pull<cr>",          desc = "Git pull" },
      { "<leader>gl", "<cmd>Git log --oneline<cr>", desc = "Git log" },
      { "<leader>gd", "<cmd>Gdiffsplit<cr>",        desc = "Git diff файла" },
      { "<leader>gb", "<cmd>Git blame<cr>",         desc = "Git blame" },
      { "<leader>gs", function()
        require("telescope.builtin").git_branches({ pattern = "--no-remotes" })
      end, desc = "Git switch branch" },
      { "<leader>gS", ":Git switch -c ",                 desc = "Git new branch" },
      { "<leader>gm", function()
        require("telescope.builtin").git_branches({
          prompt_title = "Merge branch",
          pattern = "--no-remotes",
          attach_mappings = function(_, map)
            map("i", "<CR>", function(prompt_bufnr)
              local selection = require("telescope.actions.state").get_selected_entry(prompt_bufnr)
              require("telescope.actions").close(prompt_bufnr)
              vim.cmd("Git merge " .. selection.value)
            end)
            return true
          end,
        })
      end, desc = "Git merge" },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add          = { text = "▎" },
          change       = { text = "▎" },
          delete       = { text = "" },
          topdelete    = { text = "" },
          changedelete = { text = "▎" },
          untracked    = { text = "▎" },
        },

        -- Blame строки справа — по умолчанию выключен, включается через keymap
        current_line_blame = false,
        current_line_blame_opts = {
          delay = 300,
          virt_text_pos = "eol",
        },

        on_attach = function(bufnr)
          local gs   = package.loaded.gitsigns
          local map  = vim.keymap.set
          local opts = { buffer = bufnr }

          -- Навигация по hunks (изменённым блокам)
          map("n", "]h", gs.next_hunk, vim.tbl_extend("force", opts, { desc = "Следующий hunk" }))
          map("n", "[h", gs.prev_hunk, vim.tbl_extend("force", opts, { desc = "Предыдущий hunk" }))

          -- Работа с изменениями
          map("n", "<leader>hs", gs.stage_hunk,   vim.tbl_extend("force", opts, { desc = "Stage hunk" }))
          map("n", "<leader>hr", gs.reset_hunk,   vim.tbl_extend("force", opts, { desc = "Reset hunk" }))
          map("n", "<leader>hu", gs.undo_stage_hunk, vim.tbl_extend("force", opts, { desc = "Undo stage hunk" }))
          map("n", "<leader>hS", gs.stage_buffer, vim.tbl_extend("force", opts, { desc = "Stage весь файл" }))
          map("n", "<leader>hR", gs.reset_buffer, vim.tbl_extend("force", opts, { desc = "Reset весь файл" }))

          -- Просмотр
          map("n", "<leader>hp", gs.preview_hunk, vim.tbl_extend("force", opts, { desc = "Preview hunk" }))
          map("n", "<leader>hd", gs.diffthis,     vim.tbl_extend("force", opts, { desc = "Diff файла" }))

          -- Blame
          map("n", "<leader>hb", gs.blame_line, vim.tbl_extend("force", opts, { desc = "Blame строки" }))
          map("n", "<leader>hB", function()
            gs.blame_line({ full = true })
          end, vim.tbl_extend("force", opts, { desc = "Blame (полный коммит)" }))

          -- Включить/выключить inline blame для всего файла
          map("n", "<leader>ht", gs.toggle_current_line_blame,
            vim.tbl_extend("force", opts, { desc = "Toggle inline blame" }))
        end,
      })
    end,
  },
}
