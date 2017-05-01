" tComment
" ========================================
" extensions for tComment plugin. Normally
" tComment maps 'gcc' to comment current line
" this adds 'gcp' comment current paragraph (block)
" using tComment's built in <c-_>p mapping
nmap <silent> gcp <c-_>p

" Command-/ to toggle comments
map <A--> :TComment<CR>
vmap <A--> :TComment<CR>
imap <A--> <Esc>:TComment<CR>i