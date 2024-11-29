return {
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
	{
		'brenoprata10/nvim-highlight-colors',
		config = function()
			require('nvim-highlight-colors').setup {
				enable_named_colors = false,
			}
		end,
	},
	{                     -- Useful plugin to show you pending keybinds.
		'folke/which-key.nvim',
		event = 'VimEnter', -- Sets the loading event to 'VimEnter'
		opts = {
			icons = {
				-- set icon mappings to true if you have a Nerd Font
				mappings = vim.g.have_nerd_font,
				-- If you are using a Nerd Font: set icons.keys to an empty table which will use the
				-- default which-key.nvim defined Nerd Font icons, otherwise define a string table
				keys = vim.g.have_nerd_font and {} or {
					Up = '<Up> ',
					Down = '<Down> ',
					Left = '<Left> ',
					Right = '<Right> ',
					C = '<C-…> ',
					M = '<M-…> ',
					D = '<D-…> ',
					S = '<S-…> ',
					CR = '<CR> ',
					Esc = '<Esc> ',
					ScrollWheelDown = '<ScrollWheelDown> ',
					ScrollWheelUp = '<ScrollWheelUp> ',
					NL = '<NL> ',
					BS = '<BS> ',
					Space = '<Space> ',
					Tab = '<Tab> ',
					F1 = '<F1>',
					F2 = '<F2>',
					F3 = '<F3>',
					F4 = '<F4>',
					F5 = '<F5>',
					F6 = '<F6>',
					F7 = '<F7>',
					F8 = '<F8>',
					F9 = '<F9>',
					F10 = '<F10>',
					F11 = '<F11>',
					F12 = '<F12>',
				},
			},

			-- Document existing key chains
			spec = {
				{ '<leader>c', group = '[C]ode',     mode = { 'n', 'x' } },
				{ '<leader>d', group = '[D]ocument' },
				{ '<leader>r', group = '[R]ename' },
				{ '<leader>s', group = '[S]earch' },
				{ '<leader>w', group = '[W]orkspace' },
				{ '<leader>t', group = '[T]oggle' },
				{ '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
			},
		},
	},
}
