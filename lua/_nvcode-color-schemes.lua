vim.g.nvcode_termcolors = 256
vim.g.airline_theme = 'onedark'

vim.cmd([[
syntax on
colorscheme github

if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif

" Uncomment this to make the background transparent.
" Remember to turn transparent background on for the terminal as well.
hi! Normal ctermbg=NONE guibg=NONE
hi! SignColumn ctermbg=NONE guibg=NONE
]])
