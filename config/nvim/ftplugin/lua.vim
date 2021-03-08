function s:exec_line() abort
  call execute(printf(":lua %s", getline(".")))
endfunction
nnoremap <Leader>ee :call <SID>exec_line()<CR>

function! s:save_and_exec() abort
  :silent! write
  :luafile %
  return
endfunction
nnoremap <Leader>eb :call <SID>save_and_exec()<CR>
