vim.keymap.set('n', '<Esc>', "<cmd>nohl|lua require('notify').dismiss()<CR>")
-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('x', 'K', ":move '<-2<CR>gv=gv")
vim.keymap.set('x', 'J', ":move '>+1<CR>gv=gv")

vim.keymap.set('x', 'p', 'P', { desc = 'Better paste' })

function Toggle_window()
  if vim.g.help_window_maximized then
    vim.api.nvim_command 'wincmd =' -- Equalizes the window sizes
    vim.g.help_window_maximized = false
  else
    vim.api.nvim_command 'wincmd |' -- Maximize width
    vim.api.nvim_command 'wincmd _' -- Maximize height
    vim.g.help_window_maximized = true
    -- vim.api.nvim_win_set_width(0, vim.o.columns) -- Use the full width of the Neovim window
    -- vim.api.nvim_win_set_height(0, vim.o.lines - 1) -- Use the full height, adjusting for the command line
  end
end

vim.keymap.set('n', '<leader>=', ':silent lua Toggle_window()<CR>', { desc = 'Toggle Window' })
