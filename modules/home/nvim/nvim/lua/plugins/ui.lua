local home = vim.fn.expand '$HOME'

local function set_path(file_path)
  local file_stat = vim.loop.fs_stat(file_path)
  local path_variable = file_stat and file_path or nil
  return path_variable
end
return {
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  { 'folke/zen-mode.nvim' },
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
      icons = {
        -- set icon mappings to true if you have a Nerd Font
        mappings = true,
        -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
        -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
        keys = {},
      },

      -- Document existing key chains
      spec = {
        { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>r', group = '[R]ename' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      },
    },
  },
  {
    'brenoprata10/nvim-highlight-colors',
    config = function()
      require('nvim-highlight-colors').setup {
        enable_named_colors = false,
      }
    end,
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
