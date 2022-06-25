local navic = require('nvim-navic')
local tabline = require('tabline')

tabline.setup {
  enable = false,
  options = {
    show_filename_only = true,
    modified_italic = false,
  }
}

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'onedark',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = { { navic.get_location, cond = navic.is_available } },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { tabline.tabline_buffers },
    lualine_x = { tabline.tabline_tabs },
    lualine_y = {},
    lualine_z = {}
  },
  extensions = {}
}

vim.keymap.set('n', 'H', '<cmd>TablineBufferPrevious<CR>',
  { desc = "Go to previous buffer on bufferline", silent = true })
vim.keymap.set('n', 'L', '<cmd>TablineBufferNext<CR>',
  { desc = "Go to next buffer on bufferline", silent = true })
vim.keymap.set('n', '<C-H>', 'gT',
  { desc = "Go to previous tab on tabline", silent = true })
vim.keymap.set('n', '<C-L>', 'gt',
  { desc = "Go to next tab on tabline", silent = true })
vim.keymap.set('n', '<leader>trn', function() vim.ui.input({ prompt = 'Enter new name for current tab: ' }, tabline.tab_rename) end,
  { desc = "Rename current tab on tabline", silent = true })
