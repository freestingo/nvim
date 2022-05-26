require('gitsigns').setup {
  current_line_blame_opts = {
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 200,
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, { desc = "Navigate to next git hunk", expr=true })

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, { desc = "Navigate to previous git hunk", expr=true })

    -- Actions
    map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>', { desc = "Stage git hunk under cursor" })
    map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>', { desc = "Reset git hunk under cursor" })
    map('n', '<leader>hR', gs.reset_buffer, { desc = "Reset all git hunks in current buffer" })
    map('n', '<leader>hp', gs.preview_hunk, { desc = "Preview git hunk under cursor" })
    map('n', '<leader>gbl', gs.toggle_current_line_blame, { desc = "Toggle git blame on current line" })
  end
}
