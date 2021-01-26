" Live in the present
set nocompatible
set termguicolors

" Relative line numbers in normal mode
set number relativenumber

" Use Bash for shell
set shell=/usr/bin/env\ bash

" Use 4 characters for the number column
set numberwidth=4

" Solarized is nice
set background=light
colorscheme gruvbox

set noshowmode
let g:lightline={'colorscheme':'gruvbox'}

" Show trailing whitespace
set list

" Expand windows when moving into them
set winwidth=85
set winheight=10
set winminheight=10
set winheight=999

" Wrap on word boundary
set linebreak

" No lines longer than 80 characters, old man
set colorcolumn=81

" Turn off folding
set foldmethod=manual
set nofoldenable

" Show matching bracket when one is inserted
set showmatch

" Round to multiple of shiftwidth when using > or <
set shiftround

" Help with Press ENTER prompts
set cmdheight=2

" No need for backups, you are using Git, right?
set nobackup
set nowritebackup
set noswapfile

" Write file after every command
set autowrite

" Highlight all search matches
set hlsearch
" Underline matches
highlight Search cterm=underline term=underline gui=underline
" Ignore case unless the pattern contains uppercase letters
set smartcase
" Completion with proper casing
set infercase

" Use rg instead of grep
set grepprg=rg\ --column\ --color=never

" Use fzf for fuzzy-find
map <C-p> :Files<CR>

" Key is easier to reach than the default '\'
let mapleader=' '

" Allow the mouse in every mode
set mouse=a

" Use Enter as your test key
nnoremap <silent> <Leader> :TestFile<CR>
let g:test#strategy = 'dispatch'

" Use system clipboard
set clipboard=unnamed

" Format shell scripts on save with spaces
let g:shfmt_extra_args='-i 2'

" Keep private things in .vimrc.local
if filereadable($HOME . '/.vimrc.local')
  source ~/.vimrc.local
endif
