local function goto_buffer(n)
  local buffers = {}
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.fn.buflisted(buf) == 1 then
      table.insert(buffers, buf)
    end
  end
  if n <= #buffers then
    vim.api.nvim_set_current_buf(buffers[n])
  end
end

vim.keymap.set('n', '<leader>q', function()
  goto_buffer(1)
end, { silent = true })
vim.keymap.set('n', '<leader>w', function()
  goto_buffer(2)
end, { silent = true })
vim.keymap.set('n', '<leader>e', function()
  goto_buffer(3)
end, { silent = true })
vim.keymap.set('n', '<leader>r', function()
  goto_buffer(4)
end, { silent = true })
vim.keymap.set('n', '<leader>t', function()
  goto_buffer(5)
end, { silent = true })

vim.keymap.set('i', '<c-c>', '<Esc>')
vim.keymap.set('n', '<Esc>', '<cmd>nohl<cr>')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', '<c-d>', '<c-d>zz')
vim.keymap.set('n', '<c-u>', '<c-u>zz')
vim.keymap.set('n', 'H', '<cmd>bp<cr>')
vim.keymap.set('n', 'L', '<cmd>bn<cr>')
vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', '<leader><tab>', '<C-^>', { desc = 'Alt-tab prev buffer' })
vim.keymap.set('n', '<leader>u', '<cmd> UndotreeToggle <cr>', { desc = 'Toggle Undotree' })
vim.keymap.set('x', 'K', ":move '<-2<CR>gv=gv")
vim.keymap.set('x', 'J', ":move '>+1<CR>gv=gv")
vim.keymap.set('x', 'p', 'P', { desc = 'Better paste' })

local prefixes = "m'"
local letters = 'abcdefghijklmnopqrstuvwxyz'
for i = 1, #prefixes do
  local prefix = prefixes:sub(i, i)
  for j = 1, #letters do
    local lower_letter = letters:sub(j, j)
    local upper_letter = string.upper(lower_letter)
    vim.keymap.set({ 'n', 'v' }, prefix .. lower_letter, prefix .. upper_letter, { desc = 'Mark ' .. upper_letter })
  end
end

function Toggle_window()
  if vim.g.help_window_maximized then
    vim.api.nvim_command 'wincmd =' -- Equalizes the window sizes
    vim.g.help_window_maximized = false
  else
    vim.api.nvim_command 'wincmd |' -- Maximize width
    vim.api.nvim_command 'wincmd _' -- Maximize height
    vim.g.help_window_maximized = true
  end
end

vim.keymap.set('n', '<leader>=', ':silent lua Toggle_window()<CR>', { desc = 'Toggle Window' })

local comment_styles = {
  lua = { start = '-- stylua: ignore start', stop = '-- stylua: ignore end' },
  python = { start = '# fmt: off', stop = '# fmt: on' },
  markdown = { start = '<!-- prettier-ignore-start -->', stop = '<!-- prettier-ignore-end -->' },
  javascript = { start = '// prettier-ignore-start', stop = '// prettier-ignore-end' },
  typescript = { start = '// prettier-ignore-start', stop = '// prettier-ignore-end' },
}

function Add_formatting_comments()
  local ft = vim.bo.filetype
  local style = comment_styles[ft]
  if not style then
    vim.notify('No comment style defined for filetype: ' .. ft, vim.log.levels.WARN)
    return
  end

  local cursor_line = vim.fn.line '.'
  vim.api.nvim_buf_set_lines(0, cursor_line - 1, cursor_line - 1, false, { style.start })
  vim.api.nvim_buf_set_lines(0, cursor_line, cursor_line, false, { style.stop })
end

vim.keymap.set('n', '<leader>df', Add_formatting_comments, { noremap = true, silent = true, desc = 'Add disable-formatting comments around current line' })
