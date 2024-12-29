vim.keymap.set('n', '<Esc>', "<cmd>nohl|lua require('notify').dismiss()<CR>")
vim.keymap.set('i', '<S-Tab>', '<C-d>')
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
-- vim.keymap.set('n', '<leader>n', function()
--     if vim.bo.filetype == 'netrw' then
-- 			vim.cmd([[b#]])
--     else
--         vim.cmd([[Explore]])
--     end
-- end, { noremap = true, silent = true })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', '<c-d>', '<c-d>zz')
vim.keymap.set('n', '<c-u>', '<c-u>zz')

vim.keymap.set('x', 'K', ":move '<-2<CR>gv=gv")
vim.keymap.set('x', 'J', ":move '>+1<CR>gv=gv")
vim.keymap.set('n', 'H', '<cmd>bp<cr>')
vim.keymap.set('n', 'L', '<cmd>bn<cr>')
vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('x', 'p', 'P', { desc = 'Better paste' })

vim.keymap.set('n', '<leader><tab>', '<C-^>', { desc = 'Alt-tab prev buffer' })
vim.keymap.set('n', '<leader>u', '<cmd> UndotreeToggle <cr>', { desc = 'Toggle Undotree' })
vim.keymap.set('n', '<leader>p', '<cmd> lua require("dropbar.api").pick() <cr>', { desc = 'Toggle Undotree' })

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
