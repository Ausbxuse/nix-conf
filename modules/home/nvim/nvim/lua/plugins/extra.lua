return {
  {
    'rmagatti/auto-session',
    lazy = false,

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      suppressed_dirs = { '~/', '~/Downloads', '/' },
      -- log_level = 'debug',
    },
  },
  {
    'lervag/vimtex',
    enabled = true,
    ft = 'tex',
    config = function()
      vim.cmd [[

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

]]
    end,
  },
  {
    'iamcco/markdown-preview.nvim',
    ft = 'md',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = function()
      require('lazy').load { plugins = { 'markdown-preview.nvim' } }
      vim.fn['mkdp#util#install']()
    end,
    keys = {
      {
        '<leader>cp',
        ft = 'markdown',
        '<cmd>MarkdownPreviewToggle<cr>',
        desc = 'Markdown Preview',
      },
    },
    config = function()
      vim.cmd [[do FileType]]
    end,
  },
}
