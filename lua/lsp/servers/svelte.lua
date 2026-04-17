--- Svelte language server. Workaround: notifies the server when adjacent JS/TS
--- files are saved so it picks up changes that haven't synced yet
--- (https://github.com/sveltejs/language-tools/issues/2008).

---@type vim.lsp.Config
return {
  cmd = { 'svelteserver', '--stdio' },
  filetypes = { 'svelte' },
  ---@param bufnr integer
  ---@param on_dir fun(path: string?)
  root_dir = function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    -- Svelte LSP only supports the file:// scheme.
    -- https://github.com/sveltejs/language-tools/issues/2777
    if vim.uv.fs_stat(fname) ~= nil then
      local root_markers = { 'package-lock.json', 'yarn.lock', 'pnpm-lock.yaml', 'bun.lockb', 'bun.lock', 'deno.lock' }
      root_markers = vim.fn.has('nvim-0.11.3') == 1 and { root_markers, { '.git' } }
          or vim.list_extend(root_markers, { '.git' })
      local project_root = vim.fs.root(bufnr, root_markers) or vim.fn.getcwd()
      on_dir(project_root)
    end
  end,
  ---@param client vim.lsp.Client
  ---@param bufnr integer
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd('BufWritePost', {
      pattern = { '*.js', '*.ts' },
      group = vim.api.nvim_create_augroup('lspconfig.svelte', {}),
      callback = function(ctx)
        ---@diagnostic disable-next-line: param-type-mismatch
        client:notify('$/onDidChangeTsOrJsFile', { uri = ctx.match })
      end,
    })
    vim.api.nvim_buf_create_user_command(bufnr, 'LspMigrateToSvelte5', function()
      client:exec_cmd({
        title = 'Migrate Component to Svelte 5 Syntax',
        command = 'migrate_to_svelte_5',
        arguments = { vim.uri_from_bufnr(bufnr) },
      })
    end, { desc = 'Migrate Component to Svelte 5 Syntax' })
  end,
}
