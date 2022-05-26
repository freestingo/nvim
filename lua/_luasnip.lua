local ls = require('luasnip')
local s = ls.s
local fmt = require('luasnip.extras.fmt').fmt
local i = ls.insert_node
local rep = require('luasnip.extras').rep
local types = require('luasnip.util.types')
local lua_loader = require('luasnip.loaders.from_lua')

vim.keymap.set({ "i", "s" }, "<c-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { desc = "Expand snippet or jump to next snippet position" })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { desc = "Jump to previous snippet position", silent = true })

vim.keymap.set("i", "<c-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { desc = "Cycle through snippet choices for current position" })

vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/snips.lua<CR>",
  { desc = "Reload snips.lua file" })

-- loads snippets inside the specified folder;
-- will load each file according to the buffer filetype (all.lua always gets loaded)
lua_loader.load({ paths = "~/.config/nvim/snippets/" })

ls.config.set_config {
  history = true,
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,
}
