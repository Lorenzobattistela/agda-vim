au BufRead,BufNewFile *.agda,*.lagda   setf agda


function! s:OpenAgdaBuffer()
    let agdawinnr = bufwinnr('__Agda__')
    if agdawinnr == -1
        let eventignore_save = &eventignore
        set eventignore=all
        silent keepalt botright vertical 30split __Agda__
        let &eventignore = eventignore_save
        setlocal noreadonly
        setlocal buftype=nofile
        setlocal bufhidden=hide
        setlocal noswapfile
        setlocal nobuflisted
        setlocal nolist
        setlocal nonumber
        setlocal wrap
        setlocal textwidth=0
        setlocal nocursorline
        setlocal nocursorcolumn

        if exists('+relativenumber')
            setlocal norelativenumber
        endif
    else
        execute agdawinnr . 'wincmd w'
    endif
endfunction


au BufRead,BufNewFile *.agda,*.lagda   call s:OpenAgdaBuffer()
