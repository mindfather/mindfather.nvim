# mindfather.nvim

Personal Neovim configuration. Targets Neovide on macOS. Built on a Colemak
keyboard layout. Plugin management via `lazy.nvim`. LSP configured natively
without `lspconfig`.

---

## Entry Point

`init.lua` sets `<Space>` as leader, enables Nerd Font glyphs, then loads
modules in this order:

1. `keymaps` — global bindings
2. `autocommands` — yank flash, Neovide tab-cwd
3. `lazy-plugins` — bootstraps lazy.nvim and registers plugin specs
4. `options` — editor settings, colorscheme activation (Neovide only)
5. `lsp` — native LSP setup
6. `colemak` — layout remap

---

## Directory Structure

```
nvim/
├── colors/
│   └── monokai-pro-ristretto.lua   colorscheme entry point (Neovide)
├── lua/
│   ├── autocommands.lua            yank highlight, Neovide tab-cwd
│   ├── colemak.lua                 Colemak remap (normal/visual/op/select)
│   ├── keymaps.lua                 global bindings, window management
│   ├── lazy-plugins.lua            plugin registry (bootstraps lazy.nvim)
│   ├── lsp.lua                     diagnostics, capabilities, LspAttach, server loop
│   ├── options.lua                 editor options
│   ├── colorscheme/
│   │   └── monokai-pro.lua         ~130 highlight group definitions
│   ├── lsp/
│   │   └── servers/
│   │       ├── ts_ls.lua
│   │       ├── lua_ls.lua
│   │       ├── sourcekit_lsp.lua
│   │       ├── svelte.lua
│   │       └── rust_analyzer.lua
│   └── plugins/
│       ├── autopairs.lua
│       ├── comment.lua
│       ├── completion.lua          blink.cmp
│       ├── conform.lua             formatter dispatch
│       ├── debug.lua               nvim-dap (disabled)
│       ├── gitsigns.lua
│       ├── indent_line.lua
│       ├── lazydev.lua
│       ├── neo-tree.lua
│       ├── telescope.lua
│       ├── treesitter.lua
│       ├── which-key.lua
│       └── zen.lua
├── .github/
│   ├── workflows/stylua.yml        StyLua CI (inert outside kickstart repo)
│   └── ISSUE_TEMPLATE/bug_report.md
├── .stylua.toml
├── init.lua
└── README.md
```

---

## Plugins

| Plugin | Purpose |
|---|---|
| `nvim-treesitter` | Syntax parsing; auto-installs grammars |
| `nvim-autopairs` | Auto-close brackets and quotes |
| `gitsigns.nvim` | Gutter hunk signs; `<leader>h*` actions |
| `which-key.nvim` | Keymap popup; group labels for leader sequences |
| `telescope.nvim` + fzf-native + ui-select | Fuzzy finder; `<leader>s*` bindings |
| `conform.nvim` | Formatter dispatch; `<leader>f`; autoformat on save |
| `lazydev.nvim` | Lua LSP annotations for Neovim API |
| `blink.cmp` | Completion engine; Colemak-aware nav |
| `friendly-snippets` | Snippet collection (blink.cmp source) |
| `zen-mode.nvim` | Distraction-free mode; `<leader>Z` |
| `indent-blankline.nvim` | Indent guides with scope highlight |
| `neo-tree.nvim` | Float file tree; `\` to toggle; Colemak nav |
| `Comment.nvim` | `gcc`/`gcb` toggle comments |
| `vim-svelte` | Svelte syntax and indentation |
| `nvim-dap` + nvim-dap-view | DAP client (currently disabled) |

---

## LSP Servers

Configured via `vim.lsp.config` + `vim.lsp.enable`. Each server lives in its
own file under `lua/lsp/servers/`; `lua/lsp.lua` loads them in a single loop.

| Server | Languages | Notable |
|---|---|---|
| `ts_ls` | JS, TS, JSX, TSX | Custom rename handler, source action command, source definition command, deno-aware root |
| `lua_ls` | Lua | LuaJIT runtime, `vim` global, code lens + inlay hints |
| `sourcekit_lsp` | Swift | Package.swift root, watched-files support |
| `svelte` | Svelte | JS/TS reload workaround on save, `LspMigrateToSvelte5` command |
| `rust_analyzer` | Rust | Cargo workspace root, clippy check, autoformat disabled |

### LSP Keymaps (set by `LspAttach`)

| LHS | Action |
|---|---|
| `grd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `grr` | References |
| `gy` | Type definition |
| `E` | Hover (Colemak — replaces `K`) |
| `<C-s>` (insert) | Signature help |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |

---

## Keyboard Layout

`lua/colemak.lua` remaps Colemak in normal, visual, operator-pending, and
select modes via `vim.keymap.set` in `''` mode. Insert and command-line
modes are intentionally untouched.

```
physical key → executes Vim action
n → j    (down)
e → k    (up)
i → l    (right)
k → n    (next search)
u → i    (insert)
l → u    (undo)
f → e    (word end)
t → f    (find char)
j → t    (to char)
```

Uppercase variants follow the same pattern. Author custom keymaps using
the Colemak label on the LHS — multi-key sequences (`<leader>wn`, `gd`, …)
match before the single-key swaps fire.

---

## Colorscheme

`monokai-pro-ristretto` — warm dark palette (deep reds and browns). Activates
only under Neovide via `options.lua`. The palette drives ~130 highlight groups
covering editor chrome, Treesitter captures, LSP semantic tokens, diagnostics,
GitSigns, Telescope, Which-Key, Neo-tree, Indent Blankline, and Blink.cmp.

---

## Formatting

`.stylua.toml` governs Lua formatting. `conform.nvim` dispatches:

| Filetype | Formatter |
|---|---|
| Lua | stylua |
| Rust | rustfmt |
| HTML, CSS, JS, TS, JSON | prettierd (fallback: prettier) |

Autoformat on save disabled for C, C++, and JavaScript.
