vim.cmd([[
call plug#begin('~/.vim/plugged')

Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'onsails/lspkind.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/playground'
Plug 'freestingo/nvcode-color-schemes.vim'
Plug 'iberianpig/tig-explorer.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'kyazdani42/nvim-web-devicons'
Plug 'szw/vim-maximizer'
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-abolish'
Plug 'windwp/nvim-ts-autotag'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'tami5/sqlite.lua'
Plug 'nvim-telescope/telescope-frecency.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'Shatur/neovim-session-manager'
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kdheepak/tabline.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'tpope/vim-repeat'
Plug 'wesQ3/vim-windowswap'
Plug 'numToStr/Navigator.nvim'
Plug 'folke/which-key.nvim'
Plug 'jvgrootveld/telescope-zoxide'
Plug 'famiu/bufdelete.nvim'
Plug 'meain/vim-printer'
Plug 'cappyzawa/trim.nvim'

call plug#end()
]])
