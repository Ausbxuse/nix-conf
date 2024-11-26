return {
  {
    "sphamba/smear-cursor.nvim",
    enabled = false,

    opts = {
      -- Cursor color. Defaults to Normal gui foreground color
      cursor_color = "#d3cdc3",

      -- Background color. Defaults to Normal gui background color
      normal_bg = "#282828",

      -- Smear cursor when switching buffers
      smear_between_buffers = true,

      -- Smear cursor when moving within line or to neighbor lines
      smear_between_neighbor_lines = true,

      -- Use floating windows to display smears outside buffers.
      -- May have performance issues with other plugins.
      use_floating_windows = true,

      -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
      -- Smears will blend better on all backgrounds.
      legacy_computing_symbols_support = false,

      -- Attempt to hide the real cursor when smearing.
      hide_target_hack = true,
    }
  },
  {
    "karb94/neoscroll.nvim",
    config = function()
      local neoscroll = require('neoscroll')
      neoscroll.setup({
        mappings = { -- Keys to be mapped to their corresponding default scrolling animation
          '<C-u>', '<C-d>',
          '<C-b>', '<C-f>',
          '<C-y>', '<C-e>',
          'zt', 'zz', 'zb',
        },
        hide_cursor = true,          -- Hide cursor while scrolling
        stop_eof = true,             -- Stop at <EOF> when scrolling downwards
        respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing = 'quadratic',        -- Default easing function
        pre_hook = nil,              -- Function to run before the scrolling animation starts
        post_hook = nil,             -- Function to run after the scrolling animation ends
        performance_mode = true,     -- Disable "Performance Mode" on all buffers.
        ignored_events = {           -- Events ignored while scrolling
          'WinScrolled', 'CursorMoved'
        },
      })
      local keymap = {
        -- Use the "sine" easing function
        ["<C-u>"] = function()
          neoscroll.ctrl_u({ duration = 200, easing = 'sine' })
          vim.cmd("normal! zz")
        end,
        ["<C-d>"] = function()
          neoscroll.ctrl_d({ duration = 150, easing = 'sine' })
          vim.cmd("normal! zz")
        end,
        -- Use the "circular" easing function
        ["<C-b>"] = function() neoscroll.ctrl_b({ duration = 350, easing = 'circular' }) end,
        ["<C-f>"] = function() neoscroll.ctrl_f({ duration = 350, easing = 'circular' }) end,
        -- When no value is passed the `easing` option supplied in `setup()` is used
        ["<C-y>"] = function() neoscroll.scroll(-0.1, { move_cursor = false, duration = 100 }) end,
        ["<C-e>"] = function() neoscroll.scroll(0.1, { move_cursor = false, duration = 100 }) end,
      }
      local modes = { 'n', 'v', 'x' }
      for key, func in pairs(keymap) do
        vim.keymap.set(modes, key, func)
      end
    end
  }
}
