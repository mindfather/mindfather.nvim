return {
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  opts = {
    preset = "modern",
    spec = {
      -- { '<leader>c', group = '[C]ode' },
      { '<leader>d', group = '[D]ocument' },
      { '<leader>h', group = 'Git [H]unk' },
      { '<leader>m', group = '[M]odel' },
      { '<leader>r', group = '[R]ename' },
      { '<leader>s', group = '[S]earch' },
      { '<leader>t', group = '[T]oggle' },
      { '<leader>w', group = '[W]indow' },
    }
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
  -- config = function() -- This is the function that runs, AFTER loading
  --   require('which-key').setup()
  --
  --   -- Document existing key chains
  --   require('which-key').add {
  --   }
  -- end,
}
