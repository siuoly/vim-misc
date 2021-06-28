# Usage 

### timer.vim
<img src="https://github.com/siuoly/vim-misc/blob/main/image/timer_example.jpg" style="zoom:0%;" />

show `message` after `min` minutes,  

> : call RemindMessage(min,message)

show default message after `min` minutes.

> :RemindMessage `min`


<hr>


### togglefile.vim
Toggle `filename` , if current file opened by `Togglefile()` executes `Togglefile(file)`, it would be closed whatever the `file` is anything.


> :Togglefile `filename`
  
> :call Togglefile( '`filename`')

#### My togglefile.vim Usage
```vimscript
nnoremap <leader>v :call Togglefile('~/.vimrc')<CR>
nnoremap \V :call Togglefile("~/.vim/after/ftplugin/" .&ft . ".vim")<CR>
```
it can toggle the `.vimrc` , and different filetype configuration.
