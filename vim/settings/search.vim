function! GetVisual()
  let reg_save = getreg('"')
  let regtype_save = getregtype('"')
  let cb_save = &clipboard
  set clipboard&
  normal! ""gvy
  let selection = getreg('"')
  call setreg('"', reg_save, regtype_save)
  let &clipboard = cb_save
  return selection
endfunction

"grep the current word using K (mnemonic Kurrent)
nnoremap <silent> K :Ack <cword><CR>

"grep visual selection
vnoremap K :<C-U>execute "Ack " . GetVisual()<CR>

"grep current word up to the next exclamation point using ,K
"TODO no veo utilidad      nnoremap ,K viwf!:<C-U>execute "Ack " . GetVisual()<CR>

"grep for 'def foo'
"TODO no veo utilidad, solo en ruby      nnoremap <silent> ,gd :Ack 'def <cword>'<CR>

",gg = Grep! - using Ag the silver searcher
" open up a grep line, with a quote started for the search
nnoremap ,gg :Ack ""<left>

"Grep Current Partial
function! AgCurrentPartial()
  let l:fileNameWithoutExtension = expand('%:t:r')
  let l:fileNameWithoutUnderscore = substitute(l:fileNameWithoutExtension, '^_','','g')
  let l:grepPattern = "render.*[\\\'\\\"].*" . l:fileNameWithoutUnderscore . "[\\\'\\\"]$"
  exec 'Ack "' . l:grepPattern . '"'
endfunction

command! AgCurrentPartial call AgCurrentPartial()
"
nnoremap ,gcp :AgCurrentPartial<CR>

"Grep for usages of the current file
nnoremap ,gcf :exec "Ack " . expand("%:t:r")<CR>
