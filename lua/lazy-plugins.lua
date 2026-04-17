--- Plugin registry. Bootstraps `lazy.nvim` if missing, then loads each spec
--- under `lua/plugins/`.

-- Bootstrap lazy.nvim {{{
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)
-- }}}

-- Plugin specs {{{
require('lazy').setup({
  require 'plugins.treesitter',
  require 'plugins.autopairs',
  require 'plugins.gitsigns',
  require 'plugins.which-key',
  require 'plugins.telescope',
  require 'plugins.conform',
  require 'plugins.lazydev',
  require 'plugins.completion',
  require 'plugins.zen',
  require 'plugins.indent_line',
  require 'plugins.neo-tree',
  require 'plugins.comment',
  -- require 'plugins.debug',
  'evanleck/vim-svelte',
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
-- }}}
