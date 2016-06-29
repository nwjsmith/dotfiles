" Disable toolbar
set guioptions=-t

" Use console dialogs
set guioptions+=c

" Use Operator Mono
set guifont=Operator\ Mono\ Book:h16

" Keep private things in .gvimrc.local
if filereadable($HOME . "/.gvimrc.local")
  source ~/.gvimrc.local
endif
