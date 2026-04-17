--- Native LSP setup. Diagnostic UI, capabilities, the LspAttach keymap autocmd,
--- a server enable loop (configs in `lua/lsp/servers/<name>.lua`), and the
--- LspStart/Stop/Restart/Log/Info user commands.

-- Diagnostics {{{
vim.diagnostic.config {
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = 'minimal',
    border = 'single',
    source = true,
    header = '',
    prefix = '',
    suffix = '',
  },
}
-- }}}

-- Completion-item icons {{{
local icons = {
  Class = ' ',
  Color = ' ',
  Constant = ' ',
  Constructor = ' ',
  Enum = ' ',
  EnumMember = ' ',
  Event = ' ',
  Field = ' ',
  File = ' ',
  Folder = ' ',
  Function = '󰊕 ',
  Interface = ' ',
  Keyword = ' ',
  Method = 'ƒ ',
  Module = '󰏗 ',
  Property = ' ',
  Snippet = ' ',
  Struct = ' ',
  Text = ' ',
  Unit = ' ',
  Value = ' ',
  Variable = ' ',
}

local completion_kinds = vim.lsp.protocol.CompletionItemKind
for i, kind in ipairs(completion_kinds) do
  completion_kinds[i] = icons[kind] and icons[kind] .. kind or kind
end
-- }}}

-- Capabilities {{{
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
  dynamicRegistration = true,
  lineFoldingOnly = true,
}
capabilities.textDocument.semanticTokens.multilineTokenSupport = true
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.lsp.config('*', { capabilities = capabilities })
-- }}}

-- LspAttach: buffer-local keymaps + omnifunc/tagfunc {{{
vim.api.nvim_create_autocmd('LspAttach', {
  ---@param ev { buf: integer, data: { client_id: integer } }
  callback = function(ev)
    local bufnr = ev.buf
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if not client then
      return
    end

    if client.server_capabilities.completionProvider then
      vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
    end
    if client.server_capabilities.definitionProvider then
      vim.bo[bufnr].tagfunc = 'v:lua.vim.lsp.tagfunc'
    end

    -- Disable semantic tokens (treesitter handles highlighting)
    client.server_capabilities.semanticTokensProvider = nil

    --- Buffer-local keymap helper. Mirrors the gitsigns on_attach pattern.
    ---@param mode string|string[]
    ---@param lhs string
    ---@param rhs string|function
    ---@param desc string
    local function map(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
    end

    -- Navigation
    map('n', 'grd', vim.lsp.buf.definition, '[g]oto [d]efinition')
    map('n', 'gD', vim.lsp.buf.declaration, '[g]oto [D]eclaration')
    map('n', 'gi', function()
      vim.lsp.buf.implementation { border = 'single' }
    end, '[g]oto [i]mplementation')
    map('n', 'grr', vim.lsp.buf.references, '[g]oto [r]eferences')
    map('n', 'gy', vim.lsp.buf.type_definition, '[g]oto t[y]pe definition')

    -- Hover / signature
    map('n', 'E', function()
      vim.lsp.buf.hover { border = 'single', max_height = 30, max_width = 120 }
    end, 'Hover documentation')
    map('i', '<C-s>', vim.lsp.buf.signature_help, 'Signature help')

    -- Refactor
    map('n', '<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame symbol')
    map({ 'n', 'x' }, '<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
  end,
})
-- }}}

-- Server enable loop {{{
local servers = { 'ts_ls', 'lua_ls', 'sourcekit_lsp', 'svelte', 'rust_analyzer' }
for _, name in ipairs(servers) do
  vim.lsp.config[name] = require('lsp.servers.' .. name)
  vim.lsp.enable(name)
end
-- }}}

-- User commands: LspStart/Stop/Restart/Log/Info {{{
vim.api.nvim_create_user_command('LspStart', function()
  vim.cmd.e()
end, { desc = 'Start LSP clients in the current buffer' })

vim.api.nvim_create_user_command('LspStop', function(opts)
  for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
    if opts.args == '' or opts.args == client.name then
      client:stop(true)
      vim.notify(client.name .. ': stopped')
    end
  end
end, {
  desc = 'Stop all (or one named) LSP client attached to the current buffer',
  nargs = '?',
  complete = function()
    local names = {}
    for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
      table.insert(names, client.name)
    end
    return names
  end,
})

vim.api.nvim_create_user_command('LspRestart', function()
  local detach_clients = {}
  for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
    client:stop(true)
    if vim.tbl_count(client.attached_buffers) > 0 then
      detach_clients[client.name] = { client, vim.lsp.get_buffers_by_client_id(client.id) }
    end
  end
  local timer = vim.uv.new_timer()
  if not timer then
    return vim.notify('Servers stopped but not restarted')
  end
  timer:start(
    100,
    50,
    vim.schedule_wrap(function()
      for name, client in pairs(detach_clients) do
        local client_id = vim.lsp.start(client[1].config, { attach = false })
        if client_id then
          for _, buf in ipairs(client[2]) do
            vim.lsp.buf_attach_client(buf, client_id)
          end
          vim.notify(name .. ': restarted')
        end
        detach_clients[name] = nil
      end
      if next(detach_clients) == nil and not timer:is_closing() then
        timer:close()
      end
    end)
  )
end, { desc = 'Restart all LSP clients attached to the current buffer' })

vim.api.nvim_create_user_command('LspLog', function()
  vim.cmd.vsplit(vim.lsp.log.get_filename())
end, { desc = 'Open the LSP log file' })

vim.api.nvim_create_user_command('LspInfo', function()
  vim.cmd('silent checkhealth vim.lsp')
end, { desc = 'checkhealth vim.lsp' })
-- }}}
