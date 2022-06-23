local builtin = require('telescope.builtin')
local custom = require('_telescope.custom-functions')
local actions = require('telescope.actions')
local themes = require('telescope.themes')
local fb_actions = require('telescope').extensions.file_browser.actions
local cf_actions = require('telescope').extensions.changed_files.actions

require('telescope').setup {
  defaults = {
    file_ignore_patterns = {
        "%.o"
      , "%.hi"
    },
    layout_config = {
      horizontal = {
        preview_width = 0.5,
        width = 0.93
      }
    },
    path_display = {
      truncate = 1
    },
    prompt_prefix = "> ",
    cache_picker = {
      num_pickers = 5,
    },
    mappings = {
      i = {
        ["<c-w>"] = false -- remove shortcut conflict when deleting text in file_browser
        -- removing all key-shortcut conflicts with XMonad
      , ["<m-q>"] = false
      , ["<c-q>"] = false
      }
    }
  },
  pickers = {
    buffers = {
      mappings = {
        i = {
          ["<a-d>"] = actions.delete_buffer
        }
      }
    },
    keymaps = {
      theme = 'dropdown',
      layout_config = {
        center = {
          width = 0.8
        }
      },
    },
    git_branches = {
      theme = 'dropdown',
      mappings = {
        i = {
          ["<CR>"] = cf_actions.find_changed_files,
          ["<a-c>"] = actions.git_checkout
        }
      }
    }
  },
  extensions = {
    ["ui-select"] = {
      themes.get_dropdown{}
    },
    frecency = {
      workspaces = {
        ["wpf"] = '/home/nicolo/oncode/projects/essence/whirlpool-frontend',
        ["wpb"] = '/home/nicolo/oncode/projects/essence/sandwatch3.0',
      }
    }
  }
}

require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')
require('telescope').load_extension('frecency')
require('telescope').load_extension('ui-select')
require('telescope').load_extension('zoxide')
require('telescope').load_extension('changed_files')

vim.keymap.set('n', '<leader>ff', custom.find_files_with_multiopen,
  { desc = "List files in your current working directory (respect .gitignore)" })

vim.keymap.set('n', '<leader>vff', custom.find_neovim_config_files,
  { desc = "List files in ~/.config/nvim/ (for easier vimrc editing)" })

vim.keymap.set('n', '<leader>xff', custom.find_xmonad_config_files,
  { desc = "List files in ~/.xmonad/lib/ (for easier xmonad config editing)" })

vim.keymap.set('n', '<leader>fg', builtin.live_grep,
  { desc = "Search for a string in your current working directory and get results live as you type (respecting .gitignore)" })

vim.keymap.set('n', '<leader>rfg', custom.live_grep_in_selected_folders,
  { desc = "Search for a string only in selected folders (mnemonic: 'restricted find grep')" })

vim.keymap.set('n', '<leader>vfg', custom.live_grep_config_files,
  { desc = "Search for a string in ~/.config/nvim/" })

vim.keymap.set('n', '<leader>xfg', custom.live_grep_xmonad_config_files,
  { desc = "Search for a string in ~/.xmonad/lib/" })

vim.keymap.set('n', '<leader>bb', builtin.buffers,
  { desc = "List open buffers in current neovim instance" })

vim.keymap.set('n', '<leader>fh', builtin.help_tags,
  { desc = "List available help tags and opens a new window with the relevant help info on <cr>" })

vim.keymap.set('n', '<leader>*', builtin.grep_string,
  { desc = "Searches for the string under your cursor in your current working directory" })

vim.keymap.set('n', '<leader>fb', function() require('telescope').extensions.file_browser.file_browser({ hidden = true }) end,
  { desc = "List files and folders in your current working directory, open files, navigate your filesystem, and create new files and folders" })

vim.keymap.set('n', '<leader>cfb', custom.file_browser_current_buffer,
  { desc = "List files and folders from your current buffer's directory" })

vim.keymap.set('n', '<leader>vfb', custom.file_browser_config_files,
  { desc = "List files and folders in ~/.config/nvim/" })

vim.keymap.set('n', '<leader>xfb', custom.file_browser_xmonad_config_files,
  { desc = "List files and folders in ~/.xmonad/lib/" })

vim.keymap.set('n', '<leader>loc', builtin.loclist,
  { desc = "List items from the current window's location list" })

vim.keymap.set('n', '<leader>cmd', builtin.commands,
  { desc = "List available plugin/user commands and runs them on <CR>" })

vim.keymap.set('n', '<leader>vopt', builtin.vim_options,
  { desc = "List vim options, allows you to edit the current value on <CR>" })

vim.keymap.set('n', '<leader>rg', builtin.registers,
  { desc = "List vim registers, pastes the contents of the register on <CR>" })

vim.keymap.set('n', '<C-_>', custom.current_buffer_search,
  { desc = "Live fuzzy search inside of the current open buffer" })

vim.keymap.set('n', '<leader>rs', builtin.resume,
  { desc = "Open previous picker in its identical state (incl. multi selections)" })

vim.keymap.set('n', '<leader>pk', builtin.pickers,
  { desc = "List cached pickers" })

vim.keymap.set('n', '<leader>se', builtin.search_history,
  { desc = "List searches that were executed recently, and reruns them on <CR>" })

vim.keymap.set('n', '<leader>km', builtin.keymaps,
  { desc = "List normal mode keymappings" })

vim.keymap.set('n', '<leader>man', builtin.man_pages,
  { desc = "List manpage entries" })

vim.keymap.set('n', '<leader>bi', builtin.builtin,
  { desc = "List built-in pickers and run them on <CR>" })

vim.keymap.set('n', '<leader>of', builtin.oldfiles,
  { desc = "List recently opened files" })

vim.keymap.set('n', '<leader>fr', require('telescope').extensions.frecency.frecency,
  { desc = "List 'frecent' files" })

vim.keymap.set('n', '<leader>gbr', builtin.git_branches,
  { desc = 'Run `git branches`' })

vim.keymap.set('n', '<leader>gst', builtin.git_status,
  { desc = 'Run `git status`' })
