" Fix for weird and sudden autoindent disappearance for .php files
" https://github.com/nvim-treesitter/nvim-treesitter/issues/462
setlocal indentexpr =
setlocal autoindent
setlocal smartindent
