-- UI plugins: bufferline, mini (ai, surround, statusline), indent-blankline

---@module 'lazy'
---@type LazySpec
return {

  -- VS Code-style buffer tabs across the top
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'famiu/bufdelete.nvim', -- close buffer without destroying the window layout
    },
    event = 'VimEnter',
    keys = {
      -- NOTE: Tab/S-Tab intentionally shadow vim tag-stack navigation.
      -- This is an accepted trade-off for buffer cycling (VS Code muscle memory).
      { '<Tab>', '<cmd>BufferLineCycleNext<CR>', desc = 'Next buffer' },
      { '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>', desc = 'Prev buffer' },
      {
        '<leader>x',
        function() require('bufdelete').bufdelete(0, false) end,
        desc = 'Close buffer',
      },
      {
        '<leader>X',
        function()
          for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            if vim.api.nvim_buf_is_valid(buf) and not vim.bo[buf].modified then
              vim.api.nvim_buf_delete(buf, {})
            end
          end
        end,
        desc = 'Close all saved buffers',
      },
    },
    opts = {
      options = {
        mode = 'buffers',
        numbers = 'none',
        close_command = function(bufnum) require('bufdelete').bufdelete(bufnum, false) end,
        right_mouse_command = function(bufnum) require('bufdelete').bufdelete(bufnum, false) end,
        indicator = { style = 'icon', icon = '▎' },
        buffer_close_icon = '󰅖',
        close_icon = '',
        show_close_icon = true,
        show_buffer_close_icons = true,
        diagnostics = 'nvim_lsp',
        diagnostics_indicator = function(count, level)
          local icon = level:match 'error' and ' ' or ' '
          return ' ' .. icon .. count
        end,
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'File Explorer',
            highlight = 'Directory',
            separator = true,
          },
        },
        separator_style = 'slant',
        show_tab_indicators = true,
      },
    },
  },

  -- Collection of small independent modules
  {
    'nvim-mini/mini.nvim',
    config = function()
      -- Enhanced text objects: va), yinq, ci', etc.
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/change surroundings: saiw), sd', sr)'
      require('mini.surround').setup()

      -- Statusline: branch | filename | E/W counts | filetype | line:col
      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = vim.g.have_nerd_font }

      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function() return '%2l:%-2v' end

      ---@diagnostic disable-next-line: duplicate-set-field
      MiniStatusline.active = function()
        local mode, mode_hl = statusline.section_mode { trunc_width = 120 }
        local git = statusline.section_git { trunc_width = 75 }
        local filename = statusline.section_filename { trunc_width = 140 }
        local fileinfo = statusline.section_fileinfo { trunc_width = 120 }
        local location = statusline.section_location()

        local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
        local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
        local diag = ''
        if errors > 0 then diag = diag .. ' E:' .. errors end
        if warnings > 0 then diag = diag .. ' W:' .. warnings end

        return statusline.combine_groups {
          { hl = mode_hl, strings = { mode } },
          { hl = 'MiniStatuslineDevinfo', strings = { git } },
          '%<',
          { hl = 'MiniStatuslineFilename', strings = { filename } },
          '%=',
          { hl = 'MiniStatuslineFileinfo', strings = { diag ~= '' and diag or nil, fileinfo } },
          { hl = mode_hl, strings = { location } },
        }
      end
    end,
  },

  -- Indentation guide lines
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
  },
}
