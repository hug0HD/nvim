# Neovim Keybinds Reference

Leader key: `<Space>`

---

## General

| Key | Mode | Action |
|-----|------|--------|
| `<Esc>` | n | Clear search highlight |
| `<leader>q` | n | Open diagnostic quickfix list |
| `<Esc><Esc>` | t | Exit terminal mode |
| `<C-h/j/k/l>` | n | Move focus between splits |

---

## Files & Buffers

| Key | Mode | Action |
|-----|------|--------|
| `<C-n>` | n | Toggle file explorer (neo-tree) |
| `<Tab>` | n | Next buffer |
| `<S-Tab>` | n | Previous buffer |
| `<leader>x` | n | Close current buffer (keeps window) |
| `<leader>X` | n | Close all saved (unmodified) buffers |

---

## Search (Telescope)

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

---

## LSP (active when language server is attached)

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

---

## Git — Gitsigns (buffer-local)

| Key | Mode | Action |
|-----|------|--------|
| `]c` | n | Next git hunk |
| `[c` | n | Previous git hunk |
| `<leader>hs` | n/v | Stage hunk |
| `<leader>hr` | n/v | Reset hunk |
| `<leader>hS` | n | Stage buffer |
| `<leader>hR` | n | Reset buffer |
| `<leader>hu` | n | Undo stage hunk |
| `<leader>hp` | n | Preview hunk |
| `<leader>hb` | n | Blame line |
| `<leader>hd` | n | Diff against index |
| `<leader>hD` | n | Diff against last commit |
| `<leader>tb` | n | Toggle inline blame |
| `<leader>tD` | n | Toggle show deleted |

## Git — Fugitive

| Key | Mode | Action |
|-----|------|--------|
| `<leader>gg` | n | Git status (in Fugitive: `s` stage, `cc` commit) |
| `<leader>gd` | n | Git diff split |
| `<leader>gl` | n | Git log (oneline) |
| `<leader>gp` | n | Git push |
| `<leader>gP` | n | Git pull |
| `<leader>gb` | n | Git blame (full file) |

---

## Diagnostics & TODOs (Trouble)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>tt` | n | Toggle workspace diagnostics |
| `<leader>tT` | n | Toggle buffer diagnostics |
| `<leader>ts` | n | Toggle symbols panel |
| `<leader>tq` | n | Toggle quickfix list |
| `<leader>to` | n | Toggle TODO/FIXME list |

---

## Copilot

| Key | Mode | Action |
|-----|------|--------|
| `<leader>tc` | n | Toggle Copilot (first use: `:Copilot auth`) |

---

## Completion (blink.cmp — insert mode)

| Key | Mode | Action |
|-----|------|--------|
| `<C-y>` | i | Accept completion |
| `<C-n>` / `<Down>` | i | Next item |
| `<C-p>` / `<Up>` | i | Previous item |
| `<C-e>` | i | Hide menu |
| `<C-space>` | i | Open menu / show docs |
| `<C-k>` | i | Toggle signature help |
| `<Tab>` / `<S-Tab>` | i | Move between snippet expansion nodes |

---

## Text Objects (mini.ai)

| Key | Action |
|-----|--------|
| `va)` | Select around parenthesis |
| `vi)` | Select inside parenthesis |
| `yinq` | Yank inside next quote |
| `ci'` | Change inside single quote |

## Surroundings (mini.surround)

| Key | Action |
|-----|--------|
| `saiw)` | Add surround around word with `()` |
| `sd'` | Delete surrounding `'` |
| `sr)'` | Replace surrounding `)` with `'` |
