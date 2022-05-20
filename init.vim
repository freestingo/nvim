let mapleader = " "

source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/plug-config/nvcode-color-schemes.vim
source $HOME/.config/nvim/plug-config/telescope.vim
source $HOME/.config/nvim/plug-config/vim-fugitive.vim
source $HOME/.config/nvim/plug-config/tig-explorer.vim
source $HOME/.config/nvim/plug-config/vim-highlightedyank.vim
source $HOME/.config/nvim/plug-config/language-client-neovim.vim
luafile $HOME/.config/nvim/lua/_treesitter.lua
luafile $HOME/.config/nvim/lua/_neovim-session-manager.lua
luafile $HOME/.config/nvim/lua/_nvim-cmp.lua
luafile $HOME/.config/nvim/lua/_lsp.lua
luafile $HOME/.config/nvim/lua/_luasnip.lua
luafile $HOME/.config/nvim/lua/_gitsigns.lua
luafile $HOME/.config/nvim/lua/_lualine.lua
luafile $HOME/.config/nvim/lua/_indent-blankline.lua
luafile $HOME/.config/nvim/lua/_navigator.lua

" Sets

set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set exrc
set relativenumber
set nu
set nohlsearch
set hidden
set ignorecase
set smartcase
set noerrorbells
set nowrap
set incsearch
set termguicolors
set scrolloff=4
set noshowmode
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set cmdheight=2 "Give more space for displaying messages
set clipboard+=unnamedplus
set guicursor+=a:blinkon1
set iskeyword-=_
set nrformats=bin,hex,alpha
set lazyredraw
set mouse+=a " for clicking on barbar buffer line tabs
" set cursorline
set laststatus=3 " only show global statusline even with multiple buffer splits
set updatetime=100
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

" Remaps

" start colemak optimization remaps
inoremap <C-e><C-n> <Esc>
" end colemak optimization remaps

inoremap kj <ESC>
inoremap <expr> <Tab> search('\%#[]>)}''"`]', 'n') ? '<Right>' : '<Tab>'
nnoremap <C-c> :bd<CR>
nnoremap <C-s> :w<CR>
nnoremap <F4> :lua package.loaded._telescope = nil<CR>:lua package.loaded._treesitter =  nil<CR>:source ~/.config/nvim/init.vim<CR>
nnoremap <leader>ex :wincmd v <bar> :Ex <bar> :vertical resize 40<CR>
nnoremap <leader>sh :wincmd s <bar> :wincmd w <bar> :resize 10 <bar> :terminal<CR>
nnoremap <leader>ghci :wincmd s <bar> :wincmd w <bar> :terminal<CR>stack ghci<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>cl :so ~/.config/nvim/vim-plug/plugins.vim <bar> :PlugClean<CR>
nnoremap <leader>in :so ~/.config/nvim/vim-plug/plugins.vim <bar> :PlugInstall<CR>
nnoremap <leader>now "=strftime("%d-%m-%Y - %R")<CR>p
vnoremap p pgvy " paste on visual selection and restore overridden paste register

tnoremap shq <C-\><C-n>:bd!<CR>
tnoremap ghq :q<C-\><C-n>:bd!<CR>
tnoremap shw <C-\><C-n><C-o>
tnoremap shf <C-\><C-n>

" Telescope remaps

source $HOME/.config/nvim/plug-config/telescope.vim

" Auto-commands

autocmd TermOpen * startinsert
autocmd FileType java setlocal tabstop=4 softtabstop=4 shiftwidth=4

source $HOME/.config/nvim/vim-functions.vim

augroup FREESTINGO
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END
