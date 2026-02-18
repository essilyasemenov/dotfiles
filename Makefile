.PHONY: install link deps tools update help

# ─── Точка входа ─────────────────────────────────────────────────────────────

install: deps tools link
	@echo ""
	@echo "Done. Open nvim and run :Lazy sync to install plugins."

# ─── Симлинк конфига ─────────────────────────────────────────────────────────

link:
	@echo "→ Linking nvim config..."
	@mkdir -p ~/.config
	@if [ -d ~/.config/nvim ] && [ ! -L ~/.config/nvim ]; then \
		echo "  ~/.config/nvim already exists and is not a symlink."; \
		echo "  Back it up first: mv ~/.config/nvim ~/.config/nvim.bak"; \
		exit 1; \
	fi
	@ln -sf $(PWD)/nvim ~/.config/nvim
	@echo "  ~/.config/nvim → $(PWD)/nvim"

# ─── Системные зависимости (brew) ────────────────────────────────────────────

deps:
	@echo "→ Installing system dependencies..."
	@which brew > /dev/null || (echo "Homebrew not found. Install it first: https://brew.sh" && exit 1)
	brew install neovim ripgrep fd lazygit stylua

# ─── Go инструменты ──────────────────────────────────────────────────────────

tools:
	@echo "→ Installing Go tools..."
	@which go > /dev/null || (echo "Go not found. Install it first: https://go.dev/dl" && exit 1)
	go install golang.org/x/tools/gopls@latest
	go install github.com/go-delve/delve/cmd/dlv@latest
	go install github.com/fatih/gomodifytags@latest
	go install github.com/josharian/impl@latest
	go install github.com/cweill/gotests/gotests@latest
	go install mvdan.cc/gofumpt@latest

# ─── Обновление ──────────────────────────────────────────────────────────────

update:
	@echo "→ Updating Go tools..."
	@$(MAKE) tools
	@echo "→ To update nvim plugins, run :Lazy update inside nvim."

# ─── Справка ─────────────────────────────────────────────────────────────────

help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "  install   Full setup: deps + tools + symlink (recommended for new machine)"
	@echo "  link      Symlink nvim config to ~/.config/nvim"
	@echo "  deps      Install system packages via Homebrew"
	@echo "  tools     Install Go development tools"
	@echo "  update    Update Go tools"
