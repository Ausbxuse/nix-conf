return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
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
          "<leader>H",
          function()
            require("harpoon"):list():add()
          end,
          desc = "Harpoon File",
        },
        {
          "<leader>h",
          function()
            local harpoon = require("harpoon")
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          desc = "Harpoon Quick Menu",
        },
      }

      for i = 1, 5 do
        table.insert(keys, {
          "<leader>" .. i,
          function()
            require("harpoon"):list():select(i)
          end,
          desc = "Harpoon to File " .. i,
        })
      end
      return keys
    end,
  },
  {
    "jvgrootveld/telescope-zoxide",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" }
  },
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    enabled = function()
      return LazyVim.pick.want() == "telescope"
    end,
    version = false, -- telescope did only one release, so use HEAD for now
    keys = {

      { "<leader>fg", LazyVim.pick("live_grep", { root = false }), desc = "Grep (cwd)" },
      { "<leader>qf", "<cmd>Telescope quickfix<cr>",               desc = "Quickfix List" },
    },
    opts = function()
      local actions = require("telescope.actions")

      local open_with_trouble = function(...)
        return require("trouble.sources.telescope").open(...)
      end
      local find_files_no_ignore = function()
        local action_state = require("telescope.actions.state")
        local line = action_state.get_current_line()
        LazyVim.pick("find_files", { no_ignore = true, default_text = line })()
      end
      local find_files_with_hidden = function()
        local action_state = require("telescope.actions.state")
        local line = action_state.get_current_line()
        LazyVim.pick("find_files", { hidden = true, default_text = line })()
      end

      local function find_command()
        if 1 == vim.fn.executable("rg") then
          return { "rg", "--files", "--color", "never", "-g", "!.git" }
        elseif 1 == vim.fn.executable("fd") then
          return { "fd", "--type", "f", "--color", "never", "-E", ".git" }
        elseif 1 == vim.fn.executable("fdfind") then
          return { "fdfind", "--type", "f", "--color", "never", "-E", ".git" }
        elseif 1 == vim.fn.executable("find") and vim.fn.has("win32") == 0 then
          return { "find", ".", "-type", "f" }
        elseif 1 == vim.fn.executable("where") then
          return { "where", "/r", ".", "*" }
        end
      end

      local z_utils = require("telescope._extensions.zoxide.utils")

      return {
        extensions = {
          zoxide = {
            prompt_title = "[ Walking on the shoulders of TJ ]",
            mappings = {
              default = {
                after_action = function(selection)
                  print("Update to (" .. selection.z_score .. ") " .. selection.path)
                end
              },
              ["<C-s>"] = {
                before_action = function(selection) print("before C-s") end,
                action = function(selection)
                  vim.cmd.edit(selection.path)
                end
              },
              -- Opens the selected entry in a new split
              ["<C-q>"] = { action = z_utils.create_basic_command("split") },
            },
          }
        },
        defaults = {
          layout_strategy = "center",

          borderchars = {
            prompt = { " ", " ", " ", " ", " ", " ", " ", " " },
            results = { " ", " ", " ", " ", " ", " ", " ", " " },
            preview = { " ", " ", " ", " ", " ", " ", " ", " " },
            --[[ prompt = {"─", "│", "─", "│", '┌', '┐', "┘", "└"},
       results = {"─", "│", "─", "│", "┌", "┐", "┘", "└"},
       preview = {'─', '│', '─', '│', '┌', '┐', '┘', '└'} ]]
          },
          winblend = 10,
          width = 1,
          prompt_prefix = "❯ ",
          prompt_title = "",
          selection_caret = " ",
          sorting_strategy = "ascending",
          hl_result_eol = true,
          results_title = false,
          border = true,
          layout_config = {
            center = {
              preview_cutoff = 1,
              anchor = "S",
              height = 0.3,
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
              if vim.bo[buf].buftype == "" then
                return win
              end
            end
            return 0
          end,
          mappings = {
            i = {
              ["<c-t>"] = open_with_trouble,
              ["<a-t>"] = open_with_trouble,
              ["<a-i>"] = find_files_no_ignore,
              ["<a-h>"] = find_files_with_hidden,
              ["<C-Down>"] = actions.cycle_history_next,
              ["<C-Up>"] = actions.cycle_history_prev,
              ["<C-f>"] = actions.preview_scrolling_down,
              ["<C-b>"] = actions.preview_scrolling_up,
            },
            n = {
              ["q"] = actions.close,
            },
          },
        },
        pickers = {
          find_files = {
            find_command = find_command,
            hidden = true,
          },
        },
      }
    end,
  },
}
