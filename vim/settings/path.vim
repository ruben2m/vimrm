" Set the shell to bash so we inherit its path, to make sure
" we inherit its path. This affects :Rtags finding the right
" path to homebrewed ctags rather than the XCode version of ctags
if !has('win32')
  set shell=bash\ -i
endif