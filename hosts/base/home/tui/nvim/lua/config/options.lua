local opt = vim.opt
local home = vim.fn.expand '$HOME'

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true
vim.schedule(function() -- Schedule decreases startup time,
  opt.clipboard = 'unnamedplus'
end)

local default_options = {
  laststatus = 0, -- global statusline
  spellfile = '$HOME/.config/nvim/spell/en.utf-8.add',
  number = true,
  relativenumber = true,
  mouse = 'a',
  showmode = false,
  breakindent = true,
  undofile = true,
  ignorecase = true,
  smartcase = true,
  signcolumn = 'yes',
  updatetime = 250,
  -- Decrease mapped sequence wait time,
  -- Displays which-key popup sooner,
  timeoutlen = 300,
  splitright = true,
  splitbelow = true,
  list = true,
  listchars = { tab = '» ', trail = '·', nbsp = '␣' },
  -- Preview substitutions live, as you type!,
  inccommand = 'nosplit',
  cursorline = true,
  scrolloff = 10,
  fillchars = 'eob: ',
  backup = false, -- creates a backup file
  cmdheight = 1, -- more space in the neovim command line for displaying messages
  completeopt = { 'menuone', 'noselect' },
  -- conceallevel = 0, -- so that `` is visible in markdown files
  fileencoding = 'utf-8', -- the encoding written to a file
  -- foldmethod = "expr", -- folding, set to "expr" for treesitter based folding
  -- foldexpr = "nvim_treesitter#foldexpr()", -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
  -- foldminlines       = 5,
  foldlevel = 999,
  guifont = 'JetBrains Mono:h10', -- the font used in graphical neovim applications
  hidden = true, -- required to keep multiple buffers and open multiple buffers
  hlsearch = true, -- highlight all matches on previous search pattern
  pumheight = 10, -- pop up menu height
  showtabline = 0, -- always show tabs
  swapfile = false, -- creates a swapfile
  termguicolors = true, -- set term gui colors (most terminals support this)
  -- timeoutlen = 500, -- time to wait for a mapped sequence to complete (in milliseconds)
  title = true, -- set the title of window to the value of the titlestring
  -- opt.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
  undodir = home .. '/.cache/nvim/undo', -- set an undo directory
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = false, -- convert tabs to spaces
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  tabstop = 2, -- insert 2 spaces for a tab
  numberwidth = 4, -- set number column width to 2 {default 4}
  wrap = true, -- display long lines with wrap
  wrapmargin = 0,
  linebreak = true,
  spell = false,
  spelllang = 'en',
  sidescrolloff = 8,
  pumblend = 20,
  winblend = 00, -- keep notify transparent
  textwidth = 0,
  colorcolumn = '', -- fixes indentline for now
} ---  VIM ONLY COMMANDS  ---cmd "filetype plugin on"cmd('let &titleold="' .. TERMINAL .. '"')cmd "set inccommand=split"cmd "set iskeyword+=-"

---  SETTINGS  ---

opt.shortmess:append 'c'
opt.iskeyword:append '-'

for k, v in pairs(default_options) do
  vim.opt[k] = v
end
