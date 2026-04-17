---@type LazySpec
return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  opts = {
    preset = 'modern',
    spec = {
      { '<leader>c', group = '[C]ode' },
      { '<leader>d', group = '[D]ocument' },
      { '<leader>h', group = 'Git [H]unk' },
      { '<leader>m', group = '[M]odel' },
      { '<leader>r', group = '[R]ename' },
      { '<leader>s', group = '[S]earch' },
      { '<leader>t', group = '[T]oggle' },
      { '<leader>w', group = '[W]indow' },
    },
  },
  keys = {
    {
      '<leader>?',
      function()
        require('which-key').show({ global = false })
      end,
      desc = 'Buffer-local keymaps (which-key)',
    },
  },
}
