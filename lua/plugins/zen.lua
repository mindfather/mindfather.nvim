return {
  'folke/zen-mode.nvim',
  keys = {
    { '<leader>Z', '<cmd>ZenMode<cr>', desc = '[Z]en Mode' }
  },
  opts = {
    window = {
      backdrop = 0.95,
      width = 120,
      height = 1,
      options = {
        signcolumn = "no",    -- disable signcolumn
        cursorline = false,   -- disable cursorline
        cursorcolumn = false, -- disable cursor column
        foldcolumn = "0",     -- disable fold column
        list = false,         -- disable whitespace characters
      },
    },
    plugins = {
      gitsigns = { enabled = true }
    },
  },
}
