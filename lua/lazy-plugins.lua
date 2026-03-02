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
  'evanleck/vim-svelte'
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
