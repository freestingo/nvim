require('git-conflict').setup {
  default_mappings = false,    -- Disable buffer local mapping created by this plugin (will set them up personally down below)
  disable_diagnostics = false, -- Disable diagnostics in a conflicted buffer
  highlights = {               -- They must have background color, otherwise the default color will be used
    incoming = 'GitConflictIncomingDiff',
    current = 'GitConflictCurrentDiff',
  }
}

vim.keymap.set('n', '<leader>cc', '<Plug>(git-conflict-ours)',
  { desc = "Choose current diff when resolving conflict" })

vim.keymap.set('n', '<leader>cb', '<Plug>(git-conflict-both)',
  { desc = "Choose both incoming and current diffs when resolving conflict" })

vim.keymap.set('n', '<leader>cn', '<Plug>(git-conflict-none)',
  { desc = "Don't choose any diffs when resolving conflict" })

vim.keymap.set('n', '<leader>ci', '<Plug>(git-conflict-theirs)',
  { desc = "Choose incoming diff when resolving conflict" })

vim.keymap.set('n', ']x', '<Plug>(git-conflict-next-conflict)',
  { desc = "Go to next conflict" })

vim.keymap.set('n', '[x', '<Plug>(git-conflict-prev-conflict)',
  { desc = "Go to previous conflict" })
