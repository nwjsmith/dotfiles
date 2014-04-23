" Disable toolbar
set guioptions=-T

" Use console dialogs
set guioptions+=c

" Keep private things in .gvimrc.local
if filereadable($HOME . "/.gvimrc.local")
  source ~/.gvimrc.local
endif
