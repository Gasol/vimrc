vim.lsp.set_log_level('info')
default_available_servers = {
	'pyright',
	'intelephense',
	'vuels',
	'tsserver',
}

status, lspconfig = pcall(require, 'lspconfig')
if status then
	for i, name in ipairs(default_available_servers) do
		lspconfig[name].setup{}
	end
end
