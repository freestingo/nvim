local z_utils = require("telescope._extensions.zoxide.utils")
local themes = require('telescope.themes')
local file_browser = require('telescope').extensions.file_browser
local zoxide = require('telescope').extensions.zoxide

require("telescope._extensions.zoxide.config").setup({
  prompt_title = "Zoxide Folder List",
  mappings = {
    ["<C-b>"] = {
      keepinsert = true,
      action = function(selection)
        file_browser.file_browser({ cwd = selection.path })
      end
    },
  }
})

vim.keymap.set("n", "<leader>cd", function() zoxide.list(themes.get_dropdown{}) end, { noremap = true, silent = true })
