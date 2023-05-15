--Check if plugin exists
local lsp_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lsp_status_ok then
	return
end

local cmp_status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_status_ok then
	return
end

--Diagnostic options
vim.diagnostic.config({
	update_in_insert = true,
	float = {
	focusable = false,
	style = "minimal",
	border = "rounded",
	source = "always",
	header = "",
	prefix = "",
	},
})

--Show line diagnostics automatically in hover window
vim.cmd([[
	autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, { focus = false })
]])

--Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

--Use an on_attach function to only map the following keys after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	  --Highlighting references
	if client.server_capabilities.document_highlight then
		vim.api.nvim_exec([[
			augroup lsp_document_highlight
			autocmd! * <buffer>
			autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
			autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
			augroup END
		]], false)
	end

	--Enable completion triggered by <c-x><c-o>
	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	--Mappings.
	local opts = { noremap = true, silent = true }

	--See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', { noremap = true, silent = true, desc = '[LSP]Go To Declaration' })
	buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true, desc = '[LSP]Go To Definition' })
	buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = true, desc = '[LSP]Go To Implementation' })
	buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', { noremap = true, silent = true, desc = '[LSP]Type Definition' })
	buf_set_keymap('n', '<space>r', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true, desc = '[LSP]Refactor' })
	buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true, desc = '[LSP]Go To Reference' })
	buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
	buf_set_keymap('n', '<space>c', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
end

--Define `root_dir` when needed
--This is a workaround, maybe not work with some servers.
local root_dir = function()
	return vim.fn.getcwd()
end

--Use a loop to conveniently call 'setup' on multiple servers and map buffer local keybindings when the language server attaches.
--Add your language server below:
local servers = { 'gopls', 'asm_lsp', 'awk_ls', 'bashls', 'clangd', 'cmake', 'cssls', 'cssmodules_ls', 'html', 'java_language_server', 'julials', 'rust_analyzer', 'texlab', 'vimls', 'tsserver' }

--Call setup
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup {
		on_attach = on_attach,
		root_dir = root_dir,
		capabilities = capabilities,
		flags = {
			--default in neovim 0.7+
			debounce_text_changes = 150,
		}
	}
end

