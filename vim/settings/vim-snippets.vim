" ============================
" SnipMate plugin
" ============================
" Para compatibilizar con YCM, Shift + Espacio para autocompletar snippet
imap <S-Space> <Esc>a<Plug>snipMateTrigger

" next: siguiente punto en el snippet
imap <S-s>n <Plug>snipMateNextOrTrigger
smap <S-s>n <Plug>snipMateNextOrTrigger

" previous: punto anterior en el snippet
imap <S-s>p <Plug>snipMateBack
smap <S-s>p <Plug>snipMateBack

" añado fichero de snippets angular para formato html
let g:snipMate = get(g:, 'snipMate', {}) " Allow for vimrc re-sourcing
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['html'] = 'javascript,angular'
