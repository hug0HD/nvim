# nvim config

Personal Neovim config built on top of [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim),
restructured into a modular layout and extended for day-to-day TypeScript/React, C#, Python, Go, and C development.

---

## File Structure

```
init.lua                    ← bootstrap only
lua/
  config/
    options.lua             ← editor settings
    keymaps.lua             ← global keymaps + diagnostic config
    autocmds.lua            ← autocommands (yank highlight, EslintFixAll)
  plugins/
    colorscheme.lua         ← noctis_minimus theme
    ui.lua                  ← bufferline, mini.nvim, indent-blankline
    editor.lua              ← treesitter, autopairs, guess-indent
    lsp.lua                 ← mason, lspconfig, conform, nvim-lint
    completion.lua          ← blink.cmp, LuaSnip, friendly-snippets
    git.lua                 ← gitsigns, vim-fugitive
    tools.lua               ← telescope, which-key, todo-comments, trouble
    copilot.lua             ← GitHub Copilot (via blink.cmp)
    neo-tree.lua            ← file explorer
KEYBINDS.md                 ← full keybind reference (this doc has a summary)
```

---

## Installation

### 1. Install Neovim

Requires Neovim **stable** or **nightly**. Use your package manager or one of the methods below.

<details><summary>Mac (Homebrew)</summary>

```sh
brew install neovim
```
</details>

<details><summary>Ubuntu / Debian</summary>

```sh
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install neovim
```
</details>

<details><summary>Arch</summary>

```sh
sudo pacman -S neovim
```
</details>

<details><summary>Fedora</summary>

```sh
sudo dnf install neovim
```
</details>

<details><summary>Windows (winget)</summary>

```sh
winget install Neovim.Neovim
```
</details>

<details><summary>Version manager (bob) — recommended for always staying current</summary>

```sh
cargo install bob-nvim
bob use stable
```
</details>

---

### 2. Install Dependencies

These need to be on your `PATH` before launching Neovim:

