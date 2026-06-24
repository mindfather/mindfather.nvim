--- apple-notes.nvim — local development spec.
---
--- Workspace lives at ~/Developer/apple-notes-neovim/ (plugin and grammar
--- as siblings). Keep colemak + default_keymaps on for this user; override
--- parser_path to the dev-build location since the plugin's own
--- parser/applenote.so won't be populated until the lazy build hook runs
--- (which we skip in dev — make is run manually in the grammar repo).

---@type LazySpec
return {
  dir = vim.fn.expand('~/Developer/apple-notes-neovim/apple-notes.nvim'),
  name = 'apple-notes.nvim',
  ft = 'applenote',
  cmd = {
    'NoteNew', 'NoteOpen', 'NotePicker', 'NoteGrep',
    'NoteRefresh', 'NoteRefreshAll', 'NoteDelete',
    'NoteMove',
    'NoteFolderCreate', 'NoteFolderRename', 'NoteFolderDelete',
  },
  keys = {
    { '<leader>nn', '<cmd>NoteNew<cr>',                 desc = '[N]ew [N]ote' },
    { '<leader>nf', '<cmd>NotePicker<cr>',              desc = '[N]otes [F]ind' },
    { '<leader>ng', '<cmd>NoteGrep<cr>',                desc = '[N]otes [G]rep' },
    { '<leader>nr', '<cmd>NoteRefresh<cr>',             desc = '[N]otes [R]efresh' },
    { '<leader>nR', '<cmd>NoteRefreshAll<cr>',          desc = '[N]otes [R]efresh all' },
    { '<leader>nm', '<cmd>NoteMove<cr>',                desc = '[N]otes [M]ove folder' },
    { '<leader>nd', '<cmd>NoteDelete<cr>',              desc = '[N]otes [D]elete' },
    { '<leader>nh', '<cmd>checkhealth apple-notes<cr>', desc = '[N]otes [H]ealth' },
  },
  opts = {
    colemak = true,
    default_keymaps = true,
    parser_path = vim.fn.expand('~/Developer/apple-notes-neovim/tree-sitter-applenote/parser.so'),
  },
  config = function(_, opts) require('apple-notes').setup(opts) end,
}
