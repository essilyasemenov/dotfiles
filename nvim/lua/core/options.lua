  local opt = vim.opt

  -- Нумерация строк
  opt.number = true          -- показывает номера строк
  opt.relativenumber = true  -- номера относительно текущей строки (удобно для прыжков: 5j, 12k)

  -- Табуляция и отступы
  opt.tabstop = 4        -- ширина символа Tab = 4 пробела
  opt.shiftwidth = 4     -- ширина отступа при >> и <<
  opt.expandtab = true   -- заменяет Tab на пробелы (стандарт в Go — gofmt всё равно форматирует)
  opt.smartindent = true -- автоотступ при переходе на новую строку

  -- Внешний вид
  opt.termguicolors = true   -- включает 24-bit RGB цвета (нужен для тем и плагинов)
  opt.signcolumn = "yes"     -- всегда показывает колонку слева (для git-знаков и LSP-ошибок)
  opt.cursorline = true      -- подсвечивает строку с курсором
  opt.scrolloff = 8          -- держит 8 строк сверху/снизу от курсора при скролле
  opt.wrap = false           -- не переносит длинные строки

  -- Поиск
  opt.ignorecase = true  -- поиск без учёта регистра...
  opt.smartcase = true   -- ...но если есть заглавные — учитывает регистр
  opt.hlsearch = false   -- не подсвечивает все совпадения после поиска
  opt.incsearch = true   -- показывает совпадения в реальном времени при вводе

  -- Разделители и буферы
  opt.splitright = true  -- новое вертикальное окно открывается справа
  opt.splitbelow = true  -- новое горизонтальное окно открывается снизу
  opt.swapfile = false   -- отключает .swapfile (раздражающие файлы-артефакты)

  -- Системный буфер обмена
  opt.clipboard = "unnamedplus"  -- Ctrl+C/Ctrl+V работают между Neovim и системой

  -- Производительность
  opt.updatetime = 250  -- как быстро Neovim реагирует на изменения (для LSP-подсказок)

  -- PATH: добавляем Go инструменты (gopls, dlv, gomodifytags и др.)
  -- нужно явно, т.к. Neovim не всегда наследует PATH из шелла
  vim.env.PATH = vim.env.PATH .. ":/usr/local/go/bin:" .. vim.fn.expand("~/go/bin")

  -- Отключаем неиспользуемые провайдеры (убирает предупреждения в :checkhealth)
  vim.g.loaded_python3_provider = 0
  vim.g.loaded_ruby_provider    = 0
  vim.g.loaded_perl_provider    = 0
  vim.g.loaded_node_provider    = 0
