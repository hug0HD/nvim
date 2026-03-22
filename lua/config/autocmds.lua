-- [[ Autocommands ]]
-- See `:help lua-guide-autocommands`

-- Highlight yanked text briefly
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})

-- ESLint: fix all auto-fixable issues on save, but only if ESLint LSP is attached.
-- (Guard prevents errors when editing JS/TS files without ESLint configured.)
vim.api.nvim_create_autocmd('BufWritePre', {
  desc = 'Run EslintFixAll on save when ESLint LSP is active',
  group = vim.api.nvim_create_augroup('eslint-fix-all', { clear = true }),
  pattern = { '*.ts', '*.tsx', '*.js', '*.jsx' },
  callback = function()
    local clients = vim.lsp.get_clients { name = 'eslint', bufnr = 0 }
    if #clients > 0 then vim.cmd 'EslintFixAll' end
  end,
})
