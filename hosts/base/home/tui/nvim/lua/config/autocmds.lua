-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

_G.auto_insert_checkbox = function()
  local current_line = vim.api.nvim_get_current_line()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  -- Capture the leading whitespace and the checkbox pattern
  local indent, checkbox = string.match(current_line, '^(%s*)(%-%s*%[%s%])')
  if checkbox and col == #vim.api.nvim_get_current_line() then
    -- If a checkbox is found, insert a new line with the same indentation followed by the checkbox
    vim.api.nvim_put({ '' }, 'l', true, false)
    local new_line = indent .. '- [ ] '
    vim.api.nvim_put({ new_line }, 'c', true, true)
  else
    -- If no checkbox, handle as a normal Enter by splitting at the cursor position
    local before_cursor = current_line:sub(1, col)
    local after_cursor = current_line:sub(col + 1)

    vim.api.nvim_set_current_line(before_cursor)
    vim.api.nvim_put({ after_cursor }, 'l', true, false)
    if indent then
      vim.api.nvim_win_set_cursor(0, { row + 1, #indent })
    else
      vim.api.nvim_win_set_cursor(0, { row + 1, 0 })
    end
  end
end

_G.auto_check_checkbox = function()
  local current_line = vim.api.nvim_get_current_line()
  local indent, checkbox = string.match(current_line, '^(%s*)%-(%s*%[%s*[xX ]?%s*%])')

  if checkbox then
    local new_checkbox
    if string.match(checkbox, '%[x%]') or string.match(checkbox, '%[X%]') then
      new_checkbox = string.gsub(checkbox, '%[x%]', '[ ]')
      new_checkbox = string.gsub(new_checkbox, '%[X%]', '[ ]')
    else
      new_checkbox = string.gsub(checkbox, '%[%s*%]', '[x]')
    end

    local updated_line = string.gsub(current_line, '^(%s*)%-(%s*%[%s*[xX ]?%s*%])', indent .. '-' .. new_checkbox)
    vim.api.nvim_set_current_line(updated_line)
  end
end

-- Set up the autocmd
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*.md',
  callback = function()
    vim.api.nvim_buf_set_keymap(0, 'i', '<CR>', '<cmd>lua _G.auto_insert_checkbox()<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, 'n', '<CR>', '<cmd>lua _G.auto_check_checkbox()<CR>', { noremap = true, silent = true })
  end,
})

vim.g.netrw_banner = 0
vim.g.netrw_sizestyle = "h"
vim.cmd [[
" save last position in file
    autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'  |   exe "normal! g`\""  | endif
		autocmd filetype netrw nmap <buffer> h -
		autocmd filetype netrw nmap <buffer> l <CR>
		autocmd filetype netrw nmap <buffer> a %
		autocmd filetype netrw nmap <buffer> A %
		autocmd filetype netrw nmap <buffer> r R
		autocmd filetype netrw nmap <buffer> . gh
		let g:netrw_list_hide= '.*\.swp$,*/tmp/*,*.so,*.swp,*.zip,*.git,^\.\.\=/\=$'
]]
