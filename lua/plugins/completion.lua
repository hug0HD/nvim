-- Completion: blink.cmp + LuaSnip + friendly-snippets
-- Copilot source is wired here; the copilot plugin itself lives in copilot.lua

---@module 'lazy'
---@type LazySpec
return {
  {
    'saghen/blink.cmp',
    event = 'VimEnter',
    version = '1.*',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        version = '2.*',
        build = (function()
          -- Regex support build step — skipped on Windows or without make
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then return end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          -- Community snippet collection: React, TS, C#, Python, Go, etc.
          {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load()
            end,
          },
        },
        opts = {},
      },
    },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        -- 'default': <c-y> to accept, <c-n>/<c-p> to navigate, <c-e> to hide
        -- Tab/S-Tab move between snippet expansion nodes (insert mode only)
        preset = 'default',
      },
      appearance = {
        nerd_font_variant = 'mono',
      },
      completion = {
        documentation = { auto_show = false, auto_show_delay_ms = 500 },
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'copilot' },
        providers = {
          -- Copilot suggestions appear in the completion menu alongside LSP items.
          -- Requires `:Copilot auth` on first use.
          -- async = true means auth failures won't block the completion menu.
          copilot = {
            name = 'copilot',
            module = 'blink-cmp-copilot',
            score_offset = 100,
            async = true,
          },
        },
      },
      snippets = { preset = 'luasnip' },
      fuzzy = { implementation = 'lua' },
      signature = { enabled = true },
    },
  },
}