| Dependency | Purpose | Install |
|------------|---------|---------|
| `git` | Plugin manager, lazy.nvim | via package manager |
| `make` | Building telescope-fzf-native | via package manager |
| `ripgrep` | Telescope live grep | `brew install ripgrep` / `apt install ripgrep` |
| `fd` | Telescope file finding | `brew install fd` / `apt install fd-find` |
| `node` / `npm` | TypeScript LSP, prettier | [nodejs.org](https://nodejs.org) or nvm |
| `go` | Go LSP (gopls) | [go.dev](https://go.dev/dl/) |
| `dotnet` | C# LSP (omnisharp) | [dot.net](https://dotnet.microsoft.com/download) |
| `python3` / `pip` | Python LSP (pyright), black | via package manager |
| Nerd Font | Icons throughout the UI | [nerdfonts.com](https://www.nerdfonts.com) — Hack or Fira Code recommended |
| clipboard tool | OS clipboard sync | `xclip` or `xsel` on Linux, built-in on Mac/Windows |

<details><summary>Ubuntu/Debian one-liner</summary>

```sh
sudo apt install make gcc ripgrep fd-find unzip git xclip
```
</details>

<details><summary>Mac one-liner</summary>

```sh
brew install ripgrep fd
```
</details>

<details><summary>Windows (WSL)</summary>

```sh
sudo apt install make gcc ripgrep fd-find unzip git xclip
```
</details>

---

### 3. Clone This Config

Back up any existing config first:
```sh
mv ~/.config/nvim ~/.config/nvim.bak
```

Then clone:
```sh
git clone <your-repo-url> ~/.config/nvim
```

---

### 4. First Launch

```sh
nvim
```

Lazy.nvim will bootstrap itself and install all plugins automatically. This takes a minute or two on first run.

After plugins install, Mason will install all language servers and formatters in the background. Run `:Mason` to check progress.

---

### 5. Copilot Setup (first time only)

```
:Copilot auth
```

Follow the prompt to authenticate with GitHub. Copilot suggestions then appear in the completion menu alongside LSP items.

---

## Language Servers & Formatters

All installed and managed automatically by Mason on first launch.

| Language | LSP | Formatter |
|----------|-----|-----------|
| TypeScript / JS | ts_ls | prettier |
| React / JSX / TSX | ts_ls | prettier |
| ESLint (inline errors) | eslint | — (EslintFixAll on save) |
| C# (.NET Core) | omnisharp | — |
| Python | pyright | black |
| Go | gopls | gofmt |
| Lua | lua_ls | stylua |
| Markdown | — | prettier + markdownlint |
| CSS / HTML / JSON / YAML | — | prettier |

> Prettier auto-detects `.prettierrc` from the project root. ESLint auto-detects `.eslintrc`.

---

## Keybinds

Leader key: `<Space>`

### General

| Key | Mode | Action |
|-----|------|--------|
| `<Esc>` | n | Clear search highlight |
| `<leader>q` | n | Open diagnostic quickfix list |
| `<Esc><Esc>` | t | Exit terminal mode |
| `<C-h/j/k/l>` | n | Move focus between splits |

### Files & Buffers

| Key | Mode | Action |
|-----|------|--------|
| `<C-n>` | n | Toggle file explorer (neo-tree) |
| `<Tab>` | n | Next buffer |
| `<S-Tab>` | n | Previous buffer |
| `<leader>x` | n | Close current buffer (keeps window) |
| `<leader>X` | n | Close all saved buffers |

### Search (Telescope)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>sf` | n | Search files |
| `<leader>sg` | n | Live grep |
| `<leader>sw` | n/v | Search current word |
| `<leader>s.` | n | Search recent files |
| `<leader><leader>` | n | Find open buffers |
| `<leader>/` | n | Fuzzy search current buffer |
| `<leader>s/` | n | Live grep in open files |
| `<leader>sh` | n | Search help tags |
| `<leader>sk` | n | Search keymaps |
| `<leader>ss` | n | Search Telescope builtins |
| `<leader>sc` | n | Search commands |
| `<leader>sd` | n | Search diagnostics |
| `<leader>sr` | n | Resume last search |
| `<leader>sn` | n | Search Neovim config files |

### LSP (active when a language server is attached)

| Key | Mode | Action |
|-----|------|--------|
| `grd` | n | Go to definition |
| `grr` | n | Go to references |
| `gri` | n | Go to implementation |
| `grt` | n | Go to type definition |
| `grn` | n | Rename symbol |
| `gra` | n/x | Code action |
| `grD` | n | Go to declaration |
| `gO` | n | Document symbols |
| `gW` | n | Workspace symbols |
| `<leader>f` | n | Format buffer |
| `<leader>th` | n | Toggle inlay hints |

### Git — Gitsigns

| Key | Mode | Action |
|-----|------|--------|
| `]c` / `[c` | n | Next / previous git hunk |
| `<leader>hs` | n/v | Stage hunk |
| `<leader>hr` | n/v | Reset hunk |
| `<leader>hS` | n | Stage buffer |
| `<leader>hR` | n | Reset buffer |
| `<leader>hp` | n | Preview hunk |
| `<leader>hb` | n | Blame line |
| `<leader>hd` | n | Diff against index |
| `<leader>hD` | n | Diff against last commit |
| `<leader>tb` | n | Toggle inline blame |
| `<leader>tD` | n | Toggle show deleted |

### Git — Fugitive

| Key | Mode | Action |
|-----|------|--------|
| `<leader>gg` | n | Git status (`s` stage, `cc` commit) |
| `<leader>gd` | n | Git diff split |
| `<leader>gl` | n | Git log |
| `<leader>gp` | n | Git push |
| `<leader>gP` | n | Git pull |
| `<leader>gb` | n | Git blame |

### Diagnostics & TODOs (Trouble)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>tt` | n | Toggle workspace diagnostics |
| `<leader>tT` | n | Toggle buffer diagnostics |
| `<leader>ts` | n | Toggle symbols panel |
| `<leader>tq` | n | Toggle quickfix list |
| `<leader>to` | n | Toggle TODO/FIXME list |

### Copilot

| Key | Mode | Action |
|-----|------|--------|
| `<leader>tc` | n | Toggle Copilot |

### Completion (blink.cmp — insert mode)

| Key | Mode | Action |
|-----|------|--------|
| `<C-y>` | i | Accept completion |
| `<C-n>` / `<Down>` | i | Next item |
| `<C-p>` / `<Up>` | i | Previous item |
| `<C-e>` | i | Hide menu |
| `<C-space>` | i | Open menu / show docs |
| `<C-k>` | i | Toggle signature help |
| `<Tab>` / `<S-Tab>` | i | Move between snippet nodes |

### Text Objects & Surroundings

| Key | Action |
|-----|--------|
| `va)` / `vi)` | Select around / inside parenthesis |
| `yinq` | Yank inside next quote |
| `ci'` | Change inside single quote |
| `saiw)` | Surround word with `()` |
| `sd'` | Delete surrounding `'` |
| `sr)'` | Replace surrounding `)` with `'` |

> Full reference: `KEYBINDS.md` in the config root, or `<leader>sn` → search for it.

---

## Useful Commands

| Command | Action |
|---------|--------|
| `:Lazy` | Plugin manager — install, update, check status |
| `:Lazy sync` | Install missing + update all plugins |
| `:Mason` | LSP/formatter installer — check install status |
| `:LspInfo` | Show which LSPs are attached to current buffer |
| `:ConformInfo` | Show which formatters are active for current file |
| `:checkhealth` | Diagnose Neovim and plugin issues |
| `:Copilot auth` | Authenticate Copilot (first time only) |
| `:Telescope colorscheme` | Browse available colorschemes |

---

## Tips

- **Which key:** press `<Space>` and pause — a menu shows all available bindings for that prefix
- **LSP habits to build:** `grd` (go to definition), `grr` (find references), `grn` (rename) — these replace F12/Shift+F12/F2 from VS Code
- **Snippets:** start typing in a `.ts` file and look for snippet items in the completion menu (e.g. `rafce` for a React arrow function component)
- **Trouble:** `<leader>tt` gives you a VS Code-style problems panel across the whole project
- **Fugitive workflow:** `<leader>gg` opens git status, `s` to stage files, `cc` to commit, then `<leader>gp` to push
