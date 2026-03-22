-- Git: gitsigns (single source of truth) + vim-fugitive

---@module 'lazy'
---@type LazySpec
return {

  -- Git signs in the gutter + hunk navigation/staging keymaps
  {
    'lewis6991/gitsigns.nvim',
    ---@module 'gitsigns'
    ---@type Gitsigns.Config
    ---@diagnostic disable-next-line: missing-fields
    opts = {
      signs = {
        add = { text = '+' }, ---@diagnostic disable-line: missing-fields
        change = { text = '~' }, ---@diagnostic disable-line: missing-fields
        delete = { text = '_' }, ---@diagnostic disable-line: missing-fields
        topdelete = { text = '‾' }, ---@diagnostic disable-line: missing-fields
        changedelete = { text = '~' }, ---@diagnostic disable-line: missing-fields
      },
      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigate between hunks (respects diff mode)
        map('n', ']c', function()
          if vim.wo.diff then vim.cmd.normal { ']c', bang = true }
          else gitsigns.nav_hunk 'next' end
        end, { desc = 'Jump to next git [c]hange' })

        map('n', '[c', function()
          if vim.wo.diff then vim.cmd.normal { '[c', bang = true }
          else gitsigns.nav_hunk 'prev' end
        end, { desc = 'Jump to previous git [c]hange' })

        -- Stage / reset hunks
        map('v', '<leader>hs', function() gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' } end, { desc = 'git [s]tage hunk' })
        map('v', '<leader>hr', function() gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' } end, { desc = 'git [r]eset hunk' })
        map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'git [s]tage hunk' })
        map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'git [r]eset hunk' })
        map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'git [S]tage buffer' })
        map('n', '<leader>hu', gitsigns.stage_hunk, { desc = 'git [u]ndo stage hunk' })
        map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'git [R]eset buffer' })

        -- Inspect / diff
        map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'git [p]review hunk' })
        map('n', '<leader>hb', gitsigns.blame_line, { desc = 'git [b]lame line' })
        map('n', '<leader>hd', gitsigns.diffthis, { desc = 'git [d]iff against index' })
        map('n', '<leader>hD', function() gitsigns.diffthis '@' end, { desc = 'git [D]iff against last commit' })

        -- Toggles
        map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = '[T]oggle git show [b]lame line' })
        map('n', '<leader>tD', gitsigns.preview_hunk_inline, { desc = '[T]oggle git show [D]eleted' })
      end,
    },
  },

  -- Fugitive: git UI for when you want more than the terminal
  -- Workflow: <leader>gg → s to stage, cc to commit, <leader>gp to push
  {
    'tpope/vim-fugitive',
    cmd = { 'Git', 'G', 'Gdiffsplit', 'Gread', 'Gwrite', 'Gblame' },
    keys = {
      { '<leader>gg', '<cmd>Git<CR>', desc = '[G]it status (Fugitive)' },
      { '<leader>gd', '<cmd>Gdiffsplit<CR>', desc = '[G]it [D]iff split' },
      { '<leader>gl', '<cmd>Git log --oneline<CR>', desc = '[G]it [L]og' },
      { '<leader>gp', '<cmd>Git push<CR>', desc = '[G]it [P]ush' },
      { '<leader>gP', '<cmd>Git pull<CR>', desc = '[G]it [P]ull' },
      { '<leader>gb', '<cmd>Git blame<CR>', desc = '[G]it [B]lame' },
    },
  },
}
