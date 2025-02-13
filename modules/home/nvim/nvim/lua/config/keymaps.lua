local function goto_buffer(n)
  local bufs = vim.fn.getbufinfo { buflisted = 1 }
  if bufs[n] then
    vim.api.nvim_cmd({ cmd = 'buffer', args = { bufs[n].bufnr } }, {})
  else
    vim.notify 'No such buffer'
  end
end

local keys = { 'q', 'w', 'e', 'r', 't', '1', '2', '3', '4', '5' }
for i, key in ipairs(keys) do
  vim.keymap.set('n', '<leader>' .. key, function()
    goto_buffer(i)
  end, { silent = true })
end

vim.keymap.set('i', '<c-c>', '<Esc>')
vim.keymap.set('n', '<Esc>', '<cmd>nohl<cr>')
vim.keymap.set('n', '<leader>x', '<cmd>bd<cr>')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', '<leader><leader>', '<cmd>ls<cr>:b ')
vim.keymap.set('n', '<c-d>', '<c-d>zz')
vim.keymap.set('n', '<c-u>', '<c-u>zz')
vim.keymap.set('n', 'H', '<cmd>bp<cr>')
vim.keymap.set('n', 'L', '<cmd>bn<cr>')
vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<leader>lq', vim.diagnostic.setloclist, { desc = 'Open diagnostic Quickfix [l]ist' })
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

vim.keymap.set('n', '<leader>=', '<cmd> lua Toggle_window()<CR>', { desc = 'Toggle Window' })

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

vim.keymap.set('n', '<leader>fc', Add_formatting_comments, { noremap = true, silent = true, desc = 'Add disable-formatting comments around current line' })
