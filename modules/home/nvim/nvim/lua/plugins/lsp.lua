return {
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
    'dundalek/lazy-lsp.nvim',
    enabled = true,
    dependencies = {
      'neovim/nvim-lspconfig',
      'Saghen/blink.cmp',
    },
    config = function()
      -- Customize the LSP signature help window
      local lspconfig_defaults = require('lspconfig').util.default_config
      lspconfig_defaults.capabilities = require('blink.cmp').get_lsp_capabilities(lspconfig_defaults.capabilities)
      local fzf = require 'fzf-lua'

      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = function(event)
          -- In this case, we create a function that lets us more easily define mappings specific
          -- for LSP related items. It sets the mode, buffer and description for us each time.
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- Jump to the definition of the word under your cursor.
          --  This is where a variable was first declared, or where a function is defined, etc.
          --  To jump back, press <C-t>.
          map('gd', fzf.lsp_definitions, '[G]oto [D]efinition')
          map('gr', fzf.lsp_references, '[G]oto [R]eferences')
          -- Jump to the implementation of the word under your cursor.
          --  Useful when your language has ways of declaring types without an actual implementation.
          map('gi', fzf.lsp_implementations, '[G]oto [I]mplementation')
          -- Jump to the type of the word under your cursor.
          --  Useful when you're not sure what type a variable is and you want to see
          --  the definition of its *type*, not where it was *defined*.
          map('<leader>ltd', fzf.lsp_typedefs, 'Type [D]efinition')
          -- Fuzzy find all the symbols in your current document.
          --  Symbols are things like variables, functions, types, etc.
          map('<leader>ds', fzf.lsp_document_symbols, '[D]ocument [S]ymbols')
          -- Fuzzy find all the symbols in your current workspace.
          --  Similar to document symbols, except searches over your entire project.
          map('<leader>ws', fzf.lsp_live_workspace_symbols, '[W]orkspace [S]ymbols')
          -- Rename the variable under your cursor.
          --  Most Language Servers support renaming across files, etc.
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
          map('K', vim.lsp.buf.hover, 'Loo[K]up')
          -- Execute a code action, usually your cursor needs to be on top of an error
          -- or a suggestion from your LSP for this to activate.
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
          -- WARN: This is not Goto Definition, this is Goto Declaration.
          --  For example, in C this would take you to the header.
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          map('gs', vim.lsp.buf.signature_help, 'Signature [H]elp')
          map('<C-p>', vim.diagnostic.goto_prev, 'LSP diagnostic Prev')
          map('<C-n>', vim.diagnostic.goto_next, 'LSP diagnostic Next')
          vim.keymap.set('i', '<c-s>', vim.lsp.buf.signature_help)

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
              end,
            })
          end

          -- The following code creates a keymap to toggle inlay hints in your
          -- code, if the language server you are using supports them
          --
          --
          -- This may be unwanted, since they displace some of your code
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
      vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
      vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
      vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })

      vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'single', max_width = 60, max_height = 40 })

      vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'single', max_width = 60, max_height = 40 })

      vim.diagnostic.config {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = 'if_many',
          prefix = '●',
        },
        severity_sort = true,
        signs = {
          [vim.diagnostic.severity.ERROR] = '',
          [vim.diagnostic.severity.WARN] = '',
          [vim.diagnostic.severity.HINT] = '',
          [vim.diagnostic.severity.INFO] = '',
        },
      }
      require('lspconfig').util.default_config.on_init = function(client, _)
        client.server_capabilities.semanticTokensProvider = nil
      end

      -- TODO: add inlay hints and code lens
      require('lazy-lsp').setup {
        -- By default all available servers are set up. Exclude unwanted or misbehaving servers.
        excluded_servers = {
          'ruff_lsp',
          'ccls',
          'zk',
          'ts_ls',
          'buf_ls',
          'c3_lsp',
          'sourcekit',
        },
        -- Alternatively specify preferred servers for a filetype (others will be ignored).
        preferred_servers = {
          markdown = {},
          python = { 'basedpyright' },
          netrw = {},
        },
        prefer_local = true, -- Prefer locally installed servers over nix-shell
        -- Default config passed to all servers to specify on_attach callback and other options.
        default_config = {
          flags = {
            debounce_text_changes = 150,
          },
        },
        -- Override config for specific servers that will passed down to lspconfig setup.
        -- Note that the default_config will be merged with this specific configuration so you don't need to specify everything twice.
        configs = {
          basedpyright = {
            settings = {
              basedpyright = {
                analysis = {
                  typeCheckingMode = 'basic',
                  logLevel = 'error',
                },
              },
              hints = {
                enable = true,
              },
              codeLens = {
                enable = true,
              },
            },
          },
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
                hint = {
                  enable = true,
                },
                completion = {
                  displayContext = 1,
                  callSnippet = 'Both',
                },
              },
            },
          },
          ltex = {
            settings = {
              ltex = {
                enabled = {
                  'bibtex',
                  'gitcommit',
                  'markdown',
                  'org',
                  'tex',
                  'restructuredtext',
                  'rsweave',
                  'latex',
                  'quarto',
                  'rmd',
                  'context',
                  'html',
                  'xhtml',
                },
                workspace = {
                  checkThirdParty = false,
                },
                codeLens = {
                  enable = true,
                },
                completion = {
                  callSnippet = 'Replace',
                },
                --[[ dictionary = {
									['en-US'] = words,
								}, ]]
              },
            },
          },
        },
      }
    end,
  },
}
