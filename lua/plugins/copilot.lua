-- GitHub Copilot
-- Copilot's native ghost text / panel UI is disabled.
-- Suggestions surface through blink.cmp instead (see completion.lua).
-- First-time setup: run :Copilot auth

---@module 'lazy'
---@type LazySpec
return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    opts = {
      suggestion = { enabled = false }, -- blink-cmp-copilot handles display
      panel = { enabled = false },
      filetypes = {
        markdown = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
      },
    },
    keys = {
      { '<leader>tc', '<cmd>lua require("copilot.suggestion").toggle_auto_trigger()<CR>', desc = '[T]oggle [C]opilot' },
    },
  },
  {
    'giuxtaposition/blink-cmp-copilot',
    dependencies = { 'zbirenbaum/copilot.lua' },
  },
}
