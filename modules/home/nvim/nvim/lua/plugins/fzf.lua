return {
  {
    'ibhagwan/fzf-lua',
    -- dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local fzf = require 'fzf-lua'
      fzf.setup {
        fzf_colors = {
          false, -- inherit fzf colors that aren't specified below from
          ['scrollbar'] = { 'fg', { 'SignColumn', 'Normal' }, 'bold' },
          ['prompt'] = { 'fg', 'Conditional' },
          ['marker'] = { 'fg', 'Keyword' },
          ['fg'] = { 'fg', 'MsgArea' },
          ['bg'] = { 'bg', 'SpecialKey' },
          ['hl'] = { 'fg', 'Debug' },
          ['fg+'] = { 'fg', 'Normal' },
          ['bg+'] = { 'bg', { 'CursorLine', 'MsgArea' } },
          ['hl+'] = { 'fg', 'Debug' },
          ['info'] = { 'fg', 'PreProc' },
        },
        winopts = {
          file_icons = false,
          height = 0.8,
          width = 1,
          border = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
          backdrop = 100,
          preview = {
            border = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
          },
        },
        buffers = {
          previewer = false,
          mru = true,
          winopts = {
            -- height = 0.4,
            row = 1,
            col = 0,
          },
        },
        previewer = {
          border = 'noborder',
        },
        files = {
          previewer = false,
          actions = {
            ['ctrl-g'] = false,
          },
        },
        keymaps = {
          winopts = { preview = { layout = 'horizontal' } },
        },
        oldfiles = {
          previewer = false,
        },
        blines = {
          file_icons = false,
          previewer = false,
          show_bufname = false, -- display buffer name
          show_unloaded = false, -- show unloaded buffers
        },
      }

      vim.keymap.set('n', '<leader>sh', fzf.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>fk', fzf.keymaps, { desc = '[F]uzzy find [K]eymaps' })
      vim.keymap.set('n', '<leader>ff', function()
        fzf.files()
      end, { desc = '[F]uzzy [F]iles' })
      vim.keymap.set('n', '<leader>fs', fzf.grep_cword, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>fg', fzf.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>fd', fzf.diagnostics_workspace, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>fS', function()
        fzf.grep_cWORD()
      end, { desc = '[f]ind [S]earch word' })
      vim.keymap.set('n', '<leader>fr', fzf.oldfiles, { desc = '[S]earch Recent Files ' })
      vim.keymap.set('n', '<leader>o', fzf.lsp_document_symbols, { desc = 'Symb[o]ls ' })
      vim.keymap.set('n', '<leader>b', fzf.buffers, { desc = 'Find existing buffers' })

      vim.keymap.set('n', '<leader>/', function()
        fzf.blines()
      end, { desc = '[/] Fuzzily search in current buffer' })
    end,
  },
}
