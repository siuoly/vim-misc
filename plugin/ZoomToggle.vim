
" Zoom the current window , like tmux: <prefix>z
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()

nnoremap <expr><F3> &bt=="" ? "<Cmd>ZoomToggle<CR>":"<Cmd>ZoomToggle<CR>"
tnoremap <F3> <Cmd>ZoomToggle<CR>
