require('Navigator').setup {}

vim.keymap.set('n', "<leader><C-h>", '<cmd>NavigatorLeft<CR>',
  { desc = "Navigate to the left split (from your current position)" })

vim.keymap.set('n', "<leader><C-l>", '<cmd>NavigatorRight<CR>',
  { desc = "Navigate to the right split (from your current position)" })

vim.keymap.set('n', "<leader><C-p>", '<cmd>NavigatorUp<CR>',
  { desc = "Navigate to the above split (from your current position)" })

vim.keymap.set('n', "<leader><C-n>", '<cmd>NavigatorDown<CR>',
  { desc = "Navigate to below split (from your current position)" })

vim.keymap.set('n', "<A-p>", '<cmd>NavigatorPrevious<CR>',
  { desc = "Navigate to previous split" })
