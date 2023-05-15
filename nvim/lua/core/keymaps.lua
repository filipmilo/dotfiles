--Function for key mapping
local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
  	if opts then
  	  options = vim.tbl_extend('force', options, opts)
  	end
  	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--Leader
vim.g.mapleader = ' '
map('n', '<Space>', '<Nop>')

--Remove Bullshit
map('n', 'Q', '<Nop>')

--Management
map('n', '<Leader>q', ':q<CR>', { desc = '[Buffer]Quit' })
map('n', '<Leader>w', ':w<CR>', { desc = '[Buffer]Save' })
map('n', '<Leader>a', ':wa<CR>', { desc = 'Save All' })

--Clipboard
map('v', '<C-c>', '"+y')
map('v', '<C-x>', '"+c')
map('v', '<C-v>', 'c<Esc>"+p')

--Tabs
map('n', '<Leader><Tab><Tab>', ':tabe<CR>', { desc = '[Tab]New' })
map('n', '<Leader><Tab><Right>', 'gt', { desc = '[Tab]Move Right' })
map('n', '<Leader><Tab><Left>', 'gT', { desc = '[Tab]Move Left' })
map('n', '<Leader><Tab>c', ':tabonly<CR>', { desc = '[Tab]Close All Other Tabs' })
map('n', '<Leader><Tab>t', '<C-w>T', { desc = '[Tab]Move To New Tab' })

--File Explorer
--map('n', '<Leader>ee', ':Ex<CR>', { desc = '[Buffer]File Explorer' })
--map('n', '<Leader>ew', '<C-w>v:Ex<CR>', { desc = '[Window]File Explorer' })
--map('n', '<Leader>et', ':Tex<CR>', { desc = '[Tab]File Explorer' })
map('n', '<Leader>ee', ':NvimTreeToggle<cr>', { desc = '[Buffer]File Explorer' })

--Indentation
map('v', '<', '<gv')
map('v', '>', '>gv')

--Motions
map('n', '<C-u>', '<C-u>zz')
map('n', '<C-d>', '<C-d>zz')

--Commands for word backwards fix.
map('n', 'db', 'bdw')
map('n', 'cb', 'bcw')

--Move Lines
map('v', '<C-Up>', ":m '<-2<CR>gv=gv")
map('v', '<C-Down>', ":m '>+1<CR>gv=gv")

--Search
map('n', 'n', "nzzzv")
map('n', 'N', "Nzzzv")

--Telescope
map('n', '<Leader>ff', ':Telescope find_files hidden=true<CR>', { desc = '[Buffer]Fuzzy Find Files' })
map('n', '<Leader>fw', '<C-w>v:Telescope find_files hidden=true<CR>', { desc = '[New Window]Fuzzy Find Files' })
map('n', '<Leader>ft', ':tabe<CR>:Telescope find_files hidden=true<CR>', { desc = '[New Tab]Fuzzy Find Files' })

map('n', '<Leader>FF', ':Telescope find_files hidden=true cwd=', { desc = '[Buffer]Fuzzy Find Files Somewhere Else' })
map('n', '<Leader>FW', '<C-w>v:Telescope find_files hidden=true cwd=', { desc = '[New Window]Fuzzy Find Files Somewhere Else' })
map('n', '<Leader>FT', ':tabe<CR>:Telescope find_files hidden=true cwd=', { desc = '[New Tab]Fuzzy Find Files Somewhere Else' })

map('n', '<Leader>/', ':Telescope current_buffer_fuzzy_find<CR>', { desc = '[Buffer]Fuzzy Search' })
map('n', '<Leader><tab>f', ':Telescope telescope-tabs list_tabs<CR>', { desc = '[Session]Tab List' })

--Floaterm
vim.g.floaterm_title = ''
vim.g.floaterm_autoinsert = 1
vim.g.floaterm_width = 0.7
vim.g.floaterm_height = 0.7
vim.g.floaterm_autoclose = 2

map('n', '<Leader>t', ':FloatermToggle<CR>', { desc = 'Terminal Open' })
map('t', '<Leader>t', '<C-\\><C-n>:FloatermToggle<CR>', { desc = 'Terminal Close' })
map('t', '<Leader>k', '<C-\\><C-n>:FloatermKill<CR>', { desc = 'Terminal Kill' })
