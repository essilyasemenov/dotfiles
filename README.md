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

### Основные

| Клавиша | Действие |
|---------|----------|
| `<C-s>` | Сохранить файл |
| `jk` | Выйти из режима вставки |
| `<Esc>` | Убрать подсветку поиска |
| `<Tab>` | Следующий буфер |
| `<S-Tab>` | Предыдущий буфер |
| `<Leader>x` | Закрыть буфер |
| `<C-h/j/k/l>` | Навигация между окнами |
| `J / K` (visual) | Переместить строки вниз / вверх |
| `< / >` (visual) | Отступ (остаёмся в visual mode) |
| `p` (visual) | Вставить без потери буфера обмена |

### LSP

| Клавиша | Действие |
|---------|----------|
| `gd` | Перейти к определению |
| `gD` | Перейти к декларации |
| `gi` | Перейти к реализации |
| `gr` | Показать ссылки (references) |
| `K` | Документация (hover) |
| `<Leader>rn` | Переименовать символ |
| `<Leader>ca` | Code action |
| `<Leader>e` | Показать диагностику |
| `[d / ]d` | Предыдущая / следующая ошибка |

### Автодополнение

| Клавиша | Действие |
|---------|----------|
| `<C-j/k>` | Навигация по списку |
| `<Tab>` | Следующий пункт / раскрыть сниппет |
| `<S-Tab>` | Предыдущий пункт / назад по сниппету |
| `<CR>` | Подтвердить выбор |
| `<C-Space>` | Вызвать дополнение вручную |
| `<C-e>` | Закрыть дополнение |
| `<C-b/f>` | Прокрутка документации |

### Telescope

| Клавиша | Действие |
|---------|----------|
| `<Leader>ff` | Найти файл |
| `<Leader>fg` | Поиск по проекту (live grep) |
| `<Leader>fb` | Открытые буферы |
| `<Leader>fr` | Недавние файлы |
| `<Leader>fc` | Найти слово под курсором |
| `<Leader>fh` | Справка Neovim |
| `<Leader>ft` | Найти TODO в проекте |

Внутри Telescope:

| Клавиша | Действие |
|---------|----------|
| `<C-j/k>` | Навигация по результатам |
| `<C-q>` | Отправить в quickfix list |
| `<Esc>` | Закрыть |

### Проводник

| Клавиша | Действие |
|---------|----------|
| `<Leader>n` | Открыть/закрыть файловое дерево |
| `<Leader>N` | Показать текущий файл в дереве |

### Git (Neogit)

| Клавиша | Действие |
|---------|----------|
| `<Leader>gg` | Открыть Neogit |

Внутри буфера Neogit:

| Клавиша | Действие |
|---------|----------|
| `s` | Stage файл/hunk |
| `u` | Unstage |
| `x` | Отменить изменения (discard) |
| `c` | Commit |
| `P` | Push |
| `p` | Pull |
| `b` | Ветки (switch, create, delete) |
| `m` | Merge |
| `Z` | Stash |
| `l` | Лог |
| `d` | Diff |
| `Tab` | Развернуть/свернуть секцию |
| `q` | Закрыть Neogit |

### Git (Gitsigns)

| Клавиша | Действие |
|---------|----------|
| `]h / [h` | Следующий / предыдущий hunk |
| `<Leader>hs` | Stage hunk |
| `<Leader>hr` | Reset hunk |
| `<Leader>hu` | Undo stage hunk |
| `<Leader>hS` | Stage весь файл |
| `<Leader>hR` | Reset весь файл |
| `<Leader>hp` | Preview hunk |
| `<Leader>hd` | Diff файла |
| `<Leader>hb` | Blame строки |
| `<Leader>hB` | Blame (полный коммит) |
| `<Leader>ht` | Toggle inline blame |

### Отладка

| Клавиша | Действие |
|---------|----------|
| `<F5>` | Запустить / продолжить |
| `<F10>` | Шаг через (step over) |
| `<F11>` | Шаг внутрь (step into) |
| `<F12>` | Шаг наружу (step out) |
| `<Leader>db` | Поставить/убрать брейкпоинт |
| `<Leader>dB` | Условный брейкпоинт |
| `<Leader>dr` | Перезапустить сессию |
| `<Leader>dq` | Остановить отладку |
| `<Leader>du` | Открыть/закрыть UI отладчика |
| `<Leader>de` | Вычислить выражение |
| `<Leader>dt` | Отладить тест под курсором |
| `<Leader>dl` | Повторить последний тест |

### Тесты

| Клавиша | Действие |
|---------|----------|
| `<Leader>tr` | Запустить тест под курсором |
| `<Leader>tR` | Запустить все тесты в файле |
| `<Leader>ts` | Панель тестов (toggle) |
| `<Leader>to` | Вывод теста |
| `<Leader>tO` | Панель вывода (toggle) |
| `<Leader>tS` | Остановить тесты |
| `<Leader>td` | Отладить тест через DAP |
| `]t / [t` | Следующий / предыдущий провалившийся тест |

### Терминал

| Клавиша | Действие |
|---------|----------|
| `<C-\>` | Открыть/закрыть плавающий терминал |
| `<Esc>` | Выйти из режима терминала |

### Буферы

| Клавиша | Действие |
|---------|----------|
| `<Leader>1–5` | Перейти к буферу по номеру |

### Go (только в .go файлах)

| Клавиша | Действие |
|---------|----------|
| `<Leader>cj` | Добавить json-теги к структуре |
| `<Leader>cy` | Добавить yaml-теги к структуре |
| `<Leader>cJ` | Убрать json-теги |
| `<Leader>ce` | Вставить `if err != nil` |
| `<Leader>ci` | Реализовать интерфейс |
| `<Leader>cm` | `go mod tidy` |

### Surround

| Клавиша | Пример | Результат |
|---------|--------|-----------|
| `ysiw"` | `word` → `"word"` | Обернуть в кавычки |
| `ds"` | `"word"` → `word` | Убрать кавычки |
| `cs"'` | `"word"` → `'word'` | Заменить кавычки |

### Форматирование

| Клавиша | Действие |
|---------|----------|
| `<Leader>p` | Форматировать файл / выделение |

Автоформатирование при сохранении: Go (gopls/gofumpt), Lua (stylua).

---

## Шпаргалка по Vim

Подробная шпаргалка по базовым командам Vim/Neovim (движение, редактирование, поиск, регистры, макросы и др.): [NEOVIM_CHEATSHEET.md](NEOVIM_CHEATSHEET.md)
