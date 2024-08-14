local words = {}
for word in io.open(vim.fn.stdpath("config") .. "/spell/en.utf-8.add", "r"):lines() do
  table.insert(words, word)
end

return {
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
  -- {
  --   "williamboman/mason.nvim",
  --   enabled = false,
  --   opts = {
  --     ensure_installed = {},
  --     PATH = "append",
  --   },
  -- },
  -- {
  --   "williamboman/mason-lspconfig.nvim",
  --   enabled = false,
  --   --[[ opts = {
  --       ensure_installed = {},
  --     },
  --     config = function()
  --       require("mason-lspconfig").setup({
  --         ensured_installed = {},
  --       })
  --     end, ]]
  -- },
  -- { "VonHeikemen/lsp-zero.nvim" },
  -- {
  --   "dundalek/lazy-lsp.nvim",
  --   enabled = false,
  --   dependencies = {
  --     "neovim/nvim-lspconfig",
  --     { "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
  --     "hrsh7th/cmp-nvim-lsp",
  --     "hrsh7th/nvim-cmp",
  --   },
  --   config = function()
  --     --[[ local lsp_zero = require("lsp-zero")

  --   lsp_zero.on_attach(function(client, bufnr)
  --     -- see :help lsp-zero-keybindings to learn the available actions
  --     lsp_zero.default_keymaps({
  --       buffer = bufnr,
  --       preserve_mappings = false
  --     })
  --   end) ]]

  --     require("lazy-lsp").setup({})
  --   end,
  -- },
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
      servers = {
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
