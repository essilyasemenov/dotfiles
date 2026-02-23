# dotfiles — Neovim для Go

Конфигурация Neovim для Go-бэкенд-разработки.

**Стек:** lazy.nvim · gopls · nvim-dap + Delve · neotest · telescope · neogit · heather.nvim

> **Обозначения:** `<Leader>` = пробел, `C-x` = Ctrl+x, `S-x` = Shift+x

---

## Быстрый старт

### macOS (Homebrew)

```bash
git clone git@github.com:essilyasemenov/dotfiles.git ~/dotfiles
cd ~/dotfiles
make install
```

> **Требуется:** [Homebrew](https://brew.sh) и [Go](https://go.dev/dl) перед запуском `make install`.

### Ubuntu / Debian

```bash
git clone git@github.com:essilyasemenov/dotfiles.git ~/dotfiles
cd ~/dotfiles
make -f Makefile.ubuntu install
```

> **Требуется:** [Go](https://go.dev/dl) перед запуском `make install`.

После запуска открой Neovim и выполни `:Lazy sync` для установки плагинов.

---

## Что делает `make install`

| Шаг | Команда | Что устанавливает |
|-----|---------|-------------------|
| 1 | `make deps` | neovim, ripgrep, fd, stylua (brew на macOS, apt на Ubuntu) |
| 2 | `make tools` | gopls, dlv, gomodifytags, impl, gotests, gofumpt |
| 3 | `make link` | симлинк `~/dotfiles/nvim` → `~/.config/nvim` |

Можно запускать по отдельности:

```bash
# macOS
make deps    # системные пакеты
make tools   # Go-утилиты
make link    # симлинк
make update  # обновить Go-утилиты

# Ubuntu / Debian
make -f Makefile.ubuntu deps
make -f Makefile.ubuntu tools
make -f Makefile.ubuntu link
make -f Makefile.ubuntu update
```

---

## Плагины

### Менеджер плагинов

| Плагин | Назначение |
|--------|------------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Менеджер плагинов |

### Тема

| Плагин | Назначение |
|--------|------------|
| [heather.nvim](https://github.com/essilyasemenov/heather.nvim) | Цветовая схема |

### Синтаксис

| Плагин | Назначение |
|--------|------------|
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Подсветка синтаксиса (tree-sitter) |

### LSP

| Плагин | Назначение |
|--------|------------|
| [mason.nvim](https://github.com/mason-org/mason.nvim) | UI для управления LSP-серверами |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | Конфигурация LSP (gopls) |

### Автодополнение

| Плагин | Назначение |
|--------|------------|
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Движок автодополнения |
| [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) | Источник: LSP |
| [cmp-buffer](https://github.com/hrsh7th/cmp-buffer) | Источник: слова из буферов |
| [cmp-path](https://github.com/hrsh7th/cmp-path) | Источник: пути к файлам |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Движок сниппетов |
| [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) | Источник: LuaSnip → cmp |
| [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) | Готовые сниппеты (Go, Lua и др.) |

### Форматирование

| Плагин | Назначение |
|--------|------------|
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Форматирование при сохранении |

### Поиск

| Плагин | Назначение |
|--------|------------|
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Нечёткий поиск (fuzzy finder) |
| [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) | Нативный fzf-сортировщик для Telescope |

### Проводник

| Плагин | Назначение |
|--------|------------|
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | Файловое дерево |

### Git

| Плагин | Назначение |
|--------|------------|
| [neogit](https://github.com/NeogitOrg/neogit) | Git-клиент (в стиле Magit) |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Знаки изменений, blame, hunks |
| [diffview.nvim](https://github.com/sindrets/diffview.nvim) | Просмотр Git-диффов |

### Отладка

| Плагин | Назначение |
|--------|------------|
| [nvim-dap](https://github.com/mfussenegger/nvim-dap) | Debug Adapter Protocol |
| [nvim-dap-go](https://github.com/leoluz/nvim-dap-go) | Конфигурация DAP для Go (Delve) |
| [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) | UI отладчика (переменные, стек, брейкпоинты) |
| [nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text) | Значения переменных в строках кода |

### Тесты

| Плагин | Назначение |
|--------|------------|
| [neotest](https://github.com/nvim-neotest/neotest) | Фреймворк для запуска тестов |
| [neotest-go](https://github.com/nvim-neotest/neotest-go) | Адаптер neotest для Go |

### Go

| Плагин | Назначение |
|--------|------------|
| [gopher.nvim](https://github.com/olexsmir/gopher.nvim) | Go-утилиты (теги, impl, if err) |

### Терминал

| Плагин | Назначение |
|--------|------------|
| [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) | Плавающий терминал |

### UI

| Плагин | Назначение |
|--------|------------|
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | Табы буферов |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Строка статуса |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | Вертикальные линии отступов |
| [vim-illuminate](https://github.com/RRethy/vim-illuminate) | Подсветка слова под курсором |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Подсказки горячих клавиш |
| [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) | Иконки файлов |

### Редактирование

| Плагин | Назначение |
|--------|------------|
| [nvim-surround](https://github.com/kylechui/nvim-surround) | Работа со скобками/кавычками |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Автозакрытие скобок |
| [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | Подсветка TODO/FIXME/NOTE |

### Утилиты (зависимости)

| Плагин | Назначение |
|--------|------------|
| [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) | Lua-библиотека (telescope, neogit, neotest и др.) |
| [nvim-nio](https://github.com/nvim-neotest/nvim-nio) | Async IO (nvim-dap-ui, neotest) |
| [nui.nvim](https://github.com/MunifTanjim/nui.nvim) | UI-компоненты (neo-tree) |
| [FixCursorHold.nvim](https://github.com/antoinemadec/FixCursorHold.nvim) | Фикс CursorHold (neotest) |

---

## Горячие клавиши

Все горячие клавиши (кастомные + стандартные Vim) собраны в шпаргалке: **[NEOVIM_CHEATSHEET.md](NEOVIM_CHEATSHEET.md)**
