--- rust-analyzer config. Resolves to the cargo workspace root (not just the
--- nearest Cargo.toml) so member crates share a single analyzer instance.

---@type vim.lsp.Config
return {
  filetypes = { 'rust' },
  cmd = { 'rust-analyzer' },
  workspace_required = true,
  ---@param buf integer
  ---@param cb fun(path: string?)
  root_dir = function(buf, cb)
    local root = vim.fs.root(buf, { 'Cargo.toml', 'rust-project.json' })
    local out = vim.system({ 'cargo', 'metadata', '--no-deps', '--format-version', '1' }, { cwd = root }):wait()
    if out.code ~= 0 then
      return cb(root)
    end

    local ok, result = pcall(vim.json.decode, out.stdout)
    if ok and result.workspace_root then
      return cb(result.workspace_root)
    end

    return cb(root)
  end,
  settings = {
    autoformat = false,
    ['rust-analyzer'] = {
      check = { command = 'clippy' },
    },
  },
}
