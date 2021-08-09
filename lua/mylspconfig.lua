if not package.loaded['vim.lsp'] then
	return
end
vim.lsp.set_log_level('info')

local default_available_servers = {
	'pyright',
	'intelephense',
	'vuels',
	'tsserver',
}
local custom_lsp_attach = function(client)
	vim.api.nvim_buf_set_keymap(0, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true})
	vim.api.nvim_buf_set_keymap(0, 'n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})
	vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

local status, lspconfig = pcall(require, 'lspconfig')
if status then
  for _, name in ipairs(default_available_servers) do
    lspconfig[name].setup({
      on_attach = custom_lsp_attach
    })
  end
end

local lsphelper = require('lsp.helper')
local sumneko_executable = lsphelper.find_sumneko_executable()
if sumneko_executable ~= nil and #sumneko_executable > 0 then
	local executable_dir = sumneko_executable:match('(.*[/\\].*[/\\])')
  require'lspconfig'.sumneko_lua.setup {
    cmd = {sumneko_executable, "-E", executable_dir .. "../..//main.lua"};
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
          path = vim.split(package.path, ';'),
        },
        diagnostics = {
          globals = {'vim'},
        },
        workspace = {
          library = {
            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
            [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
          },
        },
      },
    },
  }
end
local saga = require 'lspsaga'
saga.init_lsp_saga()
