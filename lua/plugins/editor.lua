-- Editor plugins: treesitter, autopairs, guess-indent

---@module 'lazy'
---@type LazySpec
return {

  -- Syntax highlighting, indentation, and code navigation
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    branch = 'main',
    config = function()
      local parsers = {
        'bash', 'c', 'c_sharp', 'css', 'diff', 'go', 'html',
        'javascript', 'json', 'lua', 'luadoc', 'markdown', 'markdown_inline',
        'python', 'query', 'tsx', 'typescript', 'vim', 'vimdoc', 'yaml',
      }
      require('nvim-treesitter').install(parsers)
      vim.api.nvim_create_autocmd('FileType', {
        callback = function(args)
          local buf, filetype = args.buf, args.match
          local language = vim.treesitter.language.get_lang(filetype)
          if not language then return end
          if not vim.treesitter.language.add(language) then return end
          vim.treesitter.start(buf, language)
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },

  -- Auto-close brackets, quotes, etc.
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {
      check_ts = true, -- use treesitter for smarter pair detection
    },
  },

  -- Automatically detect indentation from the file
  { 'NMAC427/guess-indent.nvim', opts = {} },
}
