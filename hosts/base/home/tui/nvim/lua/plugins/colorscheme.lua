local home = vim.fn.expand("$HOME")

local function set_path(file_path)
  local file_stat = vim.loop.fs_stat(file_path)
  local path_variable = file_stat and file_path or nil
  return path_variable
end

return {
        --[[ latte = {
          rosewater = "#f7768e",
          flamingo = "#f7768e",
          red = "#f7768e",
          maroon = "#f7768e",
          pink = "#fc317e",
          mauve = "#fc317e",
          peach = "#f4bf75",
          yellow = "#f4bf75",
          green = "#9ece6a",
          teal = "#1abc9c",
          sky = "#1abc9c",
          sapphire = "#62d8f1",
          blue = "#4fc1ff",
          lavender = "#4fc1ff",
          text = "#eaeaea",
          subtext1 = "#a9b1d6",
          subtext0 = "#737aa2",
          overlay2 = "#545c7e",
          overlay1 = "#414868",
          overlay0 = "#3b4261",
          surface2 = "#292e42",
          surface1 = "#1e2233",
          surface0 = "#1c1f24",
          base = "#1b1e2d",
          mantle = "#1b1e2d",
          crust = "#1b1e2d",
        },
        mocha = {
          rosewater = "#f7768e",
          flamingo = "#f7768e",
          red = "#f7768e",
          maroon = "#f7768e",
          pink = "#fc317e",
          mauve = "#fc317e",
          peach = "#f4bf75",
          yellow = "#f4bf75",
          green = "#9ece6a",
          teal = "#1abc9c",
          sky = "#1abc9c",
          sapphire = "#62d8f1",
          blue = "#4fc1ff",
          lavender = "#4fc1ff",
          text = "#1b1e2d",
          subtext1 = "#1c1f24",
          subtext0 = "#1e2233",
          overlay2 = "#292e42",
          overlay1 = "#3b4261",
          overlay0 = "#414868",
          surface2 = "#545c7e",
          surface1 = "#737aa2",
          surface0 = "#a9b1d6",
          base = "#eaeaea",
          mantle = "#eaeaea",
          crust = "#eaeaea",
        }, ]]
  {
    "ausbxuse/snappy.nvim",
    dir = set_path(home .. "/.local/src/public/snappy.nvim"),
    config = function()
      require("snappy").setup({
        on_colors = function(colors)
          colors.hint = colors.orange
          colors.error = "#ff0000"
        end,
        on_highlights = function(hl, c)
          local prompt = "#2d3149"
          hl.TelescopeNormal = {
            bg = c.bg_dark,
            fg = c.fg_dark,
          }
          hl.TelescopeBorder = {
            bg = c.bg_dark,
            fg = c.bg_dark,
          }
          hl.TelescopePromptNormal = {
            bg = prompt,
          }
          hl.TelescopePromptBorder = {
            bg = prompt,
            fg = prompt,
          }
          hl.TelescopePromptTitle = {
            bg = prompt,
            fg = prompt,
          }
          hl.TelescopePreviewTitle = {
            bg = c.bg_dark,
            fg = c.bg_dark,
          }
          hl.TelescopeResultsTitle = {
            bg = c.bg_dark,
            fg = c.bg_dark,
          }
        end,
      })
      vim.api.nvim_command("colorscheme snappy")
    end,
  }

}
