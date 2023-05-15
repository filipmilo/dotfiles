--Check for plugin and set local
local wk = require('which-key')

--Instantly load which-key
vim.opt.timeoutlen = 100

--Overwrites keybindings
local mappings = {
}

--Activate on <Leader>
local opts = {
	prefix = '<Leader>'
}

wk.register(mappings, opts)
