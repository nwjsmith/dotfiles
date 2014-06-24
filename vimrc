set shell=$SHELL

" Use Vim's defaults over vi's
set nocompatible

" Use pathogen to manage runtime path
runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()

" Syntax highlighting
syntax on
filetype plugin indent on
set modeline

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

" Always show status bar
set laststatus=2

" Show file path, modified, readonly flag, help flag, preview flag on the left
set statusline=%f%M%R%H%W
" Show row/column/file length on right
set statusline+=%=%c/%l/%L

" Highlight trailing whitespace
set list listchars=tab:‣\ ,trail:·

" Expand windows when moving into them
set winwidth=84
set winheight=10
set winminheight=10
set winheight=999

" No lines longer than 80 characters, old man
if exists('+colorcolumn')
  set colorcolumn=81
endif

" UTF-8 all the things
set encoding=utf-8

" Remember almost every command
set history=20000

" Always read file changes
set autoread

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
" Show matches incrementally while typing
set incsearch
" Ignore case only when all lowercase letters are used
set ignorecase
set smartcase

" Shell-like file completion
set wildmenu
set wildmode=list:longest,list:full

" Allow backspacing over everything
set backspace=indent,eol,start

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

" Enable matchit
runtime macros/matchit.vim

" Strip whitespace on save
autocmd BufWritePre *.{rb,py,js,hs,c,h,haml,erb,rake,txt} :%s/\s\+$//e

" ',' key is easier to reach than the default '\'
let mapleader=","

" Allow the mouse in every mode
set mouse=a

" Clear search results
nnoremap <Leader><Space> :noh<CR>

" Y should behave like C and D in normal mode
nnoremap Y y$

" Make Ctrl-C behave the same as Escape
imap <C-c> <ESC>

" Keep private things in .vimrc.local
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
