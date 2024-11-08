local home = vim.fn.expand("$HOME")

local function set_path(file_path)
  local file_stat = vim.loop.fs_stat(file_path)
  local path_variable = file_stat and file_path or nil
  return path_variable
end

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      background = { light = "latte", dark = "mocha" }, -- latte, frappe, macchiato, mocha
      dim_inactive = {
        enabled = true,
        -- Dim inactive splits/windows/buffers.
        -- NOT recommended if you use old palette (a.k.a., mocha).
        shade = "dark",
        percentage = 0.15,
      },
      transparent_background = true,
      show_end_of_buffer = false, -- show the '~' characters after the end of buffers
      term_colors = true,
      compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
      styles = {
        comments = { "italic" },
        properties = { "italic" },
        functions = { "bold" },
        keywords = { "italic" },
        operators = { "bold" },
        conditionals = { "bold" },
        loops = { "bold" },
        booleans = { "bold", "italic" },
        numbers = {},
        types = {},
        strings = {},
        variables = {},
      },
      integrations = {
        treesitter = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
        },
        aerial = true,
        alpha = false,
        barbar = false,
        beacon = false,
        cmp = true,
        coc_nvim = false,
        dap = true,
        dap_ui = true,
        dashboard = false,
        dropbar = { enabled = true, color_mode = true },
        fern = false,
        fidget = true,
        flash = true,
        gitgutter = false,
        gitsigns = true,
        harpoon = false,
        headlines = false,
        hop = true,
        illuminate = false,
        indent_blankline = { enabled = true, colored_indent_levels = false },
        leap = false,
        lightspeed = false,
        lsp_saga = true,
        lsp_trouble = true,
        markdown = true,
        mason = true,
        mini = false,
        navic = { enabled = false },
        neogit = false,
        neotest = false,
        neotree = { enabled = false, show_root = true, transparent_panel = false },
        noice = false,
        notify = true,
        nvimtree = true,
        overseer = false,
        pounce = false,
        rainbow_delimiters = true,
        sandwich = false,
        semantic_tokens = true,
        symbols_outline = false,
        telekasten = false,
        telescope = { enabled = true, style = "nvchad" },
        treesitter_context = true,
        ts_rainbow = false,
        vim_sneak = false,
        vimwiki = false,
        which_key = true,
      },
      color_overrides = {
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
      },

      --[[ highlight_overrides = {
        ---@param cp palette
        all = function(cp)
          return {
            -- For base configs
            NormalFloat = { fg = cp.text, bg = transparent_background and cp.none or cp.mantle },
            FloatBorder = {
              fg = transparent_background and cp.blue or cp.mantle,
              bg = transparent_background and cp.none or cp.mantle,
            },
            CursorLineNr = { fg = cp.green },

            -- For native lsp configs
            DiagnosticVirtualTextError = { bg = cp.none },
            DiagnosticVirtualTextWarn = { bg = cp.none },
            DiagnosticVirtualTextInfo = { bg = cp.none },
            DiagnosticVirtualTextHint = { bg = cp.none },
            LspInfoBorder = { link = "FloatBorder" },

            -- For mason.nvim
            MasonNormal = { link = "NormalFloat" },

            -- For indent-blankline
            IblIndent = { fg = cp.surface0 },
            IblScope = { fg = cp.surface2, style = { "bold" } },

            -- For nvim-cmp and wilder.nvim
            Pmenu = { fg = cp.overlay2, bg = transparent_background and cp.none or cp.base },
            PmenuBorder = { fg = cp.surface1, bg = transparent_background and cp.none or cp.base },
            PmenuSel = { bg = cp.green, fg = cp.base },
            CmpItemAbbr = { fg = cp.overlay2 },
            CmpItemAbbrMatch = { fg = cp.blue, style = { "bold" } },
            CmpDoc = { link = "NormalFloat" },
            CmpDocBorder = {
              fg = transparent_background and cp.surface1 or cp.mantle,
              bg = transparent_background and cp.none or cp.mantle,
            },

            -- For fidget
            FidgetTask = { bg = cp.none, fg = cp.surface2 },
            FidgetTitle = { fg = cp.blue, style = { "bold" } },

            -- For nvim-notify
            NotifyBackground = { bg = cp.base },

            -- For nvim-tree
            NvimTreeRootFolder = { fg = cp.pink },
            NvimTreeIndentMarker = { fg = cp.surface2 },

            -- For trouble.nvim
            TroubleNormal = { bg = transparent_background and cp.none or cp.base },

            -- For telescope.nvim
            TelescopeMatching = { fg = cp.lavender },
            TelescopeResultsDiffAdd = { fg = cp.green },
            TelescopeResultsDiffChange = { fg = cp.yellow },
            TelescopeResultsDiffDelete = { fg = cp.red },

            -- For glance.nvim
            GlanceWinBarFilename = { fg = cp.subtext1, style = { "bold" } },
            GlanceWinBarFilepath = { fg = cp.subtext0, style = { "italic" } },
            GlanceWinBarTitle = { fg = cp.teal, style = { "bold" } },
            GlanceListCount = { fg = cp.lavender },
            GlanceListFilepath = { link = "Comment" },
            GlanceListFilename = { fg = cp.blue },
            GlanceListMatch = { fg = cp.lavender, style = { "bold" } },
            GlanceFoldIcon = { fg = cp.green },

            -- For nvim-treehopper
            TSNodeKey = {
              fg = cp.peach,
              bg = transparent_background and cp.none or cp.base,
              style = { "bold", "underline" },
            },

            -- For treesitter
            ["@keyword.return"] = { fg = cp.pink, style = clear },
            ["@error.c"] = { fg = cp.none, style = clear },
            ["@error.cpp"] = { fg = cp.none, style = clear },
          }
        end,
      }, ]]
    },
  },
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
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "snappy",
    },
  },
}
--[[ return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            background = {
                light = "latte",
                dark = "mocha",
            },
            color_overrides = {
                latte = {
                    rosewater = "#c14a4a",
                    flamingo = "#c14a4a",
                    red = "#c14a4a",
                    maroon = "#c14a4a",
                    pink = "#945e80",
                    mauve = "#945e80",
                    peach = "#c35e0a",
                    yellow = "#b47109",
                    green = "#6c782e",
                    teal = "#4c7a5d",
                    sky = "#4c7a5d",
                    sapphire = "#4c7a5d",
                    blue = "#45707a",
                    lavender = "#45707a",
                    text = "#654735",
                    subtext1 = "#73503c",
                    subtext0 = "#805942",
                    overlay2 = "#8c6249",
                    overlay1 = "#8c856d",
                    overlay0 = "#a69d81",
                    surface2 = "#bfb695",
                    surface1 = "#d1c7a3",
                    surface0 = "#e3dec3",
                    base = "#f9f5d7",
                    mantle = "#f0ebce",
                    crust = "#e8e3c8",
                },
                mocha = {
                    rosewater = "#ea6962",
                    flamingo = "#ea6962",
                    red = "#ea6962",
                    maroon = "#ea6962",
                    pink = "#d3869b",
                    mauve = "#d3869b",
                    peach = "#e78a4e",
                    yellow = "#d8a657",
                    green = "#a9b665",
                    teal = "#89b482",
                    sky = "#89b482",
                    sapphire = "#89b482",
                    blue = "#7daea3",
                    lavender = "#7daea3",
                    text = "#ebdbb2",
                    subtext1 = "#d5c4a1",
                    subtext0 = "#bdae93",
                    overlay2 = "#a89984",
                    overlay1 = "#928374",
                    overlay0 = "#595959",
                    surface2 = "#4d4d4d",
                    surface1 = "#404040",
                    surface0 = "#292929",
                    base = "#1d2021",
                    mantle = "#191b1c",
                    crust = "#141617",
                },
            },
            transparent_background = false,
            show_end_of_buffer = false,
            integration_default = false,
            integrations = {
                barbecue = { dim_dirname = true, bold_basename = true, dim_context = false, alt_background = false },
                cmp = true,
                gitsigns = true,
                hop = true,
                illuminate = { enabled = true },
                native_lsp = { enabled = true, inlay_hints = { background = true } },
                neogit = true,
                neotree = true,
                semantic_tokens = true,
                treesitter = true,
                treesitter_context = true,
                vimwiki = true,
                which_key = true,
            },
            highlight_overrides = {
                all = function(colors)
                    return {
                        CmpItemMenu = { fg = colors.surface2 },
                        CursorLineNr = { fg = colors.text },
                        FloatBorder = { bg = colors.base, fg = colors.surface0 },
                        GitSignsChange = { fg = colors.peach },
                        LineNr = { fg = colors.overlay0 },
                        LspInfoBorder = { link = "FloatBorder" },
                        NeoTreeDirectoryIcon = { fg = colors.subtext1 },
                        NeoTreeDirectoryName = { fg = colors.subtext1 },
                        NeoTreeFloatBorder = { link = "TelescopeResultsBorder" },
                        NeoTreeGitConflict = { fg = colors.red },
                        NeoTreeGitDeleted = { fg = colors.red },
                        NeoTreeGitIgnored = { fg = colors.overlay0 },
                        NeoTreeGitModified = { fg = colors.peach },
                        NeoTreeGitStaged = { fg = colors.green },
                        NeoTreeGitUnstaged = { fg = colors.red },
                        NeoTreeGitUntracked = { fg = colors.green },
                        NeoTreeIndent = { fg = colors.surface1 },
                        NeoTreeNormal = { bg = colors.mantle },
                        NeoTreeNormalNC = { bg = colors.mantle },
                        NeoTreeRootName = { fg = colors.subtext1, style = { "bold" } },
                        NeoTreeTabActive = { fg = colors.text, bg = colors.mantle },
                        NeoTreeTabInactive = { fg = colors.surface2, bg = colors.crust },
                        NeoTreeTabSeparatorActive = { fg = colors.mantle, bg = colors.mantle },
                        NeoTreeTabSeparatorInactive = { fg = colors.crust, bg = colors.crust },
                        NeoTreeWinSeparator = { fg = colors.base, bg = colors.base },
                        NormalFloat = { bg = colors.base },
                        Pmenu = { bg = colors.mantle, fg = "" },
                        PmenuSel = { bg = colors.surface0, fg = "" },
                        TelescopePreviewBorder = { bg = colors.crust, fg = colors.crust },
                        TelescopePreviewNormal = { bg = colors.crust },
                        TelescopePreviewTitle = { fg = colors.crust, bg = colors.crust },
                        TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
                        TelescopePromptCounter = { fg = colors.mauve, style = { "bold" } },
                        TelescopePromptNormal = { bg = colors.surface0 },
                        TelescopePromptPrefix = { bg = colors.surface0 },
                        TelescopePromptTitle = { fg = colors.surface0, bg = colors.surface0 },
                        TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
                        TelescopeResultsNormal = { bg = colors.mantle },
                        TelescopeResultsTitle = { fg = colors.mantle, bg = colors.mantle },
                        TelescopeSelection = { bg = colors.surface0 },
                        VertSplit = { bg = colors.base, fg = colors.surface0 },
                        WhichKeyFloat = { bg = colors.mantle },
                        YankHighlight = { bg = colors.surface2 },
                        FidgetTask = { fg = colors.subtext2 },
                        FidgetTitle = { fg = colors.peach },

                        IblIndent = { fg = colors.surface0 },
                        IblScope = { fg = colors.overlay0 },

                        Boolean = { fg = colors.mauve },
                        Number = { fg = colors.mauve },
                        Float = { fg = colors.mauve },

                        PreProc = { fg = colors.mauve },
                        PreCondit = { fg = colors.mauve },
                        Include = { fg = colors.mauve },
                        Define = { fg = colors.mauve },
                        Conditional = { fg = colors.red },
                        Repeat = { fg = colors.red },
                        Keyword = { fg = colors.red },
                        Typedef = { fg = colors.red },
                        Exception = { fg = colors.red },
                        Statement = { fg = colors.red },

                        Error = { fg = colors.red },
                        StorageClass = { fg = colors.peach },
                        Tag = { fg = colors.peach },
                        Label = { fg = colors.peach },
                        Structure = { fg = colors.peach },
                        Operator = { fg = colors.peach },
                        Title = { fg = colors.peach },
                        Special = { fg = colors.yellow },
                        SpecialChar = { fg = colors.yellow },
                        Type = { fg = colors.yellow, style = { "bold" } },
                        Function = { fg = colors.green, style = { "bold" } },
                        Delimiter = { fg = colors.subtext2 },
                        Ignore = { fg = colors.subtext2 },
                        Macro = { fg = colors.teal },

                        TSAnnotation = { fg = colors.mauve },
                        TSAttribute = { fg = colors.mauve },
                        TSBoolean = { fg = colors.mauve },
                        TSCharacter = { fg = colors.teal },
                        TSCharacterSpecial = { link = "SpecialChar" },
                        TSComment = { link = "Comment" },
                        TSConditional = { fg = colors.red },
                        TSConstBuiltin = { fg = colors.mauve },
                        TSConstMacro = { fg = colors.mauve },
                        TSConstant = { fg = colors.text },
                        TSConstructor = { fg = colors.green },
                        TSDebug = { link = "Debug" },
                        TSDefine = { link = "Define" },
                        TSEnvironment = { link = "Macro" },
                        TSEnvironmentName = { link = "Type" },
                        TSError = { link = "Error" },
                        TSException = { fg = colors.red },
                        TSField = { fg = colors.blue },
                        TSFloat = { fg = colors.mauve },
                        TSFuncBuiltin = { fg = colors.green },
                        TSFuncMacro = { fg = colors.green },
                        TSFunction = { fg = colors.green },
                        TSFunctionCall = { fg = colors.green },
                        TSInclude = { fg = colors.red },
                        TSKeyword = { fg = colors.red },
                        TSKeywordFunction = { fg = colors.red },
                        TSKeywordOperator = { fg = colors.peach },
                        TSKeywordReturn = { fg = colors.red },
                        TSLabel = { fg = colors.peach },
                        TSLiteral = { link = "String" },
                        TSMath = { fg = colors.blue },
                        TSMethod = { fg = colors.green },
                        TSMethodCall = { fg = colors.green },
                        TSNamespace = { fg = colors.yellow },
                        TSNone = { fg = colors.text },
                        TSNumber = { fg = colors.mauve },
                        TSOperator = { fg = colors.peach },
                        TSParameter = { fg = colors.text },
                        TSParameterReference = { fg = colors.text },
                        TSPreProc = { link = "PreProc" },
                        TSProperty = { fg = colors.blue },
                        TSPunctBracket = { fg = colors.text },
                        TSPunctDelimiter = { link = "Delimiter" },
                        TSPunctSpecial = { fg = colors.blue },
                        TSRepeat = { fg = colors.red },
                        TSStorageClass = { fg = colors.peach },
                        TSStorageClassLifetime = { fg = colors.peach },
                        TSStrike = { fg = colors.subtext2 },
                        TSString = { fg = colors.teal },
                        TSStringEscape = { fg = colors.green },
                        TSStringRegex = { fg = colors.green },
                        TSStringSpecial = { link = "SpecialChar" },
                        TSSymbol = { fg = colors.text },
                        TSTag = { fg = colors.peach },
                        TSTagAttribute = { fg = colors.green },
                        TSTagDelimiter = { fg = colors.green },
                        TSText = { fg = colors.green },
                        TSTextReference = { link = "Constant" },
                        TSTitle = { link = "Title" },
                        TSTodo = { link = "Todo" },
                        TSType = { fg = colors.yellow, style = { "bold" } },
                        TSTypeBuiltin = { fg = colors.yellow, style = { "bold" } },
                        TSTypeDefinition = { fg = colors.yellow, style = { "bold" } },
                        TSTypeQualifier = { fg = colors.peach, style = { "bold" } },
                        TSURI = { fg = colors.blue },
                        TSVariable = { fg = colors.text },
                        TSVariableBuiltin = { fg = colors.mauve },

                        ["@annotation"] = { link = "TSAnnotation" },
                        ["@attribute"] = { link = "TSAttribute" },
                        ["@boolean"] = { link = "TSBoolean" },
                        ["@character"] = { link = "TSCharacter" },
                        ["@character.special"] = { link = "TSCharacterSpecial" },
                        ["@comment"] = { link = "TSComment" },
                        ["@conceal"] = { link = "Grey" },
                        ["@conditional"] = { link = "TSConditional" },
                        ["@constant"] = { link = "TSConstant" },
                        ["@constant.builtin"] = { link = "TSConstBuiltin" },
                        ["@constant.macro"] = { link = "TSConstMacro" },
                        ["@constructor"] = { link = "TSConstructor" },
                        ["@debug"] = { link = "TSDebug" },
                        ["@define"] = { link = "TSDefine" },
                        ["@error"] = { link = "TSError" },
                        ["@exception"] = { link = "TSException" },
                        ["@field"] = { link = "TSField" },
                        ["@float"] = { link = "TSFloat" },
                        ["@function"] = { link = "TSFunction" },
                        ["@function.builtin"] = { link = "TSFuncBuiltin" },
                        ["@function.call"] = { link = "TSFunctionCall" },
                        ["@function.macro"] = { link = "TSFuncMacro" },
                        ["@include"] = { link = "TSInclude" },
                        ["@keyword"] = { link = "TSKeyword" },
                        ["@keyword.function"] = { link = "TSKeywordFunction" },
                        ["@keyword.operator"] = { link = "TSKeywordOperator" },
                        ["@keyword.return"] = { link = "TSKeywordReturn" },
                        ["@label"] = { link = "TSLabel" },
                        ["@math"] = { link = "TSMath" },
                        ["@method"] = { link = "TSMethod" },
                        ["@method.call"] = { link = "TSMethodCall" },
                        ["@namespace"] = { link = "TSNamespace" },
                        ["@none"] = { link = "TSNone" },
                        ["@number"] = { link = "TSNumber" },
                        ["@operator"] = { link = "TSOperator" },
                        ["@parameter"] = { link = "TSParameter" },
                        ["@parameter.reference"] = { link = "TSParameterReference" },
                        ["@preproc"] = { link = "TSPreProc" },
                        ["@property"] = { link = "TSProperty" },
                        ["@punctuation.bracket"] = { link = "TSPunctBracket" },
                        ["@punctuation.delimiter"] = { link = "TSPunctDelimiter" },
                        ["@punctuation.special"] = { link = "TSPunctSpecial" },
                        ["@repeat"] = { link = "TSRepeat" },
                        ["@storageclass"] = { link = "TSStorageClass" },
                        ["@storageclass.lifetime"] = { link = "TSStorageClassLifetime" },
                        ["@strike"] = { link = "TSStrike" },
                        ["@string"] = { link = "TSString" },
                        ["@string.escape"] = { link = "TSStringEscape" },
                        ["@string.regex"] = { link = "TSStringRegex" },
                        ["@string.special"] = { link = "TSStringSpecial" },
                        ["@symbol"] = { link = "TSSymbol" },
                        ["@tag"] = { link = "TSTag" },
                        ["@tag.attribute"] = { link = "TSTagAttribute" },
                        ["@tag.delimiter"] = { link = "TSTagDelimiter" },
                        ["@text"] = { link = "TSText" },
                        ["@text.danger"] = { link = "TSDanger" },
                        ["@text.diff.add"] = { link = "diffAdded" },
                        ["@text.diff.delete"] = { link = "diffRemoved" },
                        ["@text.emphasis"] = { link = "TSEmphasis" },
                        ["@text.environment"] = { link = "TSEnvironment" },
                        ["@text.environment.name"] = { link = "TSEnvironmentName" },
                        ["@text.literal"] = { link = "TSLiteral" },
                        ["@text.math"] = { link = "TSMath" },
                        ["@text.note"] = { link = "TSNote" },
                        ["@text.reference"] = { link = "TSTextReference" },
                        ["@text.strike"] = { link = "TSStrike" },
                        ["@text.strong"] = { link = "TSStrong" },
                        ["@text.title"] = { link = "TSTitle" },
                        ["@text.todo"] = { link = "TSTodo" },
                        ["@text.todo.checked"] = { link = "Green" },
                        ["@text.todo.unchecked"] = { link = "Ignore" },
                        ["@text.underline"] = { link = "TSUnderline" },
                        ["@text.uri"] = { link = "TSURI" },
                        ["@text.warning"] = { link = "TSWarning" },
                        ["@todo"] = { link = "TSTodo" },
                        ["@type"] = { link = "TSType" },
                        ["@type.builtin"] = { link = "TSTypeBuiltin" },
                        ["@type.definition"] = { link = "TSTypeDefinition" },
                        ["@type.qualifier"] = { link = "TSTypeQualifier" },
                        ["@uri"] = { link = "TSURI" },
                        ["@variable"] = { link = "TSVariable" },
                        ["@variable.builtin"] = { link = "TSVariableBuiltin" },

                        ["@lsp.type.class"] = { link = "TSType" },
                        ["@lsp.type.comment"] = { link = "TSComment" },
                        ["@lsp.type.decorator"] = { link = "TSFunction" },
                        ["@lsp.type.enum"] = { link = "TSType" },
                        ["@lsp.type.enumMember"] = { link = "TSProperty" },
                        ["@lsp.type.events"] = { link = "TSLabel" },
                        ["@lsp.type.function"] = { link = "TSFunction" },
                        ["@lsp.type.interface"] = { link = "TSType" },
                        ["@lsp.type.keyword"] = { link = "TSKeyword" },
                        ["@lsp.type.macro"] = { link = "TSConstMacro" },
                        ["@lsp.type.method"] = { link = "TSMethod" },
                        ["@lsp.type.modifier"] = { link = "TSTypeQualifier" },
                        ["@lsp.type.namespace"] = { link = "TSNamespace" },
                        ["@lsp.type.number"] = { link = "TSNumber" },
                        ["@lsp.type.operator"] = { link = "TSOperator" },
                        ["@lsp.type.parameter"] = { link = "TSParameter" },
                        ["@lsp.type.property"] = { link = "TSProperty" },
                        ["@lsp.type.regexp"] = { link = "TSStringRegex" },
                        ["@lsp.type.string"] = { link = "TSString" },
                        ["@lsp.type.struct"] = { link = "TSType" },
                        ["@lsp.type.type"] = { link = "TSType" },
                        ["@lsp.type.typeParameter"] = { link = "TSTypeDefinition" },
                        ["@lsp.type.variable"] = { link = "TSVariable" },
                    }
                end,
                latte = function(colors)
                    return {
                        IblIndent = { fg = colors.mantle },
                        IblScope = { fg = colors.surface1 },

                        LineNr = { fg = colors.surface1 },
                    }
                end,
            },
        })

        vim.api.nvim_command("colorscheme catppuccin")
    end,
} ]]
