if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Open the Ag command and place the cursor into the quotes
nmap ,ag :Ack! ""<Left>
nmap ,af :AckFile ""<Left>
