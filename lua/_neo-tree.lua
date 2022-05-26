-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.g.neo_tree_remove_legacy_commands = true

-- If you want icons for diagnostic errors, you'll need to define them somewhere:
vim.fn.sign_define("DiagnosticSignError", {text = " ", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn", {text = " ", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo", {text = " ", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint", {text = "", texthl = "DiagnosticSignHint"})

vim.keymap.set('n', '\\', '<cmd>Neotree reveal<CR>',
  { desc = "Open Neotree from current file" })

vim.keymap.set('n', '<leader>ts', '<cmd>Neotree show<CR>',
  { desc = "Open Neotree" })

vim.keymap.set('n', '<leader>tc', '<cmd>Neotree close<CR>',
  { desc = "Close Neotree" })

