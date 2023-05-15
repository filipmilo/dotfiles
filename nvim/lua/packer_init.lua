-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		'git',
		'clone',
  	  	'--depth',
  	  	'1',
  	  	'https://github.com/wbthomason/packer.nvim',
  	  	install_path
  	})
  	vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
end

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
	return
end

-- Plugins
return packer.startup(function(use)
	--Itself
	use 'wbthomason/packer.nvim'

	-- Library for some other plugins.
	use 'nvim-lua/plenary.nvim'

	--Telescope
	use 'nvim-treesitter/nvim-treesitter' -- Syntax highlighting.
	use 'nvim-telescope/telescope.nvim' -- Fuzzy list search.
	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' } -- Telescope fzf support.
	use 'LukasPietzschmann/telescope-tabs' -- Use telescope to go through tabs.

	-- Better command line.
	use 'vim-airline/vim-airline'
	use 'vim-airline/vim-airline-themes'

	-- Terminal inside vim.
	use 'voldikss/vim-floaterm'

	-- Comment lines with gcc or gc for visual selection.
	use 'tpope/vim-commentary'

	-- Displays possible key combinations.
	use 'folke/which-key.nvim'

	-- Completion
	use 'neovim/nvim-lspconfig'
	use {
    'hrsh7th/nvim-cmp',
    requires = {
		'L3MON4D3/LuaSnip',
      	'hrsh7th/cmp-nvim-lsp',
      	'hrsh7th/cmp-path',
      	'hrsh7th/cmp-buffer',
      	'saadparwaiz1/cmp_luasnip',
		},
	}

	-- Nvim-tree file explorer
	use {
	  'nvim-tree/nvim-tree.lua',
	  requires = {
		'nvim-tree/nvim-web-devicons', -- optional
	  },
	  config = function()
		require("nvim-tree").setup {}
	  end
	}

	-- TokyoNight theme
	use 'folke/tokyonight.nvim'

end)
