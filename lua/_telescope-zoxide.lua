local z_utils = require("telescope._extensions.zoxide.utils")
local file_browser = require('telescope').extensions.file_browser

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

vim.keymap.set("n", "<leader>cd", ":lua require'telescope'.extensions.zoxide.list{}<CR>", { noremap = true, silent = true })
