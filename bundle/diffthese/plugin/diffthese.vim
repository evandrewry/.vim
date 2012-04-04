" Diff open windows, specifying which windows by their number
"
" Ex: With 3 windows in the top row and 1 in the bottom, diff the top left and top right windows:
"   :DiffThese 1, 3
function! s:DiffThese(...)
  if len(a:000) == 0
    " Default to diffing all windows
    windo diffthis
  else
    " Diff only the given windows
    let start_i = winnr()
    windo diffthis | if index(a:000, winnr()) == -1 | set nodiff | endif
    execute start_i . "wincmd w"
  endif
endfunction

command! -n=? -bar DiffThese :call s:DiffThese(<args>)
