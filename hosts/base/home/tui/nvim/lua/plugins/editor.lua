return {
  {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      provider = 'openai',
      hints = { enabled = false },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = 'make',
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'stevearc/dressing.nvim',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      --- The below dependencies are optional,
      'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
      -- 'zbirenbaum/copilot.lua', -- for providers='copilot'
      {
        -- support for image pasting
        'HakonHarnes/img-clip.nvim',
        event = 'VeryLazy',
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'OXY2DEV/markview.nvim',
        --[[ opts = {
					file_types = { 'markdown', 'Avante' },
				},
				ft = { 'markdown', 'Avante' }, ]]
      },
    },
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
  { 'nvim-treesitter/playground' },
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
