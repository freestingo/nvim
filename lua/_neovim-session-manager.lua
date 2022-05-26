local Path = require('plenary.path')
require('session_manager').setup({
  autoload_mode = require('session_manager.config').AutoloadMode.Disabled
})

vim.keymap.set('n', '<leader>lcs', '<cmd>SessionManager load_current_dir_session<CR>',
  { desc = "Load last saved session for current folder", silent = true })
