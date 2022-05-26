-- leader must be set before everything else
vim.g.mapleader = " "

require('plugins')

-- plugin configurations
require('_nvcode-color-schemes')
require('_vim-highlightedyank')
require('_vim-printer')
require('_treesitter')
require('_neovim-session-manager')
require('_nvim-cmp')
require('_lsp')
require('_luasnip')
require('_gitsigns')
require('_lualine')
require('_indent-blankline')
require('_navigator')
require('_telescope-zoxide')
require('_tig-explorer')
require('_telescope')
require('_trim')
require('_tabout')
require('_comment')
require('_neo-tree')
require('_key-menu')

-- sets
local set = vim.opt
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = true
set.smartindent = true
set.relativenumber = true
set.number = true
set.hlsearch = false
set.hidden = true
set.ignorecase = true
set.smartcase = true
set.errorbells = false
set.wrap = false
set.incsearch = true
set.termguicolors = true
set.scrolloff = 4
set.showmode = false
set.completeopt = { 'menuone', 'noinsert', 'noselect' }
set.cmdheight = 2
vim.cmd([[
set signcolumn=yes
set clipboard+=unnamedplus
set guicursor+=a:blinkon1
set iskeyword-=_
set mouse+=a
]])
set.nrformats = { 'bin', 'hex', 'alpha' }
set.lazyredraw = true
set.laststatus = 3 -- only show global statusline even with multiple buffer splits
set.updatetime = 100

vim.cmd([[
filetype on

" https://www.reddit.com/r/neovim/comments/7kispa/how_does_gclipboard_work/
let g:clipboard = {
      \   'name': 'freestingoClipboard',
      \   'copy': {
      \      '+': 'xclip -selection clipboard',
      \      '*': 'xclip -selection clipboard',
      \   },
      \   'paste': {
      \      '+': 'xclip -selection clipboard -o',
      \      '*': 'xclip -selection clipboard -o',
      \   },
      \   'cache_enabled': 1,
      \ }

" Auto-commands
autocmd TermOpen * startinsert
]])

-- remaps
vim.keymap.set('i', '<C-e><C-n>', '<Esc>',
  { desc = "Esc remap (colemak layout optimization)" })

vim.keymap.set('i', 'kj', '<ESC>',
  { desc = "Esc remap" })

vim.keymap.set('n', '<C-c>', '<cmd>Bdelete<CR>',
  { desc = "Delete buffer and preserve layout", silent = true })

vim.keymap.set('n', '<C-s>', '<cmd>w<CR>',
  { desc = "Save current buffer", silent = true })

vim.keymap.set('n', '<leader>sh', '<cmd>wincmd s <bar> :wincmd w <bar> :resize 10 <bar> :terminal<CR>',
  { desc = "Open terminal in horizontal split", silent = true })

vim.keymap.set('n', '<leader>ghci', '<cmd>wincmd s <bar> :wincmd w <bar> :terminal<CR>stack ghci<CR>',
  { desc = "Open ghci repl in horizontal split", silent = true })

vim.keymap.set('n', '<leader>now', '"=strftime("%d-%m-%Y - %R")<CR>p',
  { desc = "Write current date and time to buffer", silent = true })

vim.keymap.set('v', 'p', 'pgvy',
  { desc = "Paste on visual selection and restore overridden paste register" })

vim.keymap.set('t', 'shq', '<C-\\><C-n>:bd!<CR>',
  { desc = "Close terminal buffer and its split", silent = true })

vim.keymap.set('t', 'shf', '<C-\\><C-n>',
  { desc = "Exit insert mode on terminal", silent = true })
