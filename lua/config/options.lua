-- [[ Options ]]
-- See `:help vim.o`

vim.g.have_nerd_font = true

-- Line numbers
vim.o.number = true
-- vim.o.relativenumber = true

-- Enable mouse mode (useful for resizing splits)
vim.o.mouse = 'a'

-- Don't show the mode (it's in the statusline)
vim.o.showmode = false

-- Sync clipboard between OS and Neovim
vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)

-- Enable break indent
vim.o.breakindent = true

-- Persistent undo history
vim.o.undofile = true

-- Case-insensitive searching unless \C or capital letters used
vim.o.ignorecase = true
vim.o.smartcase = true

-- Always show the sign column
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- New splits go right and below
vim.o.splitright = true
vim.o.splitbelow = true

-- Whitespace characters display
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Live preview of substitutions
vim.o.inccommand = 'split'

-- Highlight current line
vim.o.cursorline = true

-- Keep cursor away from screen edges
vim.o.scrolloff = 10

-- Prompt to save instead of failing on unsaved changes
vim.o.confirm = true
