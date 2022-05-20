lua require('_telescope')

" Lists files in your current working directory, respects .gitignore
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<CR>

" Lists files in ~/.config/nvim/ (for easier vimrc editing)
nnoremap <leader>vff <cmd>lua require('_telescope').find_neovim_config_files()<CR>

" Lists files in ~/.xmonad/lib/ (for easier xmonad config editing)
nnoremap <leader>xff <cmd>lua require('_telescope').find_xmonad_config_files()<CR>

" Search for a string in your current working directory and get results live as you type (respecting .gitignore)
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<CR>

" Search for a string only in selected folders (mnemonic: 'restricted find grep')
nnoremap <leader>rfg <cmd>lua require('_telescope').live_grep_in_selected_folders()<CR>

" Search for a string in ~/.config/nvim/
nnoremap <leader>vfg <cmd>lua require('_telescope').live_grep_config_files()<CR>

" Search for a string in ~/.xmonad/lib/
nnoremap <leader>xfg <cmd>lua require('_telescope').live_grep_xmonad_config_files()<CR>

" Lists open buffers in current neovim instance
nnoremap <leader>bb <cmd>lua require('telescope.builtin').buffers()<CR>

" Lists available help tags and opens a new window with the relevant help info on <cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<CR>

" Searches for the string under your cursor in your current working directory
nnoremap <leader>* <cmd>lua require('telescope.builtin').grep_string()<CR>

" Lists files and folders in your current working directory, open files, navigate your filesystem, and create new files and folders
nnoremap <leader>fb <cmd>lua require('telescope').extensions.file_browser.file_browser({ hidden = true })<CR>

" Lists files and folders from your current buffer's directory
nnoremap <leader>cfb <cmd>lua require('_telescope').file_browser_current_buffer()<CR>

" Lists files and folders in ~/.config/nvim/
nnoremap <leader>vfb <cmd>lua require('_telescope').file_browser_config_files()<CR>

" Lists files and folders in ~/.xmonad/lib/
nnoremap <leader>xfb <cmd>lua require('_telescope').file_browser_xmonad_config_files()<CR>

" Lists any LSP actions for the word under the cursor, that can be triggered with <CR>
nnoremap <leader>wac <cmd>lua require('telescope.builtin').lsp_code_actions()<CR>

" Lists items from the current window's location list
nnoremap <leader>loc <cmd>lua require('telescope.builtin').loclist()<CR>

" Lists available plugin/user commands and runs them on <CR>
nnoremap <leader>cmd <cmd>lua require('telescope.builtin').commands()<CR>

" Lists vim options, allows you to edit the current value on <CR>
nnoremap <leader>vopt <cmd>lua require('telescope.builtin').vim_options()<CR>

" Lists vim registers, pastes the contents of the register on <CR>
nnoremap <leader>rg <cmd>lua require('telescope.builtin').registers()<CR>

" Live fuzzy search inside of the current open buffer
nnoremap <C-_> <cmd>lua require('_telescope').current_buffer_search()<CR>

" Open previous picker in its identical state (incl. multi selections)
nnoremap <leader>rs <cmd>lua require('telescope.builtin').resume()<CR>

" Lists cached pickers
nnoremap <leader>pk <cmd>lua require('telescope.builtin').pickers()<CR>

" Lists searches that were executed recently, and reruns them on <CR>
nnoremap <leader>se <cmd>lua require('telescope.builtin').search_history()<CR>

" Lists normal mode keymappings
nnoremap <leader>km <cmd>lua require('telescope.builtin').keymaps()<CR>

" Lists manpage entries
nnoremap <leader>man <cmd>lua require('telescope.builtin').man_pages()<CR>

" Lists built-in pickers and run them on <CR>
nnoremap <leader>bi <cmd>lua require('telescope.builtin').builtin()<CR>

" Lists recently opened files
nnoremap <leader>of <cmd>lua require('telescope.builtin').oldfiles()<CR>

" Lists 'frecent' files
nnoremap <leader>fr <cmd>lua require('telescope').extensions.frecency.frecency()<CR>


" Quick-fix mappings
nnoremap <leader>qn <cmd>cnext<CR>
nnoremap <leader>qp <cmd>cprevious<CR>

" telescope-Git mappings
nnoremap <leader>gbr <cmd>lua require('telescope.builtin').git_branches()<CR>
nnoremap <leader>gst <cmd>lua require('telescope.builtin').git_status()<CR>

