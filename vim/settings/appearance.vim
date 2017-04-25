" Make it beautiful - colors and fonts

if has("gui_running")
  "tell the term has 256 colors
  set t_Co=256

  " Show tab number (useful for Cmd-1, Cmd-2.. mapping)
  " For some reason this doesn't work as a regular set command,
  " (the numbers don't show up) so I made it a VimEnter event
  autocmd VimEnter * set guitablabel=%N:\ %t\ %M

  set lines=60
  set columns=190

  if has("gui_gtk2")
    set guifont=Inconsolata\ XL\ 10,Inconsolata\ 13,Monaco\ 10
  else
    set guifont=Inconsolata\ XL:h17,Inconsolata:h20,Monaco:h17
  end

  colorscheme railscasts
  hi Folded guifg=#BC9458
  hi Folded guibg=#232323

  NERDTreeToggle
else
  let g:CSApprox_loaded = 1

  " For people using a terminal that is not Solarized
  if exists("g:yadr_using_unsolarized_terminal")
    let g:solarized_termcolors=256
    let g:solarized_termtrans=1
  end

  colorscheme peachpuff
endif

set background=dark

" Disable the scrollbars (NERDTree)
set guioptions-=r
set guioptions-=L

" Disable the macvim toolbar
set guioptions-=T

set foldmethod=indent
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

augroup WrapLineInTeXFile
    autocmd!
    autocmd BufNewFile,BufRead * setlocal wrap
augroup END

" Indentado
set shiftwidth=4
