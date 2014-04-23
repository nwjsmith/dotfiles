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
set number
autocmd FocusLost * :set norelativenumber
autocmd FocusGained * :set relativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

" Use 5 characters for the number column
set numberwidth=5

" Solarized is nice
set background=light
colorscheme solarized

" Show line numbers
set number

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

" Number of spaces a tab counts for
set tabstop=2
" Number of spaces a soft tab counts for
set softtabstop=2
" Number of spaces to use for auto-indent
set shiftwidth=2
" Use the right number of spaces to insert a tab
set expandtab

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
function! RestoreCursor()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction
augroup restoreCursor
  autocmd!
  autocmd BufWinEnter * call RestoreCursor()
augroup END

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
source ~/.vimrc.local
