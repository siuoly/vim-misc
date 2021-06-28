
function! s:openfile( filename)
  exe "vs " .a:filename
  let b:toggled=1  " record the buffer opened by toggle()
endfun


function! s:closefile( filename )
  call win_gotoid(bufwinid(a:filename))
  exe "q"
endfun

function! Togglefile( filename )
 " if current file be opened by toggle(),then close it
  if exists('b:toggled') 
    call s:closefile('%')
    return
  endif
  " if file exist in current window
  if bufwinid( a:filename ) > 0
    call s:closefile( a:filename)
  else
    call s:openfile( a:filename)
  endif
endfun

command -nargs=1 Togglefile :call Togglefile(<f-args>)

" call Togglefile('~/.vimrc')
" call Togglefile('../a.vim')
" command AA vs a | sp b

" call Togglefile('~/.vimrc')
" echo  '~/.vim/after/ftplugin/' . &ft 
" nnoremap \V :call Togglefile( '~/.vim/after/ftplugin/' . &ft .".vim" )<CR>

" call Togglefile( '~/.vim/after/ftplugin/' . &ft .".vim" )

" call Togglefile( "~/cheatsheet/" .&ft .".txt" ) | exec "normal! \<c-w>T"


