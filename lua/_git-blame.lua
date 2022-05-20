-- disable by default
vim.g.gitblame_enabled = 0

-- toggle activation only when needed
vim.keymap.set("n", "<leader>gbl", "<cmd>GitBlameToggle<CR>")

