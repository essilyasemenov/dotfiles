# dotfiles

Neovim configuration for Go backend development.

**Stack:** lazy.nvim · gopls · nvim-dap + Delve · neotest · telescope · neogit · heather.nvim

---

## Quick Start

```bash
git clone git@github.com:essilyasemenov/dotfiles.git ~/dotfiles
cd ~/dotfiles
make install
```

Then open Neovim and run `:Lazy sync` to install plugins.

> **Requires:** [Homebrew](https://brew.sh) and [Go](https://go.dev/dl) installed before running `make install`.

---

## What `make install` does

| Step | Command | What it installs |
|------|---------|-----------------|
| 1 | `make deps` | neovim, ripgrep, fd, stylua |
| 2 | `make tools` | gopls, dlv, gomodifytags, impl, gotests, gofumpt |
| 3 | `make link` | symlinks `~/dotfiles/nvim` → `~/.config/nvim` |

Run steps individually if needed:

```bash
make deps    # system packages only
make tools   # Go tools only
make link    # symlink only
make update  # update Go tools
```

---

## Plugins

| Plugin | Purpose |
|--------|---------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager |
| [heather.nvim](https://github.com/essilyasemenov/heather.nvim) | Colorscheme |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) + gopls | LSP (Go) |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) + LuaSnip | Autocomplete |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Format on save |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder |
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | File explorer |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git integration |
| [nvim-dap](https://github.com/mfussenegger/nvim-dap) + nvim-dap-go | Debugger |
| [neotest](https://github.com/nvim-neotest/neotest) + neotest-go | Test runner |
| [neogit](https://github.com/NeogitOrg/neogit) | Git client (Magit-style) |
| [diffview.nvim](https://github.com/sindrets/diffview.nvim) | Git diff viewer |
| [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) | Floating terminal |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | Buffer tabs |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Status line |
| [gopher.nvim](https://github.com/olexsmir/gopher.nvim) | Go tools (tags, impl, err) |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Keybinding hints |
| [nvim-surround](https://github.com/kylechui/nvim-surround) | Surround text objects |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Auto brackets |
| [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | Highlight TODOs |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | Indent guides |
| [vim-illuminate](https://github.com/RRethy/vim-illuminate) | Highlight word under cursor |

---

## Keybindings

`<leader>` = Space

### General

| Key | Action |
|-----|--------|
| `<C-s>` | Save file |
| `jk` | Exit insert mode |
| `<Esc>` | Clear search highlight |
| `<Tab>` | Next buffer |
| `<S-Tab>` | Previous buffer |
| `<leader>x` | Close buffer |
| `<C-h/j/k/l>` | Navigate between splits |
| `J / K` (visual) | Move selection down / up |
| `< / >` (visual) | Indent (stay in visual mode) |
| `p` (visual) | Paste without overwriting clipboard |

### LSP

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `gr` | Show references |
| `K` | Hover documentation |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>e` | Show diagnostic |
| `[d / ]d` | Previous / next diagnostic |

### Autocomplete

| Key | Action |
|-----|--------|
| `<C-j/k>` | Navigate completion list |
| `<Tab>` | Next item / expand snippet |
| `<S-Tab>` | Previous item / jump back in snippet |
| `<CR>` | Confirm selection |
| `<C-Space>` | Trigger completion manually |
| `<C-e>` | Close completion |
| `<C-b/f>` | Scroll docs |

### Telescope

| Key | Action |
|-----|--------|
| `<leader>ff` | Find file |
| `<leader>fg` | Live grep |
| `<leader>fb` | Open buffers |
| `<leader>fr` | Recent files |
| `<leader>fc` | Find word under cursor |
| `<leader>fh` | Help tags |
| `<leader>ft` | Find TODOs |

### File Explorer

| Key | Action |
|-----|--------|
| `<leader>n` | Toggle file tree |
| `<leader>N` | Reveal current file in tree |

### Git

| Key | Action |
|-----|--------|
| `<leader>gg` | Open Neogit (all git ops inside) |
| `]h / [h` | Next / previous hunk |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hu` | Undo stage hunk |
| `<leader>hS` | Stage entire file |
| `<leader>hR` | Reset entire file |
| `<leader>hp` | Preview hunk |
| `<leader>hd` | Diff file (gitsigns) |
| `<leader>hb` | Blame line |
| `<leader>hB` | Blame line (full commit) |
| `<leader>ht` | Toggle inline blame |

### Debugger

| Key | Action |
|-----|--------|
| `<F5>` | Start / continue |
| `<F10>` | Step over |
| `<F11>` | Step into |
| `<F12>` | Step out |
| `<leader>db` | Toggle breakpoint |
| `<leader>dB` | Conditional breakpoint |
| `<leader>dr` | Restart session |
| `<leader>dq` | Stop debugging |
| `<leader>du` | Toggle debug UI |
| `<leader>de` | Evaluate expression |
| `<leader>dt` | Debug test under cursor |
| `<leader>dl` | Debug last test |

### Tests

| Key | Action |
|-----|--------|
| `<leader>tr` | Run test under cursor |
| `<leader>tR` | Run all tests in file |
| `<leader>ts` | Toggle test summary panel |
| `<leader>to` | Show test output |
| `<leader>tO` | Toggle output panel |
| `<leader>tS` | Stop tests |
| `<leader>td` | Debug test via DAP |
| `]t / [t` | Next / previous failed test |

### Terminal

| Key | Action |
|-----|--------|
| `<C-\>` | Toggle floating terminal |
| `<Esc>` | Exit terminal mode |

### Buffers

| Key | Action |
|-----|--------|
| `<leader>1-5` | Jump to buffer by number |

### Go (in .go files only)

| Key | Action |
|-----|--------|
| `<leader>cj` | Add json struct tags |
| `<leader>cy` | Add yaml struct tags |
| `<leader>cJ` | Remove json struct tags |
| `<leader>ce` | Insert `if err != nil` |
| `<leader>ci` | Implement interface |
| `<leader>cm` | Run `go mod tidy` |

### Surround

| Key | Example | Result |
|-----|---------|--------|
| `ysiw"` | `word` → `"word"` | Wrap in quotes |
| `ds"` | `"word"` → `word` | Remove quotes |
| `cs"'` | `"word"` → `'word'` | Change quotes |

### Formatting

| Key | Action |
|-----|--------|
| `<leader>p` | Format file / selection |

Auto-formats on save for Go (via gopls/gofumpt) and Lua (via stylua).

---
