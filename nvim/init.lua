---------------------------------------------
---------------------------------------------
--  ___ _   _ ___ _____ _    _   _   _     --
-- |_ _| \ | |_ _|_   _| |  | | | | / \    --
--  | ||  \| || |  | | | |  | | | |/ _ \   --
--  | || |\  || |  | |_| |__| |_| / ___ \  --
-- |___|_| \_|___| |_(_)_____\___/_/   \_\ --
--                                         --
---------------------------------------------
---------------------------------------------


---------------------------------------------
--              -MANAGEMENT-               --
---------------------------------------------
local g = vim.g
local opt = vim.opt

---------------------------------------------
--               -OPTIONS-                 --
---------------------------------------------
--General
opt.mouse = 'a'
opt.swapfile = false
opt.completeopt = 'menu,menuone,preview,noinsert,noselect'

--User Interface
opt.relativenumber = true
opt.number = true
opt.showmatch = true
opt.splitright = true
opt.splitbelow = true
opt.smartcase = true
opt.linebreak = true

--Indentation
opt.smartindent = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.smarttab = true
opt.softtabstop = 4

--Scrolling
opt.scrolloff = 10
opt.sidescrolloff = 10
opt.lazyredraw = true

--Encoding
opt.encoding = 'UTF-8'

--Disable netrw default file explorer
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

---------------------------------------------
--               -LUA_LIBS-                --
---------------------------------------------
require('core/keymaps')				--Remaps
require('core/autocmds')			--Automatic commands
require('packer_init')				--Plugins
require('plugins/nvim-cmp')			--nvim-cmp
require('plugins/whichkey')			--whichkey
require('plugins/nvimtree')			--nvimtree
require('lsp/lspconfig')			--Autocomplete servers

-- treesitter
require'nvim-treesitter.configs'.setup {
	ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "go", "typescript", "proto" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

require("tokyonight").setup({
  on_highlights = function(hl, c)
    local prompt = "#2d3149"
    hl.TelescopeNormal = {
      bg = c.bg_dark,
      fg = c.fg_dark,
    }
    hl.TelescopeBorder = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
    hl.TelescopePromptNormal = {
      bg = prompt,
    }
    hl.TelescopePromptBorder = {
      bg = prompt,
      fg = prompt,
    }
    hl.TelescopePromptTitle = {
      bg = prompt,
      fg = prompt,
    }
    hl.TelescopePreviewTitle = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
    hl.TelescopeResultsTitle = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
  end,
})
---------------------------------------------
--               -DESIGN-                  --
---------------------------------------------
g.airline_theme='base16'
vim.api.nvim_command('hi NormalFloat ctermfg=LightGrey')
vim.api.nvim_command('hi Pmenu guibg=LightGrey')
vim.api.nvim_command('colorscheme tokyonight')
