-- Colorscheme: noctis-minimus
-- A dark, low-saturation theme ported from the VS Code noctis family.
-- All variants use underscores: noctis_minimus, noctis_uva, noctis_bordo, etc.

---@module 'lazy'
---@type LazySpec
return {
  'talha-akram/noctis.nvim',
  priority = 1000,
  config = function()
    vim.cmd.colorscheme 'noctis_minimus'
  end,
}
