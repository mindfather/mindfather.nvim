# mindfather.nvim

Personal Neovim configuration. Targets Neovide on macOS. Built on a Colemak-DHm
keyboard layout. Plugin management via `lazy.nvim`. LSP configured natively
without `lspconfig`.

---

## Entry Point

`init.lua` sets `<Space>` as leader, enables Nerd Font glyphs, then loads
modules in this order:

1. `keymaps` — global bindings
2. `autocommands` — yank flash, Neovide tab-cwd
3. `lazy-bootstrap` — clones lazy.nvim if absent
4. `lazy-plugins` — registers all plugin specs
5. `options` — editor settings, colorscheme activation (Neovide only)
6. `lsp` — native LSP setup
7. `colemak` — full layout remap

---

## Directory Structure

```
nvim/
├── colors/
│   └── monokai-pro-ristretto.lua   colorscheme entry point (Neovide)
├── lua/
│   ├── autocommands.lua            yank highlight, Neovide tab-cwd
│   ├── colemak.lua                 Colemak-DHm remap for all modes
│   ├── keymaps.lua                 global bindings, window management
│   ├── lazy-bootstrap.lua          lazy.nvim auto-install
│   ├── lazy-plugins.lua            plugin registry
│   ├── lsp.lua                     native LSP config (no lspconfig)
│   ├── options.lua                 editor options
│   ├── colorscheme/
│   │   └── monokai-pro.lua         ~130 highlight group definitions
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

Configured in `lua/lsp.lua` using `vim.lsp.config` + `vim.lsp.enable` directly.

| Server | Languages | Notable |
|---|---|---|
| `ts_ls` | JS, TS, JSX, TSX | Custom rename handler, source action command, source definition command |
| `lua_ls` | Lua | LuaJIT runtime, `vim` global, code lens + inlay hints |
| `svelte` | Svelte | JS/TS reload workaround on save, `LspMigrateToSvelte5` command |
| `rust_analyzer` | Rust | Cargo workspace root, clippy check, autoformat disabled |

---

## Keyboard Layout

`lua/colemak.lua` remaps the entire Colemak-DHm layout. Key substitutions:

```
QWERTY → Colemak-DHm
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

All remaps apply across normal, visual, and operator-pending modes.

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
