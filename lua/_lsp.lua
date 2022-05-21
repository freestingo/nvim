-- thanks to https://www.youtube.com/watch?v=puWgHa7k3SY

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local custom_lsp_attach = function(client)
  vim.keymap.set('n', 'K',          vim.lsp.buf.hover,                         { buffer = 0 })
  vim.keymap.set('n', '<leader>gd', "<cmd>Telescope lsp_definitions<CR>",      { buffer = 0 })
  vim.keymap.set('n', '<leader>gt', "<cmd>Telescope lsp_type_definitions<CR>", { buffer = 0 })
  vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation,                { buffer = 0 })
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename,                        { buffer = 0 })
  vim.keymap.set('n', '<leader>ac', vim.lsp.buf.code_action,                   { buffer = 0 })
  vim.keymap.set('n', '<leader>df', vim.diagnostic.goto_next,                  { buffer = 0 })
  vim.keymap.set('n', '<leader>db', vim.diagnostic.goto_prev,                  { buffer = 0 })
  vim.keymap.set('n', '<leader>dl', "<cmd>Telescope diagnostics<CR>",          { buffer = 0 })
  vim.keymap.set('n', '<leader>ds', "<cmd>Telescope lsp_document_symbols<CR>", { buffer = 0 })
  vim.keymap.set('n', '<leader>gr', "<cmd>Telescope lsp_references<CR>",       { buffer = 0 })

  -- Use LSP as the handler for omnifunc.
  --    See `:help omnifunc` and `:help ins-completion` for more information.
  -- vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Use LSP as the handler for formatexpr.
  --    See `:help formatexpr` for more information.
  -- vim.api.nvim_buf_set_option(0, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')

  -- For plugins with an `on_attach` callback, call them here. For example:
  -- require('completion').on_attach()
end

-- to install new language servers:
--   1. :LspInstallInfo -> lists all available language servers
--   2. :LspInstall <language-server-name>
--   3. put config line below here
-- to check defaults of each server's configuration, peep https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
require('nvim-lsp-installer').setup{}
require('lspconfig').angularls.setup{ on_attach = custom_lsp_attach, capabilities = capabilities }
require('lspconfig').cssls.setup{ on_attach = custom_lsp_attach, capabilities = capabilities }
require('lspconfig').erlangls.setup{ on_attach = custom_lsp_attach, capabilities = capabilities }
require('lspconfig').hls.setup{ on_attach = custom_lsp_attach, capabilities = capabilities }
require('lspconfig').html.setup{ on_attach = custom_lsp_attach, capabilities = capabilities }
require('lspconfig').intelephense.setup{ on_attach = custom_lsp_attach, capabilities = capabilities }
require('lspconfig').jsonls.setup{ on_attach = custom_lsp_attach, capabilities = capabilities }
require('lspconfig').phpactor.setup{ on_attach = custom_lsp_attach, capabilities = capabilities }
require('lspconfig').rust_analyzer.setup{ on_attach = custom_lsp_attach, capabilities = capabilities }
require('lspconfig').tsserver.setup{ on_attach = custom_lsp_attach, capabilities = capabilities }
require('lspconfig').emmet_ls.setup{
  on_attach = custom_lsp_attach,
  capabilities = capabilities,
  filetypes = { 'html', 'css', 'html.twig.js.css', 'html.twig', 'twig' } -- activate emmet snippets also on twig files
}
