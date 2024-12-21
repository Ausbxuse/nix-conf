local home = vim.fn.expand '$HOME'

local function set_path(file_path)
  local file_stat = vim.loop.fs_stat(file_path)
  local path_variable = file_stat and file_path or nil
  return path_variable
end
return {
  {
    'sphamba/smear-cursor.nvim',
    enabled = false,
    opts = {},
  },
  {
    'folke/noice.nvim',
    config = function()
      require('noice').setup {
        routes = {
          {
            filter = {
              event = 'msg_show',
              any = {
                { find = '%d+L, %d+B' },
                { find = '; after #%d+' },
                { find = '; before #%d+' },
              },
            },
            view = 'mini',
          },
          {
            view = 'split',
            filter = { event = 'msg_show', min_height = 20 },
          },
          {
            filter = { event = 'msg_show', kind = 'search_count' },
            opts = { skip = true },
          },
        },
        views = {
          cmdline_popup = {
            position = {
              row = '45%',
              col = '50%',
            },
            size = {
              width = 'auto',
              height = 'auto',
            },
          },
          popupmenu = {
            relative = 'editor',
            position = {
              row = 8,
              col = '50%',
            },
            size = {
              width = 20,
              height = 10,
            },
            border = {
              style = 'single',
              padding = { 0, 1 },
            },
            win_options = {
              winhighlight = { Normal = 'Normal', FloatBorder = 'DiagnosticInfo' },
            },
          },
        },
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = true, -- add a border to hover docs and signature help
        },
        lsp = {
          override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            ['vim.lsp.util.stylize_markdown'] = true,
            ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
          },
        },
      }
    end,
  },
  { 'rcarriga/nvim-notify' },
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
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    -- dependencies = { 'folke/trouble.nvim' },
    init = function()
      --[[ vim.g.lualine_laststatus = vim.o.laststatus
			if vim.fn.argc(-1) > 0 then
				-- set an empty statusline till lualine loads
				vim.o.statusline = " "
			else
				-- hide the statusline on the starter page
				vim.o.laststatus = 0
			end ]]
    end,
    opts = function()
      -- PERF: we don't need this lualine require madness 🤷
      local lualine_require = require 'lualine_require'
      lualine_require.require = require

      local icons = {
        diagnostics = {
          Error = ' ',
          Warn = ' ',
          Hint = ' ',
          Info = ' ',
        },
        git = {
          added = ' ',
          modified = ' ',
          removed = ' ',
        },
      }

      vim.o.laststatus = vim.g.lualine_laststatus

      local cyan2 = '#89ddff'
      local custom_theme = require 'lualine.themes.auto'
      -- Change the background of lualine_c section for normal mode
      custom_theme.normal.a.fg = '#5fdaff' -- rgb colors are supported
      custom_theme.normal.a.bg = 'NONE' -- rgb colors are supported
      custom_theme.normal.b.fg = '#5fdaff' -- rgb colors are supported
      custom_theme.normal.b.bg = 'NONE' -- rgb colors are supported
      custom_theme.normal.c.fg = '#dfdcd8' -- rgb colors are supported
      custom_theme.normal.c.bg = 'NONE' -- rgb colors are supported

      custom_theme.command.a.bg = 'NONE' -- rgb colors are supported
      custom_theme.command.b.bg = 'NONE' -- rgb colors are supported
      custom_theme.command.a.fg = cyan2 -- rgb colors are supported
      custom_theme.command.b.fg = cyan2 -- rgb colors are supported

      custom_theme.replace.a.bg = '#ff4a00' -- rgb colors are supported
      custom_theme.replace.a.fg = 'NONE' -- rgb colors are supported
      custom_theme.replace.b.fg = '#ff4a00' -- rgb colors are supported
      custom_theme.replace.b.bg = 'NONE' -- rgb colors are supported
      -- custom_theme.replace.c.bg = "#171920" -- rgb colors are supported
      custom_theme.visual.a.fg = '#bd93f9' -- rgb colors are supported
      custom_theme.visual.a.bg = 'NONE' -- rgb colors are supported
      custom_theme.visual.b.fg = '#bd93f9' -- rgb colors are supported
      custom_theme.visual.b.bg = 'NONE' -- rgb colors are supported
      -- custom_theme.visual.c.bg = "#171920" -- rgb colors are supported
      custom_theme.insert.a.fg = '#abe15b' -- rgb colors are supported
      custom_theme.insert.a.bg = 'NONE' -- rgb colors are supported
      custom_theme.insert.b.fg = '#abe15b' -- rgb colors are supported
      custom_theme.insert.b.bg = 'NONE' -- rgb colors are supported
      -- custom_theme.insert.c.bg = "#171920" -- rgb colors are supported

      local function getWords()
        if vim.bo.filetype == 'md' or vim.bo.filetype == 'txt' or vim.bo.filetype == 'markdown' then
          if vim.fn.wordcount().visual_words == 1 then
            return tostring(vim.fn.wordcount().visual_words) .. ' word'
          elseif not (vim.fn.wordcount().visual_words == nil) then
            return tostring(vim.fn.wordcount().visual_words) .. ' words'
          else
            return tostring(vim.fn.wordcount().words) .. ' words'
          end
        else
          return ''
        end
      end
      local opts = {
        options = {
          icons_enabled = true,
          -- component_separators = { left = "", right = "" },
          -- section_separators = { left = "", right = "" },
          component_separators = { left = ' ', right = ' ' },
          section_separators = { left = ' ', right = ' ' },
          theme = custom_theme,
          globalstatus = false,
          disabled_filetypes = { statusline = { 'dashboard', 'alpha', 'starter' } },
        },
        sections = {
          lualine_a = {
            {
              'mode',
              -- icon = "",
              icon = '',

              -- fmt = trunc(200, 4, nil, true),
              fmt = function(str)
                return ''
              end,
              padding = { left = 0, right = 0 },
            },

            -- { "windows", mode = 2 },
            -- { "windows", mode = 2 },
            --[[ {
						"buffers",
						buffers_color = {
							-- Same values as the general color option can be used here.
							active = Util.ui.fg("ModeMsg"),
							inactive = Util.ui.fg("MiniCursorword"),
						},
						mode = 0,
						padding = { left = 0, right = 0 },
					}, ]]
          },

          lualine_b = {},

          lualine_c = {
            -- Util.lualine.root_dir(),
            -- { 'filetype', icon_only = true, separator = '', padding = { left = 1, right = 0 } },
            -- { Util.lualine.pretty_path() },
            {
              -- getMyCwd,
              'filename',
              -- color = Util.ui.fg("ModeMsg"),
              file_status = true,
              path = 1,
              shorting_target = 30,

              symbols = {
                modified = '🤯', -- Text to show when the file is modified.
                readonly = '🚫', -- Text to show when the file is non-modifiable or readonly.
                unnamed = '', -- Text to show for unnamed buffers.
                newfile = '', -- Text to show for new created file before first writting
              },
              padding = { left = 1, right = 0 },
            },
            -- { 'filesize', padding = { left = 0, right = 0 } },
            {
              'branch',
              icon = '',
              color = { fg = cyan2 }, -- Set branch color to rose
              -- separator = { right = " ", left = " " },
              padding = { left = 0, right = 0 }, -- Adjust the right padding to 1 },
            },

            {
              'diagnostics',
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
          },
          lualine_x = {
            {
              function()
                return require('noice').api.status.command.get()
              end,
              cond = function()
                return package.loaded['noice'] and require('noice').api.status.command.has()
              end,
              color = { fg = '#9ece6a' },
              -- color = Util.ui.fg("Special"),
            },
            {
              function()
                return require('noice').api.status.mode.get()
              end,
              cond = function()
                return package.loaded['noice'] and require('noice').api.status.mode.has()
              end,
              color = { fg = '#9ece6a' },
            },
            {
              function()
                return '  ' .. require('dap').status()
              end,
              cond = function()
                return package.loaded['dap'] and require('dap').status() ~= ''
              end,
              color = { fg = '#333333', bg = '#dfdcd8' },
            },
            { 'searchcount' },
            {
              require('lazy.status').updates,
              cond = require('lazy.status').has_updates,
              color = { fg = '#333333', bg = '#dfdcd8' },
            },

            {
              getWords,
              color = { fg = '#333333', bg = '#dfdcd8' },
              separator = { left = '', right = '' },
            },
          },

          lualine_y = {
            {
              'diff',
              symbols = {
                added = icons.git.added,
                modified = icons.git.modified,
                removed = icons.git.removed,
              },
              source = function()
                local gitsigns = vim.b.gitsigns_status_dict
                if gitsigns then
                  return {
                    added = gitsigns.added,
                    modified = gitsigns.changed,
                    removed = gitsigns.removed,
                  }
                end
              end,
            },
          },
          lualine_z = {
            {
              'progress',
              separator = { left = '', right = '' },
            },
          },
        },
        extensions = { 'neo-tree', 'lazy' },
      }

      return opts
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
