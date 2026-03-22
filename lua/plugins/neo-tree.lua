-- Neo-tree: file explorer
-- <C-n> to toggle open/close
-- follow_current_file highlights the active buffer in the tree automatically

---@module 'lazy'
---@type LazySpec
return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '<C-n>', ':Neotree toggle<CR>', desc = 'Toggle NeoTree', silent = true },
  },
  ---@module 'neo-tree'
  ---@type neotree.Config
  opts = {
    close_if_last_window = true,
    filesystem = {
      filtered_items = {
        visible = false,
        hide_dotfiles = true,
        hide_gitignored = true,
        hide_by_name = { 'node_modules', '.git' },
      },
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
    },
    window = {
      position = 'left',
      width = 35,
      mappings = {
        ['<C-n>'] = 'close_window',
      },
    },
    default_component_configs = {
      git_status = {
        symbols = {
          added = '',
          modified = '',
          deleted = '✖',
          renamed = '→',
          untracked = '★',
          ignored = '◌',
          unstaged = '✗',
          staged = '✓',
          conflict = '',
        },
      },
    },
  },
}
