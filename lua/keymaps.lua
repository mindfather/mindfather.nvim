vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.get_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.get_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set(
  'n',
  '<leader>e',
  vim.diagnostic.open_float,
  { desc = 'Show diagnostic [E]rror messages' }
)
vim.keymap.set(
  'n',
  '<leader>q',
  vim.diagnostic.setloclist,
  { desc = 'Open diagnostic [Q]uickfix list' }
)

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use n to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use e to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use i to move!!"<CR>')

vim.keymap.set('n', '<leader>ww', '<C-w>w', { desc = 'Move focus to the next window' })
vim.keymap.set('n', '<leader>wp', '<C-w>p', { desc = 'Move focus to the previous window' })
vim.keymap.set('n', '<leader>ws', '<C-w>s', { desc = 'Split window horizontally' })
vim.keymap.set('n', '<leader>wv', '<C-w>v', { desc = 'Split window vertically' })
vim.keymap.set('n', '<leader>wd', '<C-w>q', { desc = 'Close current window' })
vim.keymap.set('n', '<leader>wo', '<C-w>o', { desc = 'Close all windows except current' })
vim.keymap.set('n', '<leader>w=', '<C-w>=', { desc = 'Make all windows equal size' })
vim.keymap.set('n', '<leader>w-', '<C-w>-', { desc = 'Decrease window height' })
vim.keymap.set('n', '<leader>w+', '<C-w>+', { desc = 'Increase window height' })
vim.keymap.set('n', '<leader>w<', '<C-w><', { desc = 'Decrease window width' })
vim.keymap.set('n', '<leader>w>', '<C-w>>', { desc = 'Increase window width' })
vim.keymap.set('n', '<leader>wh', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<leader>wn', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<leader>we', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<leader>wi', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<leader>wH', '<C-w>H', { desc = 'Move window to far left' })
vim.keymap.set('n', '<leader>wN', '<C-w>J', { desc = 'Move window to bottom' })
vim.keymap.set('n', '<leader>wE', '<C-w>K', { desc = 'Move window to top' })
vim.keymap.set('n', '<leader>wI', '<C-w>L', { desc = 'Move window to far right' })
vim.keymap.set('n', '<leader>wr', '<C-w>r', { desc = 'Rotate windows downwards/rightwards' })
vim.keymap.set('n', '<leader>wR', '<C-w>R', { desc = 'Rotate windows upwards/leftwards' })
vim.keymap.set('n', '<leader>wx', '<C-w>x', { desc = 'Exchange current window with next one' })
vim.keymap.set('n', '<leader>wz', '<C-w>z', { desc = 'Close preview window' })
vim.keymap.set('n', '<leader>w|', '<C-w>|', { desc = 'Max out the width of the current window' })
vim.keymap.set('n', '<leader>w_', '<C-w>_', { desc = 'Max out the height of the current window' })

-- Reload Lua configuration
vim.keymap.set('n', '<leader>R', function()
  vim.cmd('source ' .. vim.fn.stdpath 'config' .. '/init.lua')
  print 'Reloaded configuration'
end, { desc = 'Reload Lua configuration' })
