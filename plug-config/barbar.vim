" if barbar's option dict isn't created yet, create it
let bufferline = get(g:, 'bufferline', {})

" let bufferline.auto_hide = v:true
" let bufferline.animation = v:false

" configure icons on the bufferline
" let bufferline.icon_separator_active = '▎'
" let bufferline.icon_separator_inactive = '▎'

nnoremap <silent> H :BufferPrevious<CR>
nnoremap <silent> L :BufferNext<CR>
nnoremap <silent> <A-<> :BufferMovePrevious<CR>
nnoremap <silent> <A->> :BufferMoveNext<CR>
