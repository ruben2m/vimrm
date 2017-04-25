""""""""""""""""""""""""""""""""""""""""""
" Archivo de configuracion neovim windows 
""""""""""""""""""""""""""""""""""""""""""
let dirvim="C:/Users/esrum/AppData/Local/nvim/"

" Archivo de configuracion del usuario
let filename = dirvim . ".vimrc.before"
if filereadable(expand(filename))
  exe source 'filename'
endif


set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'bundle/VundleVim/Vundle.vim'

source vundles.vim

call vundle#end()
filetype plugin indent on


" Añadimos settings de los plugins
let vimplugsettings="~/.vim/plugsettings"
for fpath in split(globpath(vimplugsettings, '*.vim'), '\n')
  exe 'source' fpath
endfor


" Añadimos settings
let vimsettings="~/.vim/settings"
for fpath in split(globpath(vimsettings, '*.vim'), '\n')
  if (fpath == expand(vimsettings) . "/keymap-windows.vim") && uname[:4] ==? "linux"
    continue " skip windows mappings for linux
  endif

  if (fpath == expand(vimsettings) . "/keymap-linux.vim") && uname[:4] !=? "linux"
    continue " skip linux mappings for windows
  endif

  exe 'source' fpath
endfor

colorscheme railscasts


" Archivo de configuracion del usuario
if filereadable(expand("~/.vimrc.after"))
  source ~/.vimrc.after
endif
