vim.keymap.set('n', '<leader>tig', '<cmd>TigOpenProjectRootDir<CR>',
  { desc = "Open tig on project root folder" })

vim.keymap.set('n', '<leader>fig', '<cmd>TigOpenCurrentFile<CR>',
  { desc = "Open tig on current file (view file commit history)" })

vim.keymap.set('n', '<leader>tgr', '<cmd>TigGrep<CR>',
  { desc = "Open tig grep" })

vim.keymap.set('n', '<leader>bl', '<cmd>TigBlame<CR>',
 { desc = "Open tig blame" })
