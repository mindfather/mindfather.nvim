--- Editor options. Colorscheme applied only under Neovide.

if vim.g.neovide then
  vim.g.neovide_theme = 'auto'
  vim.opt.termguicolors = true
  vim.cmd.colorscheme 'monokai-pro-ristretto'
else
  vim.opt.termguicolors = false
end

vim.opt.autoindent = true
vim.opt.breakindent = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.history = 5000
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.inccommand = 'split'
vim.opt.laststatus = 1
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.shiftwidth = 2
vim.opt.showmode = false
vim.opt.signcolumn = 'yes'
vim.opt.smartcase = true
vim.opt.softtabstop = 2
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 2
vim.opt.timeoutlen = 300
vim.opt.undofile = true
vim.opt.updatetime = 250
vim.opt.wrap = false
