return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'main',
  -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  -- dependencies = {
  --   {
  --     "nvim-treesitter/nvim-treesitter-textobjects",
  --     branch = "main",
  --     init = function()
  --       -- Disable entire built-in ftplugin mappings to avoid conflicts.
  --       -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
  --       vim.g.no_plugin_maps = true
  --
  --       -- Or, disable per filetype (add as you like)
  --       -- vim.g.no_python_maps = true
  --       -- vim.g.no_ruby_maps = true
  --       -- vim.g.no_rust_maps = true
  --       -- vim.g.no_go_maps = true
  --     end,
  --     config = function()
  --       -- put your config here
  --     end,
  --   }
  -- },
  build = ':TSUpdate',
  opts = {
    ensure_installed = { 'c', 'lua', 'luadoc', 'vim', 'vimdoc' },
    auto_install = true,
    highlight = {
      enable = true,
    },
    indent = { enable = true },
  },
}
