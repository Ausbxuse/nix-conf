return {
  ---@type LazySpec
  {
    'mikavilpas/yazi.nvim',
    event = 'VeryLazy',
    keys = {
      {
        '<leader>N',
        '<cmd>Yazi<cr>',
        desc = 'Open yazi at the current file',
      },
      {
        '<leader>n',
        '<cmd>Yazi cwd<cr>',
        desc = "Open the file manager in nvim's working directory",
      },
    },
    ---@type YaziConfig
    opts = {
      open_for_directories = true,
      keymaps = {
        show_help = '<f1>',
      },
    },
    config = function(_, opts)
      require('yazi').setup(opts)
    end,
  },
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    vscode = true,
    opts = {
      labels = '0123456789abcdef',
      -- labels = "asdfghjklqwertyuiopzxcvbnm",
      jump = {
        jumplist = false,
        nohlsearch = true,
        autojump = true,
      },
      label = {
        uppercase = false,
        reuse = 'none',
      },
      modes = {
        -- `f`, `F`, `t`, `T`, `;` and `,` motions
        char = {
          enabled = true,
          autohide = true,
          jump_labels = true,
          jump = {
            autojump = true,
          },
          multi_line = false,
          labels = '0123456789',
          highlight = { backdrop = false },
        },
      },
      highlight = {
        backdrop = false,
      },
    },
		-- stylua: ignore
		keys = {
			{ "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
			{ "S",     mode = { "n", "o", "x" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
			{ "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
			{ "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
			{ "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
		},
  },
  { 'mbbill/undotree' },
  {
    'echasnovski/mini.surround',
    enabled = true,
    config = function()
      require('mini.surround').setup {
        mappings = {
          add = 'gsa', -- Add surrounding in Normal and Visual modes
          delete = 'gsd', -- Delete surrounding
          find = 'gsf', -- Find surrounding (to the right)
          find_left = 'gsF', -- Find surrounding (to the left)
          highlight = 'gsh', -- Highlight surrounding
          replace = 'gsr', -- Replace surrounding
          update_n_lines = 'gsn', -- Update `n_lines`
        },
      }
    end,
  },
  {
    'b3nj5m1n/kommentary',
    config = function()
      vim.g.kommentary_create_default_mappings = false
      vim.api.nvim_set_keymap('n', 'gl', '<Plug>kommentary_line_default', {})
      vim.api.nvim_set_keymap('n', 'gc', '<Plug>kommentary_motion_default', {})
      vim.api.nvim_set_keymap('v', 'gl', '<Plug>kommentary_visual_default<C-c>', {})
    end,
  },
}
