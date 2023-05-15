--Management
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

--Highlight on Yank
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
	group = 'YankHighlight',
	callback = function()
		vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '1000' })
	end
})

--Remove whitespace on Save
autocmd('BufWritePre', { pattern = '', command = ":%s/\\s\\+$//e" })

--Don't auto comment on new lines
autocmd('BufEnter', { pattern = '', command = 'set fo-=c fo-=r fo-=o' })
