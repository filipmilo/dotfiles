--Check for nvim-cmp
local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
	return
end

--Check for luasnips plugin
local luasnip_status_ok, luasnip = pcall(require, 'luasnip')
if not luasnip_status_ok then
	return
end

cmp.setup {
	--Load snippet support
  	snippet = {
		expand = function(args)
  	  	  luasnip.lsp_expand(args.body)
  	  	end,
  	},

	--Completion settings
	completion = {
		--completeopt = 'menu,menuone,preview,noinsert,noselect'
		keyword_length = 2
  	},

	-- Key mapping
	mapping = {
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
		},

	    -- Tab mapping
		['<Down>'] = function(fallback)
			if cmp.visible() then
    	  	  cmp.select_next_item()
    	  	elseif luasnip.expand_or_jumpable() then
    	  	  luasnip.expand_or_jump()
    	  	else
    	  	  fallback()
    	  	end
		end,
    	['<Up>'] = function(fallback)
			if cmp.visible() then
    	  	  cmp.select_prev_item()
    	  	elseif luasnip.jumpable(-1) then
    	  	  luasnip.jump(-1)
    	  	else
    	  	  fallback()
    	  	end
		end
	},

	-- Load sources, see: https://github.com/topics/nvim-cmp
  	sources = {
		{ name = 'nvim_lsp' },
  	  	{ name = 'luasnip' },
  	  	{ name = 'path' },
  	  	{ name = 'buffer' },
  	},
}
