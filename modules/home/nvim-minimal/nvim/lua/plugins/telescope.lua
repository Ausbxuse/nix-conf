local home = vim.fn.expand '$HOME'
return {
  {
    'ibhagwan/fzf-lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local fzf = require 'fzf-lua'
      fzf.setup {
        winopts = {
          -- fullscreen=true,
          height = 0.8,
          width = 1,
          -- split = 'below new',
          border = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
          backdrop = 100,
        },
        previewer = {
          border = 'noborder',
        },
        files = {
          previewer = false,
          actions = {
            ['ctrl-g'] = false,
          },
        },
        oldfiles = {
          previewer = false,
        },
        blines = {
          file_icons = false,
          previewer = false,
          show_bufname = false, -- display buffer name
          show_unloaded = false, -- show unloaded buffers
        },
      }

      vim.keymap.set('n', '<leader>sh', fzf.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>fk', fzf.keymaps, { desc = '[F]uzzy find [K]eymaps' })
      vim.keymap.set('n', '<leader>ff', function()
        fzf.files()
      end, { desc = '[F]uzzy [F]iles' })
      vim.keymap.set('n', '<leader>fs', fzf.grep_cword, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>fg', fzf.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>fd', fzf.diagnostics_workspace, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>fS', function()
        fzf.grep_cWORD()
      end, { desc = '[f]ind [S]earch word' })
      vim.keymap.set('n', '<leader>fr', fzf.oldfiles, { desc = '[S]earch Recent Files ' })
      vim.keymap.set('n', '<leader><leader>', fzf.buffers, { desc = '[ ] Find existing buffers' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        fzf.blines()
      end, { desc = '[/] Fuzzily search in current buffer' })
    end,
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
}
