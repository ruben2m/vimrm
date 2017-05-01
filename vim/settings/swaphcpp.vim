""""""""""""""""""""""""""""""""""""""""
" Funcion para cambiar entre cabeceras y archivos fuente en c y c++
""""""""""""""""""""""""""""""""""""""""
function! FlipCabeceraFuente()
  if (match(expand("%"),'\.cpp') > 0) || (match(expand("%"),'\.c') > 0)
    let s:flipname = substitute(expand("%:r"), '/src', '/inc', "").".hpp"
    if filereadable(s:flipname)	
        exe 'edit' s:flipname
    else
        let s:flipname = substitute(expand("%:r"), '/src', '/inc', "").".h"
        if filereadable(s:flipname)	
            exe 'edit' s:flipname
        else
            echo "No existe el archivo " . s:flipname
        endif
    endif
  elseif (match(expand("%"),'\.hpp') > 0) || (match(expand("%"),'\.h') > 0)
    let s:flipname = substitute(expand("%:r"), '/inc', '/src', "").".cpp"
    if filereadable(s:flipname)	
        exe 'edit' s:flipname
    else
        let s:flipname = substitute(expand("%:r"), '/inc', '/src', "").".c"
        if filereadable(s:flipname)	
            exe 'edit' s:flipname
        else
            echo "No existe el archivo " . s:flipname
        endif
    endif
  endif
endfun