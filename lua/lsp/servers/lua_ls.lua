--- lua-language-server config tuned for Neovim authoring (LuaJIT, vim global,
--- VIMRUNTIME on the workspace library).

---@type vim.lsp.Config
return {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.luarc.json', '.git', vim.uv.cwd() },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = { 'lua/?.lua', 'lua/?/init.lua' },
      },
      diagnostics = {
        globals = { 'vim' },
      },
      codeLens = { enable = true },
      hint = { enable = true, semicolon = 'Disable' },
      telemetry = { enable = false },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
        },
      },
    },
  },
}
