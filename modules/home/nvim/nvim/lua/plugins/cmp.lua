local home = vim.fn.expand '$HOME'

local function set_path(file_path)
  local file_stat = vim.loop.fs_stat(file_path)
  local path_variable = file_stat and file_path or nil
  return path_variable
end
return {
  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          -- `friendly-snippets` contains a variety of premade snippets.
          --    See the README about individual language/framework/plugin snippets:
          --    https://github.com/rafamadriz/friendly-snippets
          {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load()
            end,
          },
        },
      },
      {
        'ausbxuse/luasnip-latex-snippets.nvim',
        enabled = false,
        dir = set_path(home .. '/.local/src/public-repos/luasnip-latex-snippets.nvim'),
        event = 'VeryLazy',
        config = function()
          require('luasnip-latex-snippets').setup {
            allow_on_markdown = false,
          }
          -- Modify existing snippets using higher priority and util function from luasnip-latex-snippets
          local ls = require 'luasnip'
          ls.config.setup { enable_autosnippets = true }
          local s = ls.snippet
          local i = ls.insert_node
          local fmta = require('luasnip.extras.fmt').fmta
          local utils = require 'luasnip-latex-snippets.util.utils'
          local not_math = utils.with_opts(utils.not_math, false) -- when using treesitter, change false to true

          ls.add_snippets('tex', {
            s({ trig = 'mk', snippetType = 'autosnippet', priority = 100 }, fmta('$<>$<>', { i(1), i(2) }), { condition = not_math }),
            s({ trig = 'choose', snippetType = 'autosnippet', priority = 100 }, fmta('\\binom{<>}{<>}<>', { i(1), i(2), i(3) }), { condition = not not_math }),
          })
        end,
      },
      'saadparwaiz1/cmp_luasnip',

      -- Adds other completion capabilities.
      --  nvim-cmp does not ship with all sources by default. They are split
      --  into multiple repos for maintenance purposes.
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-calc', -- nvim-cmp source for math calculation.
      'hrsh7th/cmp-emoji', -- nvim-cmp source for math calculation.
    },
    config = function()
      -- See `:help cmp`
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      luasnip.config.setup {}
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
      end

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },

        -- For an understanding of why these mappings were
        -- chosen, you will need to read `:help ins-completion`
        --
        -- No, but seriously. Please read `:help ins-completion`, it is really good!
        mapping = cmp.mapping.preset.insert {
          -- Select the [n]ext item
          ['<C-n>'] = cmp.mapping.select_next_item(),
          -- Select the [p]revious item
          ['<C-p>'] = cmp.mapping.select_prev_item(),

          -- Scroll the documentation window [b]ack / [f]orward
          --['<C-b>'] = cmp.mapping.scroll_docs(-4),
          --['<C-f>'] = cmp.mapping.scroll_docs(4),

          ---- Accept ([y]es) the completion.
          ----  This will auto-import if your LSP supports it.
          ----  This will expand snippets if the LSP sent a snippet.
          --['<C-y>'] = cmp.mapping.confirm { select = true },

          -- If you prefer more traditional completion keymaps,
          -- you can uncomment the following lines
          --['<CR>'] = cmp.mapping.confirm { select = true },
          --['<Tab>'] = cmp.mapping.select_next_item(),
          --['<S-Tab>'] = cmp.mapping.select_prev_item(),

          -- Manually trigger a completion from nvim-cmp.
          --  Generally you don't need this, because nvim-cmp will display
          --  completions whenever it has completion options available.
          ['<C-Space>'] = cmp.mapping.complete {},

          -- Think of <c-l> as moving to the right of your snippet expansion.
          --  So if you have a snippet that's like:
          --  function $name($args)
          --    $body
          --  end
          --
          -- <c-l> will move you to the right of each of the expansion locations.
          -- <c-h> is similar, except moving you backwards.
          -- ['<C-l>'] = cmp.mapping(function()
          --   if luasnip.expand_or_locally_jumpable() then
          --     luasnip.expand_or_jump()
          --   end
          -- end, { 'i', 's' }),
          -- ['<C-h>'] = cmp.mapping(function()
          --   if luasnip.locally_jumpable(-1) then
          --     luasnip.jump(-1)
          --   end
          -- end, { 'i', 's' }),

          ['<CR>'] = cmp.config.disable,
          ['<c-e>'] = cmp.mapping(function(fallback)
            if luasnip.locally_jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<c-y>'] = cmp.mapping(function(fallback)
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              -- you could replace select_next_item() with confirm({ select = true }) to get vs code autocompletion behavior
              -- cmp.select_next_item()
              cmp.confirm { select = true }
            elseif has_words_before() then
              cmp.complete()
            elseif vim.api.nvim_get_current_line():match '^%s*-%s' then
              local row, col = unpack(vim.api.nvim_win_get_cursor(0))
              vim.cmd 'normal! >>'
              vim.api.nvim_win_set_cursor(0, { row, col + 2 })
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<s-tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif vim.api.nvim_get_current_line():match '^%s*-%s' then
              local row, col = unpack(vim.api.nvim_win_get_cursor(0))
              vim.cmd 'normal! <<'
              if col > 7 then
                vim.api.nvim_win_set_cursor(0, { row, col - 2 })
              else
                vim.api.nvim_win_set_cursor(0, { row, 6 })
              end
            else
              fallback()
            end
          end, { 'i', 's' }),

          -- ['<c-j>'] = cmp.mapping(function(fallback)
          --   if cmp.visible() then
          --     cmp.select_next_item()
          --   else
          --     fallback()
          --   end
          -- end, { 'i', 's' }),

          -- ['<c-k>'] = cmp.mapping(function(fallback)
          --   if cmp.visible() then
          --     cmp.select_prev_item()
          --   else
          --     fallback()
          --   end
          -- end, { 'i', 's' }),

          -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
          --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
        },
        sources = {
          {
            name = 'lazydev',
            -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
            group_index = 0,
          },
          { name = 'luasnip' },
          { name = 'nvim_lsp' },
          { name = 'path' },
          { name = 'spell' },
          { name = 'emoji' },
          { name = 'buffer' },
          { name = 'calc' },
        },
        formatting = {
          expandable_indicator = true,
          fields = { 'abbr', 'menu', 'kind' },
          format = function(entry, item)
            -- Define menu shorthand for different completion sources.
            local menu_icon = {
              nvim_lsp = 'LSP',
              luasnip = 'SNP',
              buffer = 'BUF',
              path = 'PTH',
            }

            local icons = {
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
            }
            if icons[item.kind] then
              item.kind = icons[item.kind] .. item.kind
            end
            -- Set the menu "icon" to the shorthand for each completion source.
            item.menu = menu_icon[entry.source.name]

            -- Set the fixed width of the completion menu to 60 characters.
            local fixed_width = 35

            -- Set 'fixed_width' to false if not provided.
            -- fixed_width = fixed_width or false

            -- Get the completion entry text shown in the completion window.
            local content = item.abbr

            -- Set the fixed completion window width.
            if fixed_width then
              vim.o.pumwidth = fixed_width
            end

            -- Get the width of the current window.
            local win_width = vim.api.nvim_win_get_width(0)

            -- Set the max content width based on either: 'fixed_width'
            -- or a percentage of the window width, in this case 20%.
            -- We subtract 10 from 'fixed_width' to leave room for 'kind' fields.
            local max_content_width = fixed_width and fixed_width - 10 or math.floor(win_width * 0.2)

            -- Truncate the completion entry text if it's longer than the
            -- max content width. We subtract 3 from the max content width
            -- to account for the "..." that will be appended to it.
            if #content > max_content_width then
              item.abbr = vim.fn.strcharpart(content, 0, max_content_width - 3) .. '...'
            else
              item.abbr = content .. (' '):rep(max_content_width - #content)
            end
            return item
          end,
        },
      }
    end,
  },
}
