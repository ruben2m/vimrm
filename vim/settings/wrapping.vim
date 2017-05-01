" http://vimcasts.org/episodes/soft-wrapping-text/
function! SetupWrapping()
  set wrap linebreak nolist
  set showbreak=…
endfunction

" TODO: this should happen automatically for certain file types (e.g. markdown)
command! -nargs=* Wrap :call SetupWrapping()<CR>

"vmap <D-j> gj
"vmap <D-k> gk
"vmap <D-$> g$
"vmap <D-^> g^
"vmap <D-0> g^

" Navegar entre lineas con wrap
nmap k gk
nmap j gj
