" Use pathogen to manage runtime path
runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()

" Relative line numbers in normal mode, absolute in insert mode
set number relativenumber
autocmd InsertEnter * :set number norelativenumber
autocmd InsertLeave * :set number relativenumber
autocmd WinEnter * :set number relativenumber
autocmd WinLeave * :set number norelativenumber

" Use 5 characters for the number column
set numberwidth=5

" Solarized is nice
set background=light
colorscheme solarized

" Show path, filetype, modified on right, line and column on left
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%)

" Show list chars
set list

" Expand windows when moving into them
set winwidth=84
set winheight=10
set winminheight=10
set winheight=999

" No lines longer than 80 characters, old man
if exists('+colorcolumn')
  set colorcolumn=81
endif

" Show matching bracket when one is inserted
set showmatch

" Round to multiple of shiftwidth when using > or <
set shiftround

" Help with Press ENTER prompts
set cmdheight=2

" Remember almost every command
set history=20000

" No need for backups, you are using Git, right?
set nobackup
set nowritebackup
set noswapfile

" Write file after every command
set autowrite

" Don't (visually) wrap lines
set nowrap

" Highlight all search matches
set hlsearch
" Underline matches
highlight Search cterm=underline term=underline gui=underline

" Restore last location in file
autocmd BufReadPost *
  \ if &ft != 'gitcommit' && line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Use the Silver Searcher if available
if executable('ag')
  " Use ag instead of grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag for ctrlp for listing files
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that we don't need caching
  let g:ctrlp_use_caching = 0
endif

" Strip whitespace on save
autocmd BufWritePre *.{rb,py,js,hs,c,h,haml,erb,rake,txt} :%s/\s\+$//e

" ',' key is easier to reach than the default '\'
let mapleader=","

" Allow the mouse in every mode
set mouse=a

" Y should behave like C and D in normal mode
nnoremap Y y$

" Make Ctrl-C behave the same as Escape
imap <C-c> <ESC>

" Keep private things in .vimrc.local
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
