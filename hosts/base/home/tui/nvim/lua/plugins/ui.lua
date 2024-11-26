local home = vim.fn.expand '$HOME'

local function set_path(file_path)
  local file_stat = vim.loop.fs_stat(file_path)
  local path_variable = file_stat and file_path or nil
  return path_variable
end
return {
  {
    'folke/noice.nvim',
    config = function()
      require('noice').setup {
        views = {
          cmdline_popup = {
            position = {
              row = '45%',
              col = '50%',
            },
            size = {
              width = 60,
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
          lsp_doc_border = true,
        },
        lsp = {
          hover = {
            enabled = true,
            silent = false, -- set to true to not show a message if hover is not available
            opts = {
              size = {
                max_height = 10,
                max_width = 40,
              },
            }, -- merged with defaults from documentation
          },
          signature = {
            opts = {
              size = {
                height = 10,
                max_width = 40,
              },
            },
          },
        },
      }
    end,
  },
  { 'rcarriga/nvim-notify' },
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  {
    'hedyhli/outline.nvim',
    enabled = true,
    config = function()
      -- Example mapping to toggle outline
      vim.keymap.set('n', '<leader>o', '<cmd>Outline<CR>', { desc = 'Toggle Outline' })

      require('outline').setup {
        -- Your setup opts here (leave empty to use defaults)
        outline_window = {
          position = 'left',
        },
      }
    end,
  },
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
    'echasnovski/mini.indentscope',
    enabled = false,
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = 'VeryLazy',
    config = function()
      require('mini.indentscope').setup {
        symbol = '▏',
        options = { try_as_border = true },

        draw = {
          -- Delay (in ms) between event and start of drawing scope indicator
          delay = 0,
          -- Animation rule for scope's first drawing. A function which, given
          -- next and total step numbers, returns wait time (in ms). See
          -- |MiniIndentscope.gen_animation| for builtin options. To disable
          -- animation, use `require('mini.indentscope').gen_animation.none()`.
          animation = function()
            return 0
          end,
          -- Symbol priority. Increase to display on top of more symbols.
          priority = 2,
        },
      }
    end,
    init = function()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = {
          'snacks_dashboard',
          'help',
          'alpha',
          'dashboard',
          'neo-tree',
          'Trouble',
          'trouble',
          'lazy',
          'mason',
          'notify',
          'toggleterm',
          'lazyterm',
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    enabled = false,
    config = function()
      require('ibl').setup {
        scope = { enabled = false },
        indent = { char = '▏' },
        exclude = { filetypes = { 'snacks_dashboard' } },
      }
    end,
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    config = function()
      require('ufo').setup {
        provider_selector = function(bufnr, filetype, buftype)
          return { 'treesitter', 'indent' }
        end,
      }
    end,
  },

  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
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
        misc = {
          dots = '󰇘',
        },
        ft = {
          octo = '',
        },
        dap = {
          Stopped = { '󰁕 ', 'DiagnosticWarn', 'DapStoppedLine' },
          Breakpoint = ' ',
          BreakpointCondition = ' ',
          BreakpointRejected = { ' ', 'DiagnosticError' },
          LogPoint = '.>',
        },
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
        kinds = {
          Array = ' ',
          Boolean = '󰨙 ',
          Class = ' ',
          Codeium = '󰘦 ',
          Color = ' ',
          Control = ' ',
          Collapsed = ' ',
          Constant = '󰏿 ',
          Constructor = ' ',
          Copilot = ' ',
          Enum = ' ',
          EnumMember = ' ',
          Event = ' ',
          Field = ' ',
          File = ' ',
          Folder = ' ',
          Function = '󰊕 ',
          Interface = ' ',
          Key = ' ',
          Keyword = ' ',
          Method = '󰊕 ',
          Module = ' ',
          Namespace = '󰦮 ',
          Null = ' ',
          Number = '󰎠 ',
          Object = ' ',
          Operator = ' ',
          Package = ' ',
          Property = ' ',
          Reference = ' ',
          Snippet = ' ',
          String = ' ',
          Struct = '󰆼 ',
          TabNine = '󰏚 ',
          Text = ' ',
          TypeParameter = ' ',
          Unit = ' ',
          Value = ' ',
          Variable = '󰀫 ',
        },
      }

      vim.o.laststatus = vim.g.lualine_laststatus

      local function trunc(trunc_width, trunc_len, hide_width, no_ellipsis)
        return function(str)
          local win_width = vim.fn.winwidth(0)
          if hide_width and win_width < hide_width then
            return ''
          elseif trunc_width and trunc_len and win_width < trunc_width and #str > trunc_len then
            return str:sub(1, trunc_len) .. (no_ellipsis and '' or '...')
          end
          return str
        end
      end

      local function empty()
        return function(str)
          return ''
        end
      end

      local cyan2 = '#89ddff'

      local custom_theme = require 'lualine.themes.auto'
      -- Change the background of lualine_c section for normal mode
      custom_theme.normal.a.fg = '#5fdaff'  -- rgb colors are supported
      custom_theme.normal.a.bg = 'NONE'     -- rgb colors are supported
      custom_theme.normal.b.fg = '#5fdaff'  -- rgb colors are supported
      custom_theme.normal.b.bg = 'NONE'     -- rgb colors are supported
      custom_theme.normal.c.fg = '#dfdcd8'  -- rgb colors are supported
      custom_theme.normal.c.bg = 'NONE'     -- rgb colors are supported

      custom_theme.command.a.bg = 'NONE'    -- rgb colors are supported
      custom_theme.command.b.bg = 'NONE'    -- rgb colors are supported
      custom_theme.command.a.fg = cyan2     -- rgb colors are supported
      custom_theme.command.b.fg = cyan2     -- rgb colors are supported

      custom_theme.replace.a.bg = '#ff4a00' -- rgb colors are supported
      custom_theme.replace.a.fg = 'NONE'    -- rgb colors are supported
      custom_theme.replace.b.fg = '#ff4a00' -- rgb colors are supported
      custom_theme.replace.b.bg = 'NONE'    -- rgb colors are supported
      -- custom_theme.replace.c.bg = "#171920" -- rgb colors are supported
      custom_theme.visual.a.fg = '#bd93f9'  -- rgb colors are supported
      custom_theme.visual.a.bg = 'NONE'     -- rgb colors are supported
      custom_theme.visual.b.fg = '#bd93f9'  -- rgb colors are supported
      custom_theme.visual.b.bg = 'NONE'     -- rgb colors are supported
      -- custom_theme.visual.c.bg = "#171920" -- rgb colors are supported
      custom_theme.insert.a.fg = '#abe15b'  -- rgb colors are supported
      custom_theme.insert.a.bg = 'NONE'     -- rgb colors are supported
      custom_theme.insert.b.fg = '#abe15b'  -- rgb colors are supported
      custom_theme.insert.b.bg = 'NONE'     -- rgb colors are supported
      -- custom_theme.insert.c.bg = "#171920" -- rgb colors are supported
      --
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
          globalstatus = true,
          disabled_filetypes = { statusline = { 'dashboard', 'alpha', 'starter' } },
        },
        sections = {
          lualine_a = {
            {
              'mode',
              -- icon = "",
              icon = '',

              -- fmt = trunc(200, 4, nil, true),
              fmt = empty(),
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
            { 'filetype', icon_only = true,                 separator = '', padding = { left = 1, right = 0 } },
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
            { 'filesize', padding = { left = 0, right = 0 } },
            {
              'branch',
              icon = '',
              color = { fg = cyan2 },            -- Set branch color to rose
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
            -- stylua: ignore
            --
            {
              function() return require("noice").api.status.command.get() end,
              cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
              color = { fg = "#9ece6a" },
              -- color = function() return Util.ui.fg("Constant") end,
            },
            -- stylua: ignore
            {
              function() return require("noice").api.status.mode.get() end,
              cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
              color = { fg = "#9ece6a" },
              -- color = function() return Util.ui.fg("Constant") end,
            },
            -- stylua: ignore
            {
              function() return "  " .. require("dap").status() end,
              cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
              color = { fg = "#333333", bg = "#dfdcd8" },
              -- color = Util.ui.fg("Debug"),
            },
            { 'searchcount' },
            {
              require('lazy.status').updates,
              cond = require('lazy.status').has_updates,
              color = { fg = '#333333', bg = '#dfdcd8' },
              -- color = Util.ui.fg("Special"),
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
            --[[ function()
            return " " .. os.date("%R")
          end, ]]
          },
        },
        extensions = { 'neo-tree', 'lazy' },
      }

      table.insert(opts.sections.lualine_c, {
        'aerial',
        sep = ' ',     -- separator between symbols
        sep_icon = '', -- separator between icon and symbol

        -- The number of symbols to render top-down. In order to render only 'N' last
        -- symbols, negative numbers may be supplied. For instance, 'depth = -1' can
        -- be used in order to render only current symbol.
        depth = 5,

        -- When 'dense' mode is on, icons are not rendered near their symbols. Only
        -- a single icon that represents the kind of current symbol is rendered at
        -- the beginning of status line.
        dense = false,

        -- The separator to be used to separate symbols in dense mode.
        dense_sep = '.',

        -- Color the symbol icons.
        colored = true,
      })

      return opts
    end,
  },

  {
    'ausbxuse/snappy.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    dir = set_path(home .. '/.local/src/public/snappy.nvim'),
    init = function()
      vim.cmd.colorscheme 'snappy'
    end,
    config = function()
      require('snappy').setup {
        on_colors = function(colors)
          colors.hint = colors.orange
          colors.error = '#ff0000'
        end,
      }
    end,
  },
}
