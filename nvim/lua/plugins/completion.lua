return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      -- Источники дополнений
      "hrsh7th/cmp-nvim-lsp",    -- от gopls
      "hrsh7th/cmp-buffer",      -- слова из открытых буферов
      "hrsh7th/cmp-path",        -- пути к файлам

      -- Сниппеты
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
          -- Загружаем готовые сниппеты (Go, Lua, и т.д.)
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },
      "saadparwaiz1/cmp_luasnip", -- источник: LuaSnip → cmp
    },

    config = function()
      local cmp     = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        -- Внешний вид
        window = {
          completion    = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },

        mapping = cmp.mapping.preset.insert({
          -- Навигация по списку
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),

          -- Скролл документации в popup
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),

          -- Открыть дополнение вручную
          ["<C-Space>"] = cmp.mapping.complete(),

          -- Закрыть
          ["<C-e>"] = cmp.mapping.abort(),

          -- Подтвердить выбор
          -- select=false: Enter подтверждает только если пункт выбран вручную
          ["<CR>"] = cmp.mapping.confirm({ select = false }),

          -- Tab: если открыт список — выбрать следующий,
          --      если сниппет активен — перейти к следующему placeholder-у
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),

        -- Порядок и приоритет источников
        sources = cmp.config.sources({
          { name = "nvim_lsp", priority = 1000 },  -- gopls — первый
          { name = "luasnip",  priority = 750 },   -- сниппеты — второй
          { name = "buffer",   priority = 500 },   -- слова из буфера
          { name = "path",     priority = 250 },   -- пути к файлам
        }),

        -- Как отображается каждый пункт в списке
        formatting = {
          format = function(entry, item)
            -- Метка источника справа
            local source_labels = {
              nvim_lsp = "[LSP]",
              luasnip  = "[Snip]",
              buffer   = "[Buf]",
              path     = "[Path]",
            }
            item.menu = source_labels[entry.source.name] or ""
            return item
          end,
        },
      })
    end,
  },
}
