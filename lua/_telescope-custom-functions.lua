local M = {}

M.current_buffer_search = function()
  require('telescope.builtin').current_buffer_fuzzy_find({
    layout_config = {
      prompt_position = "top"
    },
    sorting_strategy = "ascending"
  })
end

M.find_neovim_config_files = function()
  require('telescope.builtin').find_files({
    prompt_title = "NeoVim Config",
    cwd = "~/.config/nvim"
  })
end

M.live_grep_config_files = function()
  require('telescope.builtin').live_grep({
    prompt_title = "Search in NeoVim Config",
    cwd = "~/.config/nvim"
  })
end

M.file_browser_config_files = function()
  require('telescope').extensions.file_browser.file_browser({
    prompt_title = "Files in NeoVim Config",
    cwd = "~/.config/nvim"
  })
end

M.find_xmonad_config_files = function()
  require('telescope.builtin').find_files({
    prompt_title = "XMonad Config",
    cwd = "~/.xmonad/lib"
  })
end

M.live_grep_xmonad_config_files = function()
  require('telescope.builtin').live_grep({
    prompt_title = "Search in XMonad Config",
    cwd = "~/.xmonad/lib"
  })
end

M.file_browser_xmonad_config_files = function()
  require('telescope').extensions.file_browser.file_browser({
    prompt_title = "Files in XMonad Config",
    cwd = "~/.config/nvim"
  })
end

M.file_browser_current_buffer = function()
  require('telescope').extensions.file_browser.file_browser({
    prompt_title = "Current Buffer Location",
    path = '%:p:h'
  })
end

-- thank you!!!!
-- https://www.reddit.com/r/neovim/comments/r74647/how_to_live_grep_in_telescope_on_certain_folders/hmx0w58/
local Path = require "plenary.path"
local action_set = require "telescope.actions.set"
local action_state = require "telescope.actions.state"
local conf = require("telescope.config").values
local finders = require "telescope.finders"
local make_entry = require "telescope.make_entry"
local os_sep = Path.path.sep
local pickers = require "telescope.pickers"
local scan = require "plenary.scandir"

M.live_grep_in_selected_folders = function(opts)
  opts = opts or {}
  local data = {}
  scan.scan_dir(vim.loop.cwd(), {
    hidden = opts.hidden,
    only_dirs = true,
    respect_gitignore = opts.respect_gitignore,
    on_insert = function(entry)
      table.insert(data, entry .. os_sep)
    end,
  })
  table.insert(data, 1, "." .. os_sep)

  pickers.new(opts, {
    prompt_title = "Folders for Live Grep",
    finder = finders.new_table { results = data, entry_maker = make_entry.gen_from_file(opts) },
    previewer = conf.file_previewer(opts),
    sorter = conf.file_sorter(opts),
    attach_mappings = function(prompt_bufnr)
      action_set.select:replace(function()
        local current_picker = action_state.get_current_picker(prompt_bufnr)
        local dirs = {}
        local selections = current_picker:get_multi_selection()
        if vim.tbl_isempty(selections) then
          table.insert(dirs, action_state.get_selected_entry().value)
        else
          for _, selection in ipairs(selections) do
            table.insert(dirs, selection.value)
          end
        end
        actions._close(prompt_bufnr, current_picker.initial_mode == "insert")
        require("telescope.builtin").live_grep { search_dirs = dirs }
      end)
      return true
    end,
  }):find()
end
-- END

-- this is lua's way to export stuff from modules (kinda like oldschool javascript)
return M
