" call ToggleFile( <file> )
" 當前buffer是由此func打開 && 當前tabpage只有唯一window --> 關閉 當前buffer
" file已在當前tabpage中開啟 && 當前tabpage只有唯一window --> 關閉 file
" file 不存在於當前tabpage --> 打開file

function! s:openfile( filename)
  exe "vs " .a:filename
  let b:toggled=1  " record the buffer opened by toggle()
endfun


function! s:closefile( filename )
  call win_gotoid(bufwinid(a:filename))
  exe "q"
endfun


function! Togglefile( filename )
 " if current buffer be opened by toggle()
 " and the window is not the noly in the tabpage ,then close it
  if exists('b:toggled') && len(tabpagebuflist()) != 1
    call s:closefile('%')
    return
  endif
  " if file exist in current tabpage
  " and the file is not only window in the tabpage
  if bufwinid( a:filename ) > 0 && len(tabpagebuflist())!=1
    call s:closefile( a:filename)
    return
  endif
  if bufwinid( a:filename ) < 0
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


