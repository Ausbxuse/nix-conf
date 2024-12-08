local home = vim.fn.expand '$HOME'

local function set_path(file_path)
  local file_stat = vim.loop.fs_stat(file_path)
  local path_variable = file_stat and file_path or nil
  return path_variable
end
return {
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  {
    'shellRaining/hlchunk.nvim',
    enabled = true,
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      chunk = {
        enable = true,
        style = {
          { fg = '#7aa2f7' },
        },
      },
      indent = {
        enable = true,
        chars = { '│' },
      },
    },
  },
  {
    'ausbxuse/snappy.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    dir = set_path(home .. '/src/public/snappy.nvim'),
    init = function()
      vim.cmd.colorscheme 'snappy'
    end,
    config = function()
      require('snappy').setup()
    end,
  },
}
