local words = {}
for word in io.open(vim.fn.stdpath("config") .. "/spell/en.utf-8.add", "r"):lines() do
  table.insert(words, word)
end

return {
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = {
      auto_close = false,      -- auto close when there are no items
      auto_open = false,       -- auto open when there are items
      auto_preview = true,     -- automatically open preview when on an item
      auto_refresh = true,     -- auto refresh when open
      auto_jump = false,       -- auto jump to the item when there's only one
      focus = false,           -- Focus the window when opened
      restore = true,          -- restores the last location in the list when opening
      follow = true,           -- Follow the current item
      indent_guides = true,    -- show indent guides
      max_items = 200,         -- limit number of items that can be displayed per section
      multiline = true,        -- render multi-line messages
      pinned = false,          -- When pinned, the opened trouble window will be bound to the current buffer
      warn_no_results = true,  -- show a warning when there are no results
      open_no_results = false, -- open the trouble window when there are no results
      win = {},                -- window options for the results window. Can be a split or a floating window.
      -- Window options for the preview window. Can be a split, floating window,
      -- or `main` to show the preview in the main editor window.
      preview = {
        type = "main",
        -- when a buffer is not yet loaded, the preview window will be created
        -- in a scratch buffer with only syntax highlighting enabled.
        -- Set to false, if you want the preview to always be a real loaded buffer.
        scratch = true,
      },
      -- Throttle/Debounce settings. Should usually not be changed.
      ---@type table<string, number|{ms:number, debounce?:boolean}>
      throttle = {
        refresh = 20,                            -- fetches new data when needed
        update = 10,                             -- updates the window
        render = 10,                             -- renders the window
        follow = 100,                            -- follows the current item
        preview = { ms = 100, debounce = true }, -- shows the preview for the current item
      },
      -- Key mappings can be set to the name of a builtin action,
      -- or you can define your own custom action.
      ---@type table<string, trouble.Action.spec|false>
      keys = {
        ["?"] = "help",
        r = "refresh",
        R = "toggle_refresh",
        q = "close",
        o = "jump_close",
        ["<esc>"] = "cancel",
        ["<cr>"] = "jump",
        ["<2-leftmouse>"] = "jump",
        ["<c-s>"] = "jump_split",
        ["<c-v>"] = "jump_vsplit",
        -- go down to next item (accepts count)
        -- j = "next",
        ["}"] = "next",
        ["]]"] = "next",
        -- go up to prev item (accepts count)
        -- k = "prev",
        ["{"] = "prev",
        ["[["] = "prev",
        dd = "delete",
        d = { action = "delete", mode = "v" },
        i = "inspect",
        p = "preview",
        P = "toggle_preview",
        zo = "fold_open",
        zO = "fold_open_recursive",
        zc = "fold_close",
        zC = "fold_close_recursive",
        za = "fold_toggle",
        zA = "fold_toggle_recursive",
        zm = "fold_more",
        zM = "fold_close_all",
        zr = "fold_reduce",
        zR = "fold_open_all",
        zx = "fold_update",
        zX = "fold_update_all",
        zn = "fold_disable",
        zN = "fold_enable",
        zi = "fold_toggle_enable",
        gb = { -- example of a custom action that toggles the active view filter
          action = function(view)
            view:filter({ buf = 0 }, { toggle = true })
          end,
          desc = "Toggle Current Buffer Filter",
        },
        s = { -- example of a custom action that toggles the severity
          action = function(view)
            local f = view:get_filter("severity")
            local severity = ((f and f.filter.severity or 0) + 1) % 5
            view:filter({ severity = severity }, {
              id = "severity",
              template = "{hl:Title}Filter:{hl} {severity}",
              del = severity == 0,
            })
          end,
          desc = "Toggle Severity Filter",
        },
      },
      modes = {
        -- sources define their own modes, which you can use directly,
        -- or override like in the example below
        lsp_references = {
          -- some modes are configurable, see the source code for more details
          params = {
            include_declaration = true,
          },
        },
        -- The LSP base mode for:
        -- * lsp_definitions, lsp_references, lsp_implementations
        -- * lsp_type_definitions, lsp_declarations, lsp_command
        lsp_base = {
          params = {
            -- don't include the current location in the results
            include_current = false,
          },
        },
        -- more advanced example that extends the lsp_document_symbols
        symbols = {
          desc = "document symbols",
          mode = "lsp_document_symbols",
          focus = false,
          win = { position = "left" },
          filter = {
            -- remove Package since luals uses it for control flow structures
            ["not"] = { ft = "lua", kind = "Package" },
            any = {
              -- all symbol kinds for help / markdown files
              ft = { "help", "markdown" },
              -- default set of symbol kinds
              kind = {
                "Class",
                "Constructor",
                "Enum",
                "Field",
                "Function",
                "Interface",
                "Method",
                "Module",
                "Namespace",
                "Package",
                "Property",
                "Struct",
                "Trait",
              },
            },
          },
        },
      },
      -- stylua: ignore
      icons = {
        indent        = {
          top         = "│ ",
          middle      = "├╴",
          last        = "└╴",
          -- last          = "-╴",
          -- last       = "╰╴", -- rounded
          fold_open   = " ",
          fold_closed = " ",
          ws          = "  ",
        },
        folder_closed = " ",
        folder_open   = " ",
        kinds         = {
          Array         = " ",
          Boolean       = "󰨙 ",
          Class         = " ",
          Constant      = "󰏿 ",
          Constructor   = " ",
          Enum          = " ",
          EnumMember    = " ",
          Event         = " ",
          Field         = " ",
          File          = " ",
          Function      = "󰊕 ",
          Interface     = " ",
          Key           = " ",
          Method        = "󰊕 ",
          Module        = " ",
          Namespace     = "󰦮 ",
          Null          = " ",
          Number        = "󰎠 ",
          Object        = " ",
          Operator      = " ",
          Package       = " ",
          Property      = " ",
          String        = " ",
          Struct        = "󰆼 ",
          TypeParameter = " ",
          Variable      = "󰀫 ",
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    enabled = true,
    config = function()
      vim.keymap.set("n", "gk", function()
        require("treesitter-context").go_to_context(vim.v.count1)
      end, { silent = true })

      require("treesitter-context").setup({
        enable = true,           -- Enable this plugin (Can be enabled/disabled later via commands)
        max_lines = 1,           -- How many lines the window should span. Values <= 0 mean no limit.
        min_window_height = 1,   -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        line_numbers = true,
        multiline_threshold = 1, -- Maximum number of lines to show for a single context
        trim_scope = "outer",    -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        mode = "cursor",         -- Line used to calculate context. Choices: 'cursor', 'topline'
        -- Separator between context and content. Should be a single character string, like '-'.
        -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
        separator = nil,
        zindex = 20,     -- The Z-index of the context window
        on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        python = { "black" },
        nix = { "alejandra" },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        -- "query",
        "regex",
        "nix",
        "latex",
        -- "tsx",
        -- "typescript",
        "vim",
        "yaml",
        "just",
        "toml",
      },
    },
  },
  -- LSP keymaps
  {
    "williamboman/mason.nvim",
    enabled = false,
    opts = {
      ensure_installed = {},
      PATH = "append",
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    enabled = false,
    --[[ opts = {
        ensure_installed = {},
      },
      config = function()
        require("mason-lspconfig").setup({
          ensured_installed = {},
        })
      end, ]]
  },
  -- { "VonHeikemen/lsp-zero.nvim" },
  {
    "dundalek/lazy-lsp.nvim",
    enabled = true,
    dependencies = {
      "neovim/nvim-lspconfig",
      -- { "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      --[[ local lsp_zero = require("lsp-zero")

      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings to learn the available actions
        lsp_zero.default_keymaps({
          buffer = bufnr,
          preserve_mappings = false,
        })
      end) ]]

      require("lazy-lsp").setup({
        -- By default all available servers are set up. Exclude unwanted or misbehaving servers.
        excluded_servers = {
          "ccls",
          "zk",
          "ts_ls",
          "buf_ls",
          "c3_lsp",
          "sourcekit"
        },
        -- Alternatively specify preferred servers for a filetype (others will be ignored).
        preferred_servers = {
          markdown = {},
          python = { "pyright" },
        },
        prefer_local = true, -- Prefer locally installed servers over nix-shell
        -- Default config passed to all servers to specify on_attach callback and other options.
        default_config = {
          flags = {
            debounce_text_changes = 150,
          },
          -- on_attach = on_attach,
          -- capabilities = capabilities,
        },
        -- Override config for specific servers that will passed down to lspconfig setup.
        -- Note that the default_config will be merged with this specific configuration so you don't need to specify everything twice.
        configs = {
          lua_ls = {
            -- mason = false, -- set to false if you don't want this server to be installed with mason
            -- Use this to add any additional keymaps
            -- for specific lsp servers
            -- keys = {},
            settings = {
              Lua = {
                workspace = {
                  checkThirdParty = false,
                },
                codeLens = {
                  enable = true,
                },
                completion = {
                  callSnippet = "Replace",
                },
              },
            },
          },
          ltex = {
            settings = {
              ltex = {
                enabled = {
                  "bibtex",
                  "gitcommit",
                  "markdown",
                  "org",
                  "tex",
                  "restructuredtext",
                  "rsweave",
                  "latex",
                  "quarto",
                  "rmd",
                  "context",
                  "html",
                  "xhtml",
                },
                workspace = {
                  checkThirdParty = false,
                },
                codeLens = {
                  enable = false,
                },
                completion = {
                  callSnippet = "Replace",
                },
                dictionary = {
                  ["en-US"] = words,
                },
              },
            },
          },
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
          -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
          -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
          -- prefix = "icons",
        },
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = LazyVim.config.icons.diagnostics.Error,
            [vim.diagnostic.severity.WARN] = LazyVim.config.icons.diagnostics.Warn,
            [vim.diagnostic.severity.HINT] = LazyVim.config.icons.diagnostics.Hint,
            [vim.diagnostic.severity.INFO] = LazyVim.config.icons.diagnostics.Info,
          },
        },
      },
      -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
      -- Be aware that you also will need to properly configure your LSP server to
      -- provide the inlay hints.
      inlay_hints = {
        enabled = false,
      },
      -- Enable this to enable the builtin LSP code lenses on Neovim >= 0.10.0
      -- Be aware that you also will need to properly configure your LSP server to
      -- provide the code lenses.
      codelens = {
        enabled = false,
      },
      -- add any global capabilities here
      capabilities = {},
      -- options for vim.lsp.buf.format
      -- `bufnr` and `filter` is handled by the LazyVim formatter,
      -- but can be also overridden when specified
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
      servers = {},
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      setup = {
        -- example to setup with typescript.nvim
        -- tsserver = function(_, opts)
        --   require("typescript").setup({ server = opts })
        --   return true
        -- end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
    },
    -- config = function()
    -- end,
  },
}
