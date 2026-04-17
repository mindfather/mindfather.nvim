--- Colemak layout remap.
---
--- Strategy: per-key `vim.keymap.set` in `''` mode (normal + visual + operator-pending
--- + select). Insert and command-line modes are intentionally untouched so typing
--- text and Ex commands behave as your physical Colemak keys read.
---
--- Authoring keymaps elsewhere: write the LHS using the **Colemak label** of the key
--- you want to press. Multi-key sequences (`<leader>wn`, `gd`, etc.) match before
--- the single-key remaps below fire, so they work as written.
---
--- Plugin caveat: any plugin that defines a buffer-local map on `n/e/i/k/u/l/f/t/j`
--- (or their uppercase) shadows these global remaps inside its buffer. Override the
--- plugin's mappings to restore Colemak motion — see `lua/plugins/neo-tree.lua` for
--- the canonical pattern.

--- Bind `colemak_key` to execute `vim_action` in normal/visual/op-pending/select.
---@param colemak_key string  Physical Colemak label (LHS)
---@param vim_action string   QWERTY-named Vim action (RHS, noremap)
local function swap(colemak_key, vim_action)
  vim.keymap.set('', colemak_key, vim_action, { noremap = true })
end

-- down
swap('n', 'j')
swap('N', 'J')
-- up
swap('e', 'k')
swap('E', 'K')
-- right
swap('i', 'l')
swap('I', 'L')
-- next search match
swap('k', 'n')
swap('K', 'N')
-- insert mode
swap('u', 'i')
swap('U', 'I')
-- undo
swap('l', 'u')
swap('L', 'U')
-- word end
swap('f', 'e')
swap('F', 'E')
-- find char forward
swap('t', 'f')
swap('T', 'F')
-- to (till) char
swap('j', 't')
swap('J', 'T')
