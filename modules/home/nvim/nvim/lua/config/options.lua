local opt = vim.opt
local home = vim.fn.expand '$HOME'

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local default_options = {
  clipboard = 'unnamedplus',
  statusline = ' %f %m %r %= %k %S %l:%L ',
  spellfile = home .. '/.config/nvim/spell/en.utf-8.add',
  number = true,
  relativenumber = true,
  breakindent = true,
  undofile = true,
  ignorecase = true,
  smartcase = true,
  updatetime = 250,
  timeoutlen = 1000,
  splitright = true,
  splitbelow = true,
  list = true,
  listchars = { tab = '  ', trail = '·', nbsp = '␣' },
  cursorline = true,
  scrolloff = 10,
  fillchars = 'eob: ',
  foldmethod = 'expr',
  foldexpr = 'nvim_treesitter#foldexpr()',
  foldlevel = 999,
  hidden = true, -- required to keep multiple buffers and open multiple buffers
  pumheight = 10, -- pop up menu height
  showtabline = 0, -- always show tabs
  swapfile = false, -- creates a swapfile
  termguicolors = true, -- set term gui colors (most terminals support this)
  undodir = home .. '/.cache/nvim/undo', -- set an undo directory
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true, -- convert tabs to spaces
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  tabstop = 2, -- insert 2 spaces for a tab
  numberwidth = 2, -- set number column width to 2 {default 4}
  signcolumn = 'yes',
  -- statuscolumn = '%l%s',
  wrap = true, -- display long lines with wrap
  linebreak = true,
  spell = false,
  sidescrolloff = 8,
  pumblend = 10,
  winblend = 10, -- keep notify transparent
  colorcolumn = '', -- fixes indentline for now
  shada = "!,'10000,<50,s10,h,:10000",
}

opt.shortmess:append 'c'
opt.iskeyword:append '-'

for k, v in pairs(default_options) do
  vim.opt[k] = v
end
