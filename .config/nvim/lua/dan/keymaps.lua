local utils = require 'dan.utils'
local map = utils.map

local mappings = {
	['i,n,v'] = {
		['<C-s>'] = ':w<CR>',
		['<C-q>'] = ':qall!<CR>',
		['<C-x>'] = ':BufferClose<CR>',
	},
	['i'] = {
		['jk'] = '<ESC>',
		['<A-j>'] = '<ESC>:m .+1<CR>==gi',
		['<A-k>'] = '<ESC>:m .-2<CR>==gi',
	},
	['x'] = {
		['<A-j>'] = ":m '>+1<CR>gv-gv",
		['<A-k>'] = ":m '<-2<CR>gv-gv",
	},
	['v'] = {
		['>'] = '>gv',
		['<'] = '<gv',
	},
	['n'] = {
		['<A-j>'] = ':m .+1<CR>==',
		['<A-k>'] = ':m .-2<CR>==',
		['<C-h>'] = '<C-w>h',
		['<C-j>'] = '<C-w>j',
		['<C-k>'] = '<C-w>k',
		['<C-l>'] = '<C-w>l',
		['H'] = ':BufferPrevious<CR>',
		['L'] = ':BufferNext<CR>',
	},
}

for mode, maps in pairs(mappings) do
	local mode_list = vim.fn.split(mode, ',')
	for lhs, rhs in pairs(maps) do
		-- skip a mapping if it requires barbar and barbar isn't setup
		if rhs:match '^Buffer' and pcall(require, 'bufferline') then
			goto next
		end

		map(mode_list, lhs, rhs)
		::next::
	end
end

local plugins = {
	wk = pcall(require, 'which-key'),
	telescope = pcall(require, 'telescope.builtin'),
	packer = pcall(require, 'packer'),
}

for _, val in pairs(plugins) do
	if not val then
		return
	end
end

local wk = require 'which-key'
local telescope = require 'telescope.builtin'
local packer = require 'packer'

local format_buffer = function()
	vim.lsp.buf.format {
		filter = function(client)
			local will_format = {
				['null-ls'] = true,
			}
			return will_format[client.name]
		end,
		bufnr = 0,
    timeout_ms = 5000
	}
end

wk.register({
	e = { ':NeoTreeFocusToggle<CR>', 'Toggle file explorer' },
	r = { utils.reload, 'Reload configuration' },
	t = {
		name = 'Toggles',
		w = {
			function()
				vim.opt.wrap = not vim.opt.wrap:get()
			end,
			'Toggle line wrap',
		},
		h = {
			function()
				vim.opt.hlsearch = not vim.opt.hlsearch:get()
			end,
			'Toggle search highlight',
		},
	},
	b = {
		name = 'Buffer management',
		p = { ':BufferPrevious<CR>', 'Go to previous buffer' },
		n = { ':BufferNext<CR>', 'Go to next buffer' },
		[','] = { ':BufferMovePrevious<CR>', 'Move buffer to the left' },
		['.'] = { ':BufferMoveNext<CR>', 'Move buffer to the right' },
		x = {
			name = 'Close',
			x = { ':BufferClose<CR>', 'current buffer' },
			a = { ':BufferWipeout<CR>', 'all buffers' },
			c = { ':BufferCloseAllButCurrent<CR>', 'all buffers except current' },
			l = { ':BufferCloseBuffersLeft<CR>', 'all buffers to the left of current' },
			r = { ':BufferCloseBuffersRight<CR>', 'all buffers to the right of current' },
		},
		f = { format_buffer, 'Format buffer' },
	},
	f = {
		name = 'Find',
		f = { telescope.find_files, 'file' },
		w = { telescope.live_grep, 'word' },
		o = { telescope.oldfiles, 'recently opened file' },
		k = { telescope.keymaps, 'keymaps' },
		c = { telescope.colorscheme, 'colorscheme' },
	},
	l = {
		name = 'LSP',
		r = { telescope.lsp_references, 'References' },
		e = { telescope.diagnostics, 'Diagnostics' },
		i = { telescope.lsp_implementations, 'Implementations' },
		d = { telescope.lsp_definitions, 'Definitions' },
		D = { telescope.lsp_type_definitions, 'Type definitions' },
	},
	p = {
		name = 'Packer',
		s = { packer.sync, 'Sync' },
		c = { packer.compile, 'Compile' },
		i = { packer.install, 'Install' },
	},
	z = { ':LazyGit<CR>', 'Lazygit' },
	w = {
		name = 'Vimwiki',
		[' '] = 'Diary',
	},
}, { prefix = '<leader>' })
