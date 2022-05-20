require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- a list of parser names, or "all"
  highlight = {
    enable = true, -- false will disable the whole extension
    custom_captures = {
        ["moreKeywords"] = "JavaMoreKeywords",
    },
    -- additional_vim_regex_highlighting = true, -- https://issueexplorer.com/issue/nvim-treesitter/nvim-treesitter/1742
    additional_vim_regex_highlighting = false
  },
  autotag = {
    enable = true,
  },
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = {"BufWrite", "CursorHold"},
  },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ["ac"] = "@call.outer",
        ["ic"] = "@call.inner",
        ["aC"] = "@class.outer",
        ["iC"] = "@class.inner",
        ["aP"] = "@parameter.outer",
        ["iP"] = "@parameter.inner",
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>pn"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>pp"] = "@parameter.inner",
      },
    },
  },
}

-- extend filetypes to use an arbitrary parser
local ft_to_parser = require('nvim-treesitter.parsers').filetype_to_parsername
ft_to_parser.twig = "html" -- the twig filetype will use the html parser and queries
