if vim.g.neovide then
  vim.api.nvim_create_autocmd('BufReadPost', {
    desc = 'Set tab-local CWD to opened file directory in Neovide',
    group = vim.api.nvim_create_augroup('neovide-tcd', { clear = true }),
    once = true,
    callback = function(ev)
      local bufname = vim.api.nvim_buf_get_name(ev.buf)
      if bufname ~= '' then
        local dir = vim.fn.fnamemodify(bufname, ':p:h')
        vim.cmd('tcd ' .. vim.fn.fnameescape(dir))
      end
    end,
  })
end

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
