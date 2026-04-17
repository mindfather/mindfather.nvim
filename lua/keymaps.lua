--- Global keymaps. LHS is authored in Colemak letters — see `lua/colemak.lua`.

-- Misc {{{
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlight' })
-- }}}

-- Diagnostics {{{
vim.keymap.set('n', '[d', vim.diagnostic.get_prev, { desc = 'Previous [D]iagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.get_next, { desc = 'Next [D]iagnostic' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Diagnostic [Q]uickfix list' })
-- }}}

-- Terminal {{{
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
-- }}}

-- Arrow-key training {{{
vim.keymap.set('n', '<Left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<Down>', '<cmd>echo "Use n to move!!"<CR>')
vim.keymap.set('n', '<Up>', '<cmd>echo "Use e to move!!"<CR>')
vim.keymap.set('n', '<Right>', '<cmd>echo "Use i to move!!"<CR>')
-- }}}

-- Window suite {{{
vim.keymap.set('n', '<leader>ww', '<C-w>w', { desc = 'Focus next window' })
vim.keymap.set('n', '<leader>wp', '<C-w>p', { desc = 'Focus previous window' })
vim.keymap.set('n', '<leader>ws', '<C-w>s', { desc = 'Split horizontally' })
vim.keymap.set('n', '<leader>wv', '<C-w>v', { desc = 'Split vertically' })
vim.keymap.set('n', '<leader>wd', '<C-w>q', { desc = 'Close current window' })
vim.keymap.set('n', '<leader>wo', '<C-w>o', { desc = 'Close all but current' })
vim.keymap.set('n', '<leader>w=', '<C-w>=', { desc = 'Equalize window sizes' })
vim.keymap.set('n', '<leader>w-', '<C-w>-', { desc = 'Decrease window height' })
vim.keymap.set('n', '<leader>w+', '<C-w>+', { desc = 'Increase window height' })
vim.keymap.set('n', '<leader>w<', '<C-w><', { desc = 'Decrease window width' })
vim.keymap.set('n', '<leader>w>', '<C-w>>', { desc = 'Increase window width' })
vim.keymap.set('n', '<leader>w|', '<C-w>|', { desc = 'Maximize window width' })
vim.keymap.set('n', '<leader>w_', '<C-w>_', { desc = 'Maximize window height' })
-- Directional focus / move use Colemak letters on the LHS.
vim.keymap.set('n', '<leader>wh', '<C-w><C-h>', { desc = 'Focus left window' })
vim.keymap.set('n', '<leader>wn', '<C-w><C-j>', { desc = 'Focus lower window' })
vim.keymap.set('n', '<leader>we', '<C-w><C-k>', { desc = 'Focus upper window' })
vim.keymap.set('n', '<leader>wi', '<C-w><C-l>', { desc = 'Focus right window' })
vim.keymap.set('n', '<leader>wH', '<C-w>H', { desc = 'Move window far left' })
vim.keymap.set('n', '<leader>wN', '<C-w>J', { desc = 'Move window to bottom' })
vim.keymap.set('n', '<leader>wE', '<C-w>K', { desc = 'Move window to top' })
vim.keymap.set('n', '<leader>wI', '<C-w>L', { desc = 'Move window far right' })
vim.keymap.set('n', '<leader>wr', '<C-w>r', { desc = 'Rotate windows down/right' })
vim.keymap.set('n', '<leader>wR', '<C-w>R', { desc = 'Rotate windows up/left' })
vim.keymap.set('n', '<leader>wx', '<C-w>x', { desc = 'Exchange window with next' })
vim.keymap.set('n', '<leader>wz', '<C-w>z', { desc = 'Close preview window' })
-- }}}

-- Reload {{{
vim.keymap.set('n', '<leader>R', function()
  vim.cmd('source ' .. vim.fn.stdpath 'config' .. '/init.lua')
  print 'Reloaded configuration'
end, { desc = '[R]eload configuration' })
-- }}}
