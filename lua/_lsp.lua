-- thanks to https://www.youtube.com/watch?v=puWgHa7k3SY

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local custom_lsp_attach = function(client)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover,
    { desc = "Open hover documentation", buffer = 0 })

  vim.keymap.set('n', '<leader>gd', "<cmd>Telescope lsp_definitions<CR>",
    { desc = "Go to definition of word under cursor, or show all if multiple", buffer = 0 })

  vim.keymap.set('n', '<leader>gt', "<cmd>Telescope lsp_type_definitions<CR>",
    { desc = "Go to definition of type of word under cursor, or show all if multiple", buffer = 0 })

  vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation,
    { desc = "Go to implementation of word under cursor, or show all if multiple", buffer = 0 })

  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename,
    { desc = "Rename symbol under cursor", buffer = 0 })

  vim.keymap.set('n', '<leader>ac', vim.lsp.buf.code_action,
    { desc = "Open code actions menu", buffer = 0 })

  vim.keymap.set('n', '<leader>df', vim.diagnostic.goto_next,
    { desc = "Go to next diagnostic message", buffer = 0 })

  vim.keymap.set('n', '<leader>db', vim.diagnostic.goto_prev,
    { desc = "Go to previous diagnostic message", buffer = 0 })

  vim.keymap.set('n', '<leader>fo', vim.lsp.buf.formatting,
    { desc = "Format current buffer", buffer = 0 })

  vim.keymap.set('n', '<leader>dl', "<cmd>Telescope diagnostics<CR>",
    { desc = "List all diagnostic messages for current buffer", buffer = 0 })

  vim.keymap.set('n', '<leader>ds', "<cmd>Telescope lsp_document_symbols<CR>",
    { desc = "List all symbols for current buffer", buffer = 0 })

  vim.keymap.set('n', '<leader>gr', "<cmd>Telescope lsp_references<CR>",
    { desc = "List all references for word under the cursor", buffer = 0 })

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
require('lspconfig').sumneko_lua.setup{
  on_attach = custom_lsp_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
}
require('lspconfig').emmet_ls.setup{
  on_attach = custom_lsp_attach,
  capabilities = capabilities,
  filetypes = { 'html', 'css', 'html.twig.js.css', 'html.twig', 'twig' } -- activate emmet snippets also on twig files
}
