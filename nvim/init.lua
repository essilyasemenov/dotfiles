  -- Импорты
  require("core.options")
  require("core.keymaps")

  -- Bootstrap lazy.nvim
  -- Проверяет установлен ли lazy.nvim, если нет — клонирует с GitHub
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git", "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable",
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)

  -- Запуск lazy.nvim
  -- "plugins" означает: смотри все .lua файлы в lua/plugins/
  require("lazy").setup("plugins", {
    checker = {
      enabled = true,   -- автоматически проверяет обновления плагинов
      notify = false,   -- но не уведомляет каждый раз при старте
    },
    change_detection = {
      notify = false,   -- не уведомлять при изменении конфига
    },
    rocks = {
      enabled = false,  -- luarocks не используется, отключаем
    },
  })
