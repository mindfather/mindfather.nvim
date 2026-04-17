-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

---@type LazySpec
return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', { desc = 'NeoTree reveal' } },
  },
  ---@module 'neo-tree'
  ---@type neotree.Config
  opts = {
    close_if_last_window = true,
    window = {
      position = "float",
      mappings = {
        ['\\'] = 'close_window',
        -- Colemak navigation: buffer-local maps shadow global remaps, so we must be explicit
        ['n'] = { function() vim.cmd('normal! j') end, desc = 'move down' }, -- Colemak down
        ['e'] = { function() vim.cmd('normal! k') end, desc = 'move up' }, -- Colemak up
        ['i'] = 'open', -- Colemak right → open/expand
        -- Noop keys displaced by Colemak that trigger wrong neo-tree actions:
        -- j: global j→t (vim till), neo-tree t = open_tabnew
        -- k: global k→n (vim find-next), confusing in tree context
        -- u: global u→i (noremap, vim insert mode), would bypass buffer-local i=open
        ['j'] = 'noop',
        ['k'] = 'noop',
        ['u'] = 'noop',
      },
    },
  },
}
