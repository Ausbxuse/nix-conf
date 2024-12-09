local home = vim.fn.expand '$HOME'
return {
  {
    'jvgrootveld/telescope-zoxide',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' },
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
      settings = {
        save_on_toggle = true,
      },
    },
    keys = function()
      local keys = {
        {
          '<leader>H',
          function()
            require('harpoon'):list():add()
          end,
          desc = 'Harpoon File',
        },
        {
          '<leader>h',
          function()
            local harpoon = require 'harpoon'
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          desc = 'Harpoon Quick Menu',
        },
      }

      for i = 1, 5 do
        table.insert(keys, {
          '<leader>' .. i,
          function()
            require('harpoon'):list():select(i)
          end,
          desc = 'Harpoon to File ' .. i,
        })
      end
      return keys
    end,
  },
  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-tree/nvim-web-devicons' },
    },
    config = function()
      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use Telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      -- After running this command, a window will open up and you're able to
      -- type in the prompt window. You'll see a list of `help_tags` options and
      -- a corresponding preview of the help.
      --
      -- Two important keymaps to use while in Telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- Telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        extensions = {
          zoxide = {
            prompt_title = '[ Walking on the shoulders of TJ ]',
            mappings = {
              default = {
                after_action = function(selection)
                  print('Update to (' .. selection.z_score .. ') ' .. selection.path)
                end,
              },
              ['<C-s>'] = {
                before_action = function(selection)
                  print 'before C-s'
                end,
                action = function(selection)
                  vim.cmd.edit(selection.path)
                end,
              },
              -- Opens the selected entry in a new split
              ['<C-q>'] = { action = require('telescope._extensions.zoxide.utils').create_basic_command 'split' },
            },
          },
        },
        defaults = {
          layout_strategy = 'horizontal',

          borderchars = {
            prompt = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
            results = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
            preview = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
          },
          winblend = 10,
          width = 1,
          prompt_prefix = '❯ ',
          selection_caret = ' ',
          sorting_strategy = 'ascending',
          path_display = function(opts, path)
            if path:sub(1, #home) == home then
              path = '~' .. path:sub(#home + 1)
            end
            -- local tail = path:match '([^/]+)$'
            return path
          end,
          preview = false,
          hl_result_eol = true,
          results_title = 'Results',
          prompt_title = 'Prompt',
          border = true,
          layout_config = {
            horizontal = {
              prompt_position = 'top',
              height = 20,
              width = 90,
            },
            vertical = {
              preview_cutoff = 1,
              preview_height = 0.6,
              prompt_position = 'top',
              height = function(_, max_rows, _)
                return max_rows
              end,
              width = function(_, max_columns, _)
                return max_columns
              end,
            },
          },
          -- open files in the first window that is an actual file.
          -- use the current window if no other window is available.
          get_selection_window = function()
            local wins = vim.api.nvim_list_wins()
            table.insert(wins, 1, vim.api.nvim_get_current_win())
            for _, win in ipairs(wins) do
              local buf = vim.api.nvim_win_get_buf(win)
              if vim.bo[buf].buftype == '' then
                return win
              end
            end
            return 0
          end,
          mappings = {
            i = {
              ['<c-enter>'] = 'to_fuzzy_refine',
            },
          },
        },
        pickers = {
          find_files = {
            find_command = function()
              if 1 == vim.fn.executable 'rg' then
                return { 'rg', '--files', '--color', 'never', '-g', '!.git' }
              elseif 1 == vim.fn.executable 'fd' then
                return { 'fd', '--type', 'f', '--color', 'never', '-E', '.git' }
              elseif 1 == vim.fn.executable 'fdfind' then
                return { 'fdfind', '--type', 'f', '--color', 'never', '-E', '.git' }
              elseif 1 == vim.fn.executable 'find' and vim.fn.has 'win32' == 0 then
                return { 'find', '.', '-type', 'f' }
              elseif 1 == vim.fn.executable 'where' then
                return { 'where', '/r', '.', '*' }
              end
            end,
            hidden = true,
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'ui-select')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>cd', require('telescope').extensions.zoxide.list)
      vim.keymap.set('n', '<leader>z', "<cmd> lua require('telescope.builtin').spell_suggest(require('telescope.themes').get_cursor({}))<cr>")
      -- vim.keymap.set('n', '<leader>u', "<cmd>lua require('telescope').extensions.dict.synonyms()<cr>")
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[F]uzzy find [K]eymaps' })
      vim.keymap.set('n', '<leader>ff', function()
        builtin.find_files { previewer = false }
      end, { desc = '[F]uzzy [F]iles' })
      vim.keymap.set('n', '<leader>fs', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>fS', function()
        local word = vim.fn.expand '<cWORD>'
        builtin.grep_string { search = word }
      end, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })
    end,
  },
}
