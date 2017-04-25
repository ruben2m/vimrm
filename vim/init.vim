""""""""""""""""""""""""""""""""""""""""""
" Archivo de configuracion neovim windows 
""""""""""""""""""""""""""""""""""""""""""

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all 
" the plugins.
let mapleader=","


let dirvim="C:/Users/esrum/AppData/Local/nvim/"

" Archivo de configuracion del usuario
let filename = dirvim . ".vimrc.before"
if filereadable(expand(filename))
  exe source 'filename'
endif

set nocompatible
filetype off

set rtp+=C:/Users/esrum/AppData/Local/nvim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

source C:/Users/esrum/AppData/Local/nvim/vundles.vim

call vundle#end()
filetype plugin indent on

" Añadimos settings de los plugins
let vimplugsettings = dirvim . "plugsettings"
for fpath in split(globpath(vimplugsettings, '*.vim'), '\n')
  exe 'source' fpath
endfor


" Añadimos settings
let vimsettings = dirvim . "settings"
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
let filename = dirvim . ".vimrc.after"
if filereadable(expand(filename))
  exe source filename
endif
