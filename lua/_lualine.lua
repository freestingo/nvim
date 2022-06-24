local navic = require('nvim-navic')

require('tabline').setup {
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
    lualine_c = { require'tabline'.tabline_buffers },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  extensions = {}
}

vim.keymap.set('n', 'H', '<cmd>TablineBufferPrevious<CR>',
  { desc = "Go to previous buffer on bufferline", silent = true })
vim.keymap.set('n', 'L', '<cmd>TablineBufferNext<CR>',
  { desc = "Go to next buffer on bufferline", silent = true })
