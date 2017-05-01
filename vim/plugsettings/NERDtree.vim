" Make nerdtree look nice
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30

" Cuando abre el nerdtree busca el fichero actual
function! NTFinderP()
    "" Check if NERDTree is open
    if exists("t:NERDTreeBufName")
        let s:ntree = bufwinnr(t:NERDTreeBufName)
    else
        let s:ntree = -1
    endif
    if (s:ntree != -1)
        "" If NERDTree is open, close it.
        :NERDTreeClose
    else
        "" Try to open a :Rtree for the rails project
        if exists(":Rtree")
            "" Open Rtree (using rails plugin, it opens in project dir)
            :Rtree
        else
            if (@%)
                "" Si hay fichero actual Open NERDTree in the file path
                :NERDTreeFind
            else
                :NERDTreeToggle
            endif
        endif
    endif
endfunction

function! OpenNerdTree()
  if &modifiable && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
  else
    NERDTreeToggle
  endif
endfunction
" Mostrar en NERDTree el fichero actual
nnoremap <silent> º :call OpenNerdTree()<CR>

" Quito el scrolloff horizontal para ver mejor el nerdtree
set siso=0

" Toggles NERDTree
map <leader>p :call NTFinderP()<CR>
