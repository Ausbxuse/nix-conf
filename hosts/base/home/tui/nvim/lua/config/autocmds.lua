-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
vim.api.nvim_create_autocmd({ "FileType" }, { pattern = "tex", command = "TSBufDisable highlight" })
vim.api.nvim_create_autocmd("BufRead", {
  pattern = "Justfile",
  callback = function()
    vim.bo.filetype = "just"
  end,
})
vim.cmd([[
    "autocmd Filetype tex,markdown set wrap linebreak wrapmargin=8
    "autocmd Filetype tex,markdown setlocal foldmethod=expr | setlocal foldexpr=vimtex#fold#level(v:lnum) | setlocal foldtext=vimtex#fold#text()
    " "au BufRead *.vim setlocal foldmethod=marker
    " "autocmd Filetype lua setlocal foldmethod=marker
    autocmd TermOpen * startinsert
    autocmd TermOpen * setlocal nonumber norelativenumber

    " Remove trailing whitespaces automatically before save
    " augroup strip_ws
    "   autocmd BufWritePre * call utils#stripTrailingWhitespaces()
    " augroup END

    " save cursor's last position
    autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'  |   exe "normal! g`\""  | endif

    " for eslint
    "autocmd BufWritePre <buffer> <cmd>EslintFixAll<CR>

    let g:vimtex_view_method='zathura'
    let g:tex_flavor='latex'
    set conceallevel=2
    let g:vimtex_quickfix_enabled=0
    let g:vimtex_compiler_progname = 'nvr'
    let g:neovide_transparency=0.8

    let g:vimtex_syntax_conceal = {
          \ 'accents': 1,
          \ 'ligatures': 1,
          \ 'cites': 1,
          \ 'fancy': 1,
          \ 'spacing': 1,
          \ 'greek': 1,
          \ 'math_bounds': 1,
          \ 'math_delimiters': 1,
          \ 'math_fracs': 1,
          \ 'math_super_sub': 1,
          \ 'math_symbols': 1,
          \ 'sections': 1,
          \ 'styles': 1,
          \}

    
    let g:vimtex_syntax_conceal_cites = {
          \ 'type': 'brackets',
          \ 'icon': '📖',
          \ 'verbose': v:true,
          \}
    
let g:vim_markdown_math=1
let g:vim_markdown_conceal=2
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_override_foldtext = 0
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_auto_insert_bullets = 1
let g:vim_markdown_new_list_item_indent = 1

syn region mkdMath matchgroup=mkdDelimiter start="\\\@<!\\(" end="\\)"
syn region mkdMath matchgroup=mkdDelimiter start="\\\@<!\\\[" end="\\\]"

]])

--[[ -- Disable status bar in terminal mode
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  command = "setlocal nonumber norelativenumber | set laststatus=0",
})

-- Re-enable status bar when leaving terminal mode
vim.api.nvim_create_autocmd({ "BufLeave", "TermClose" }, {
  pattern = "term://*",
  command = "set laststatus=2",
}) ]]

--[[ local on_attach = function(client, bufnr)
  if not client._original_notify then
    client._original_notify = client.notify
    client.notify = function(method, params)
      if method ~= "textDocument/didChange" and vim.fn.mode() == "i" then
        return
      else
        client._original_notify(method, params)
      end
    end
  end
end
 ]]
local on_attach = function(client, bufnr)
  -- Preserve the original 'notify' method if it hasn't been done already
  if not client._original_notify then
    client._original_notify = client.notify

    -- Override the 'notify' method
    client.notify = function(method, params)
      -- Check if we are supposed to suppress notifications
      if client._suppress_notifications then
        return -- Skip sending notifications
      else
        -- Call the original 'notify' method if not suppressed
        client._original_notify(method, params)
      end
    end
  end

  -- Autocommand to suppress notifications in insert mode
  vim.api.nvim_create_autocmd({ "BufEnter", "InsertEnter" }, {
    buffer = bufnr,
    callback = function()
      client._suppress_notifications = true
    end,
  })

  -- Autocommand to allow notifications upon leaving insert mode
  vim.api.nvim_create_autocmd("InsertLeave", {
    buffer = bufnr,
    callback = function()
      client._suppress_notifications = false
      local text = table.concat(vim.api.nvim_buf_get_lines(bufnr, 0, -1, false), "\n")
      local params = {
        textDocument = {
          uri = vim.uri_from_bufnr(bufnr),
          version = 0, -- You might need to manage version numbers if your server requires it
        },
        contentChanges = { { text = text } },
      }
      -- Notify the server about the change
      client._original_notify("textDocument/didChange", params)
    end,
  })
end

local words = {}
for word in io.open(vim.fn.stdpath("config") .. "/spell/en.utf-8.add", "r"):lines() do
  table.insert(words, word)
end
require("lspconfig").ltex.setup({
  on_attach = on_attach,
  settings = {
    ltex = {
      language = "en",
      additionalRules = {
        -- enablePickyRules = true,
        languageModel = "~/.local/share/ngrams/",
      },
      completionEnabled = true,

      dictionary = {
        ["en-US"] = words,
      },
    },
  },
})
_G.auto_insert_checkbox = function()
  local current_line = vim.api.nvim_get_current_line()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  -- Capture the leading whitespace and the checkbox pattern
  local indent, checkbox = string.match(current_line, "^(%s*)(%-%s*%[%s%])")
  if checkbox and col == #vim.api.nvim_get_current_line() then
    -- If a checkbox is found, insert a new line with the same indentation followed by the checkbox
    vim.api.nvim_put({ "" }, "l", true, false)
    local new_line = indent .. "- [ ] "
    vim.api.nvim_put({ new_line }, "c", true, true)
  else
    -- If no checkbox, handle as a normal Enter by splitting at the cursor position
    local before_cursor = current_line:sub(1, col)
    local after_cursor = current_line:sub(col + 1)

    vim.api.nvim_set_current_line(before_cursor)
    vim.api.nvim_put({ after_cursor }, "l", true, false)
    if indent then
      vim.api.nvim_win_set_cursor(0, { row + 1, #indent })
    else
      vim.api.nvim_win_set_cursor(0, { row + 1, 0 })
    end
  end
end

-- Set up the autocmd
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.md",
  callback = function()
    vim.api.nvim_buf_set_keymap(
      0,
      "i",
      "<CR>",
      "<cmd>lua _G.auto_insert_checkbox()<CR>",
      { noremap = true, silent = true }
    )
    vim.api.nvim_buf_set_keymap(0, "x", "<CR>", "<cmd>ObsidianLinkNew<CR>", { noremap = true, silent = true })
  end,
})
