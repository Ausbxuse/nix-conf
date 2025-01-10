local home = vim.fn.expand '$HOME'

local function set_path(file_path)
  local file_stat = vim.loop.fs_stat(file_path)
  local path_variable = file_stat and file_path or nil
  return path_variable
end
return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    opts = {
      ensure_installed = {
        'bash',
        'c',
        'diff',
        'html',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'query',
        'vim',
        'vimdoc',
        'python',
        'cpp',
        'just',
        'nix',
        'tmux',
        'yaml',
        'comment',
      },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
        disable = { 'gitcommit', 'latex' },
        language_tree = true,
        is_supported = function()
          if vim.fn.strwidth(vim.fn.getline '.') > 300 or vim.fn.getfsize(vim.fn.expand '%') > 1024 * 1024 then
            return false
          else
            return true
          end
        end,
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
  },
  { 'folke/zen-mode.nvim' },
  {
    'brenoprata10/nvim-highlight-colors',
    config = function()
      require('nvim-highlight-colors').setup {
        enable_named_colors = false,
        enable_short_hex = false,
      }
    end,
  },
  {
    'ausbxuse/snappy.nvim',
    priority = 2000, -- Make sure to load this before all the other start plugins.
    dir = set_path(home .. '/src/public/snappy.nvim'),
    init = function()
      vim.cmd.colorscheme 'snappy'
    end,
    config = function()
      require('snappy').setup()
    end,
  },
}
